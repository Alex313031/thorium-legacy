## TODO document for ideas and patches. Underneath each will be a comment with info or location of patch.

&#45; Adjust DPI from 300 to 72 for Windows .ico files.

 - Gimp and convert.exe to check ico sizes

&#45; Add native first run WebUI page

 - https://github.com/ungoogled-software/ungoogled-chromium/pull/2314/files

&#45; Update win scripts to work seamlessly

 - https://github.com/Alex313031/thorium/tree/main/win_scripts

### Notes

 - Do a full, manual, one by one file check rebase, to pick up any inconsistencies, and clean up code.

## .grd text replacements (search with grep), because there are a few places we want to tweak some strings.

Google recommends Thorium > Alex313031 recommends Thorium

violates the Thorium > violates the Chrome 

Chromium > Thorium
Chrome > Thorium
Google Thorium > Thorium
Thorium Web Store > Chrome Web Store (Except some UI elements like NTP)
Thorium Remote Desktop > Chrome Remote Desktop
ThoriumOS Flex > ThoriumOS
made possible by Thorium > Chromium
Experiments > Thorium Experiments

### Windows 7 Specific

 - Restore Win7 WebRTC HW decoding flag (and disable by default) > https://source.chromium.org/chromium/chromium/src/+/3682d7432ea6d3a50661ca565759509a57fe3d4c
