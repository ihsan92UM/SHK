#!/usr/bin/env python
# coding: utf-8
# *****************************************************************************
#  * @file    PnPL_Command_Send_USB.py
#  * @author  SRA ( all imports ) - Ihsan
#  * @version 1.0.0
#  * @date    23-May-2025
# *****************************************************************************
# All imports are copied from stdatalog_API_examples_HSDLink.py code


# This script has to be inside the ./stdatalog_examples/function_tests/ folder


import sys
import os

# Add the STDatalog SDK root directory to the sys.path to access the SDK packages
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

import time
from threading import Event
from stdatalog_core.HSD_link.HSDLink import HSDLink, SensorAcquisitionThread
from stdatalog_pnpl.PnPLCmd import PnPLCMDManager


def main():

    # change the "path/to/your/acquisition_folder" with the path in which the acquisition folder will be saved
    acquisition_folder = "C:/Users/Ihsan/Desktop/SHK/acquisition_folder"

    # Create an instance of HSDLink
    hsd_link = HSDLink()

    # Create the appropriate HSDLink instance based on the connected board
    hsd_link_instance = hsd_link.create_hsd_link(dev_com_type='st_hsd', acquisition_folder=acquisition_folder)

    if hsd_link is None:
        print("No compatible devices connected.")
        return

    # Get the version of the HSDLink instance
    version = hsd_link.get_version(hsd_link_instance)
    print(f"HSDLink Version: {version}")
    if version != "High Speed Datalog DLL v2":
        print("this is a test script for DATALOG2. Wrong FW detected.")
        quit()

    print("\n \n")

    # Get the list of connected devices
    devices = hsd_link.get_devices(hsd_link_instance)
    #print(f"Connected Devices: {devices}")

    if not devices:
        print("No devices found.")
        return

    # Use the first connected device for demonstration
    device_id = 0

    print("\n \n")

    print("\n Manually setting up temperature sensor \n")

    # Set properties
    # Disable all other sensor
    message = "{\"lis2du12_acc\":{\"enable\":false}}"
    #message = PnPLCMDManager.create_set_property_cmd("stts22h_temp", "enable", False)
    print(hsd_link.send_command(hsd_link_instance, device_id, message))

    message = "{\"lis2mdl_mag\":{\"enable\":false}}"
    #message = PnPLCMDManager.create_set_property_cmd("stts22h_temp", "enable", False)
    print(hsd_link.send_command(hsd_link_instance, device_id, message))

    message = "{\"lps22df_press\":{\"enable\":false}}"
    #message = PnPLCMDManager.create_set_property_cmd("stts22h_temp", "enable", False)
    print(hsd_link.send_command(hsd_link_instance, device_id, message))

    message = "{\"mp23db01hp_mic\":{\"enable\":false}}"
    #message = PnPLCMDManager.create_set_property_cmd("stts22h_temp", "enable", False)
    print(hsd_link.send_command(hsd_link_instance, device_id, message))

    message = "{\"lsm6dsv16x_acc\":{\"enable\":false}}"
    #message = PnPLCMDManager.create_set_property_cmd("stts22h_temp", "enable", False)
    print(hsd_link.send_command(hsd_link_instance, device_id, message))

    message = "{\"lsm6dsv16x_gyro\":{\"enable\":false}}"
    #message = PnPLCMDManager.create_set_property_cmd("stts22h_temp", "enable", False)
    print(hsd_link.send_command(hsd_link_instance, device_id, message))

    message = "{\"lsm6dsv16x_mlc\":{\"enable\":false}}"
    #message = PnPLCMDManager.create_set_property_cmd("stts22h_temp", "enable", False)
    print(hsd_link.send_command(hsd_link_instance, device_id, message))

    print("\n########### Setting Up Log Controllers time ############\n")


    message = "{\"stts22h_temp\":{\"enable\":true, \"odr\":1}}"
    print(PnPLCMDManager.create_set_property_cmd("stts22h_temp", "enable", True ))
    print(hsd_link.send_command(hsd_link_instance, device_id, message))

    # print(PnPLCMDManager.create_command_cmd("log_controller", "start_log", "interface", 1))
    # message = PnPLCMDManager.create_command_cmd("log_controller", "start_log", "interface", 1)
    # print(hsd_link.send_command(hsd_link_instance, device_id, message))
    #
    # time.sleep(10)
    #
    # print(PnPLCMDManager.create_command_cmd("log_controller", "stop_log", "interface", 1))
    # message = PnPLCMDManager.create_command_cmd("log_controller", "stop_log", "interface", 1)
    # print(hsd_link.send_command(hsd_link_instance, device_id, message))



    message = "{\"log_controller*start_log\": {\"interface\": 1}}"
    print(hsd_link.send_command(hsd_link_instance, device_id, message))

    time.sleep(10)


    message = "{\"log_controller*stop_log\": {\"interface\": 1}}"
    print(hsd_link.send_command(hsd_link_instance, device_id, message))




    print("\n---> End of HSDLink APIs test script.")


if __name__ == "__main__":
    main()




