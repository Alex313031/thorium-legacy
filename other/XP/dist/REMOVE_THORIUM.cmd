@echo off

title Uninstalling Thorium...

:: Uncomment the line below to see what all is being done.
:: @echo on

rmdir /s "%PROGRAMFILES%\Thorium"

echo.
echo  Removing Shorcuts...
echo.

:: For NT 6
:: del "%USERPROFILE%\Desktop\Thorium.lnk"

:: del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Thorium.lnk"

del "%USERPROFILE%\Desktop\Thorium.lnk"

del "%USERPROFILE%\Start Menu\Programs\Thorium.lnk"

echo.
echo  Deleting Registry Entries...
echo.

reg delete HKCR\ThoriumHTM
reg delete HKLM\SOFTWARE\Clients\StartMenuInternet\Thorium

echo.
echo  Done uninstalling Thorium from %PROGRAMFILES%\Thorium
echo.
echo  INSTALL_THORIUM.cmd can be used to re-install Thorium.
echo.

title Done!

pause
