import asyncio
from bleak import BleakScanner, BleakClient

# BLE TP protocol headers
BLE_MTU = 20
TP_START = 0x00
TP_START_END = 0x20
TP_MIDDLE = 0x40
TP_END = 0x80

# Device and characteristic
DEVICE_NAME = "HSD2v30"
COPY_PNPLIKE_CHAR_UUID = "0000001b-0002-11e1-ac36-0002a5d5c51b"

def encapsulate_ble_packets(message: str):
    data = message.encode("utf-8")
    max_payload = BLE_MTU - 1
    packets = []

    if len(data) <= max_payload:
        packets.append(bytes([TP_START_END]) + data)
    else:
        i = 0
        packets.append(bytes([TP_START]) + data[i:i+max_payload])
        i += max_payload
        while i + max_payload < len(data):
            packets.append(bytes([TP_MIDDLE]) + data[i:i+max_payload])
            i += max_payload
        packets.append(bytes([TP_END]) + data[i:])
    return packets

def notification_handler(sender, data):
    try:
        decoded = data[1:].decode("utf-8")  # skip 1-byte header
    except:
        decoded = data
    print(f"[Notification] Raw: {data.hex()} | Decoded: {decoded}")

async def send_json_message(client, message: str):
    packets = encapsulate_ble_packets(message)
    for i, packet in enumerate(packets):
        await client.write_gatt_char(COPY_PNPLIKE_CHAR_UUID, packet)
        print(f"Sent packet {i+1}/{len(packets)}: {packet.hex()}")

async def main():
    print("Scanning for device...")
    address = None
    devices = await BleakScanner.discover(timeout=5)
    for d in devices:
        if d.name == DEVICE_NAME:
            address = d.address
            break

    if not address:
        print("Device not found.")
        return

    async with BleakClient(address) as client:
        print(f"Connected to {DEVICE_NAME} ({address})")
        await client.start_notify(COPY_PNPLIKE_CHAR_UUID, notification_handler)

        # 1. Sensor setup
        msg4 = "{\"get_status\":\"firmware_info\"}"
        await send_json_message(client, msg4)

        # 1. Sensor setup
        msg1 = "{\"stts22h_temp\":{\"enable\":true, \"odr\":1}}"
        await send_json_message(client, msg1)

        # 2. Start log
        msg2 = "{\"log_controller*start_log\": {\"interface\": 2}}"
        await send_json_message(client, msg2)

        # 3. Wait 5 seconds
        await asyncio.sleep(5)

        # 4. Stop log
        msg3 = "{\"log_controller*stop_log\": {\"interface\": 2}}"
        await send_json_message(client, msg3)

        # Keep listening for 10 seconds
        print("Listening for responses...")
        await asyncio.sleep(10)
        await client.stop_notify(COPY_PNPLIKE_CHAR_UUID)
        print("Done.")

asyncio.run(main())
