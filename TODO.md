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

 - git apply --reject --ignore-space-change --recount --ignore-whitespace win7-8-8.1-support.patch

 - https://github.com/Alex313031/cr-win7/tree/c7f6d3a846d638e76e8c6dced53f0b183e70c3d4
   > https://github.com/win32ss/supermium/commit/c11cba154a847b9caed724b1825868ce0affad04
   > https://github.com/win32ss/supermium/commit/25239322846e6dc14ff57c6db2dda32f1266d9d0

 - https://github.com/win32ss/supermium/commit/eda9398979e06be019be585da04267025fbcb1fc#diff-1d869308b9cf99a717940a7206e087c34ec4cede65180dc8bd16a1b0a524be50
 - Restore Win7 WebRTC HW decoding flag (and disable by default) > https://github.com/win32ss/supermium/commit/f30478d96d1f30d668703a9cc07c29ef4c823535

 - https://source.chromium.org/chromium/chromium/src/+/056a891186fbf7b5cd3f857c331ab3ad5a69019d

 - https://bugs.chromium.org/p/chromium/issues/detail?id=1385856
