@echo off

title Installing Thorium...

:: Uncomment the line below to see what all is being done.
:: @echo on

mkdir "C:\Program Files\Thorium"

xcopy /Y /E /H /C /I . "C:\Program Files\Thorium"

echo.
echo  Creating Shorcuts...
echo.

:: For NT 6
:: mklink "%USERPROFILE%\Desktop\Thorium" "C:\Program Files\Thorium\thorium.exe"

:: mklink "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Thorium" "C:\Program Files\Thorium\thorium.exe"

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%USERPROFILE%\Desktop\Thorium.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\Program Files\Thorium\thorium.exe" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs

del CreateShortcut.vbs

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut2.vbs
echo sLinkFile = "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Thorium.lnk" >> CreateShortcut2.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut2.vbs
echo oLink.TargetPath = "C:\Program Files\Thorium\thorium.exe" >> CreateShortcut2.vbs
echo oLink.Save >> CreateShortcut2.vbs
cscript CreateShortcut2.vbs

del CreateShortcut2.vbs

reg import HKCR.reg
reg import HKLM.reg

echo.
echo  NOTE: "Cannot create a file when that file already exists." is not an error.
echo  It just means that the shortcuts already exist from a previous installation.
echo.
echo  Done installing Thorium for Windows XP/Vista!
echo.

title Done!

pause
