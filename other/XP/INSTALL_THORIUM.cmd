@echo off

title Installing Thorium...

:: Uncomment the line below to see what all is being done.
:: @echo on

mkdir "C:\Program Files\Thorium"

xcopy /Y /E /H /C /I . "C:\Program Files\Thorium"

mklink "%USERPROFILE%\Desktop\Thorium" "C:\Program Files\Thorium\thorium.exe"

mklink "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Thorium" "C:\Program Files\Thorium\thorium.exe"

echo.
echo  NOTE: "Cannot create a file when that file already exists." is not an error.
echo  It just means that the shortcuts already exist from a previous installation.
echo.
echo  Done installing Thorium for Windows XP/Vista!
echo.

title Done!

pause
