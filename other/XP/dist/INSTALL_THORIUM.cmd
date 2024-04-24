@echo off

title Installing Thorium...

:: Uncomment the line below to see what all is being done.
:: @echo on

echo.
echo  NOTE: You should run REMOVE_THORIUM.cmd before installing 
echo   a new version of Thorium.
echo.
echo  Press Ctrl + C at the next prompt, and then press Y + Enter 
echo   when asked "Terminate batch job (Y/N)?" if you wish to stop 
echo   the installation.
echo.

pause

mkdir "%PROGRAMFILES%\Thorium"

xcopy /Y /E /H /C /I . "%PROGRAMFILES%\Thorium"

echo.
echo  Creating Shorcuts...
echo.

:: For NT 6
:: mklink "%USERPROFILE%\Desktop\Thorium" "%PROGRAMFILES%\Thorium\thorium.exe"

:: mklink "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Thorium" "%PROGRAMFILES%\Thorium\thorium.exe"

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%USERPROFILE%\Desktop\Thorium.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%PROGRAMFILES%\Thorium\thorium.exe" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs

del CreateShortcut.vbs

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut2.vbs
echo sLinkFile = "%USERPROFILE%\Start Menu\Programs\Thorium.lnk" >> CreateShortcut2.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut2.vbs
echo oLink.TargetPath = "%PROGRAMFILES%\Thorium\thorium.exe" >> CreateShortcut2.vbs
echo oLink.Save >> CreateShortcut2.vbs
cscript CreateShortcut2.vbs

del CreateShortcut2.vbs

echo.
echo  Creating Registry Entries...
echo.

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
