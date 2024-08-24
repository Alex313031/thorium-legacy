## TODO document for ideas and patches. Underneath each will be a comment with info or location of patch.

&#45; Adjust DPI from 300 to 72 for Windows .ico files.

 - Gimp and convert.exe to check ico sizes

&#45; Add native first run WebUI page

 - https://github.com/ungoogled-software/ungoogled-chromium/pull/2314/files

&#45; Update win scripts to work seamlessly

 - https://github.com/Alex313031/thorium/tree/main/win_scripts

&#45; Re-evaluate vector icons and webui images for CR23 refresh

 - To keep .icons correct

&#45; Add new Thorium shortcuts to ThoriumOS Shortcuts App

 - For ChromeOS only: If you plan on adding a new accelerator and want it
 displayed in the Shortcuts app, please follow the instructions at: `ash/webui/shortcut_customization_ui/backend/accelerator_layout_table.h`.

### Notes

## .grd text replacements (search with grep), because there are a few places we want to tweak some strings.

Chromium > Thorium
Chrome > Thorium
Google Thorium > Thorium
Google recommends Thorium > Alex313031 recommends Thorium
Thorium Web Store > Chrome Web Store (Except some UI elements like NTP)
Thorium Remote Desktop > Chrome Remote Desktop
ThoriumOS Flex > ThoriumOS
made possible by Thorium > Chromium
Experiments > Thorium Experiments
Aw, Snap! > Aw, #@%!, this tab's process has gone bye bye...
Dino strings in components/error_page_strings.grdp

 - Add GPC patch

 - Re-add FILL_RULE_NONZERO, to bookmark_chrome_refresh.icon back_arrow_chrome_refresh.icon forward_arrow_chrome_refresh.icon

## Windows 7 Specific

 - git apply --reject --ignore-space-change --recount --ignore-whitespace win7-8-8.1-support_thorium.patch
 - git apply --reject --whitespace=fix win7-8-8.1-support_thorium.patch

 - https://github.com/Alex313031/cr-win7/tree/c7f6d3a846d638e76e8c6dced53f0b183e70c3d4
   > https://github.com/win32ss/supermium/commit/c11cba154a847b9caed724b1825868ce0affad04
   > https://github.com/win32ss/supermium/commit/25239322846e6dc14ff57c6db2dda32f1266d9d0

 - Fix thorium_shell

 - https://source.chromium.org/chromium/chromium/src/+/3682d7432ea6d3a50661ca565759509a57fe3d4c

 - https://source.chromium.org/chromium/chromium/src/+/056a891186fbf7b5cd3f857c331ab3ad5a69019d

C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\x86\
C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\x64\

look up how to add flag, feature flag, commandline, and gui, and multi option flag in docs (maybe just look up dding flags in general)

add feature flags for some thorium stuff maybe? add one for reload right click menu

chrome://tab-search.top-chrome/

fix session buddy and find out wqhen websql is removed and find out how to migrate to indexdb or other alternatives

Compare src difference between M122 and thorium-legacy, add to 124
Compare non-src difference and update
Update FTP, ffmpeg, and AC3 patches
Update main patches
Update skia-supermium and pdfium-supermium and patches
Backport stuff from M126 including MIDI and privacy snadbox patches

Make hover over link always show full url without delay
