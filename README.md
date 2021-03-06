SEPUpdate
=========

This powershell script will update the version of Symantec Endpoint Protection provided you have a binary for the new version.

DISCLAIMER:

You will need to modify a couple items in this script for it to work for you.

	1) Line 3, you will need to modify the version number, if the version you are upgrading to is not 12.1.671.4971

	2) Line 4, you will need to change adminPassword to match the Symantec administration password you have set up. If you do not have one set then comment this line out.

	3) Line 8, you will need to change "<PATH TO THE NEW SEP INSTALLER>" to match the correct path to the update binary.


INFO:

This script will check the registry for the current version of SEP you are running. It will then check the version number on Line 3 and if it doesn't match it will proceed to stop the SEP client and remove the uninstall password registry entries. After removing the registry entries (which would force user input) the script creates a registry entry in RunOnce for the updated binary that you have. After it creates the RunOnce entry the script uninstalls the old version of SEP. I did not put a shutdown or reboot command in this because the SEP uninstall period is unpredictable and if you reboot before it finishes then there may be complications with the installation of the new version.

If the script detects that the version of SEP you are trying to install matches the version currently installed it will end the script with a message stating the client is up to date.
