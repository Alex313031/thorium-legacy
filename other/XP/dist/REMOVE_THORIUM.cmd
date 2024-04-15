@echo off

title Uninstalling Thorium...

:: Uncomment the line below to see what all is being done.
:: @echo on

deltree "C:\Program Files\Thorium"

echo.
echo  Removing Shorcuts...
echo.

:: For NT 6
:: del "%USERPROFILE%\Desktop\Thorium.lnk"

:: del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Thorium.lnk"

del "%USERPROFILE%\Desktop\Thorium.lnk"

del "%USERPROFILE%\Start Menu\Programs\Thorium.lnk"

reg import HKCR.reg
reg import HKLM.reg

echo.
echo  Done removing Thorium from C:\Program Files\Thorium
echo.

title Done!

pause
