# hashcat_wifi_dump_script
This is a simple script for hashcat hcxdumptool data capture. I made it so I don't have to type everything and/ or copy-paste all the time.

The script stops all services that are accessing WLAN devices (e.g .: NetworkManager and wpa_supplicant.service).
The script assumes you will be using wlan0 device, it will automatically add the device to the script.
You need to enter the path and the name of the output file dumpfile.pcapng
If you do not specify the path, the file will be saved in your current directory.
Data capture must be stopped manually (ctrl+c), after that the script starts all network services and runs the tool for converting dumpfile.pcapng to dumpfile.hc22000 needed by hashcat to perform password cracking
