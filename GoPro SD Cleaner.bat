@echo off

setlocal
call :setESC
cls

echo %ESC%[32mPlease enter drive letter of GoPro SD card%ESC%[0m
set /p DriveLetter=

%DriveLetter%:
cd DCIM\100GOPRO


set StartCount=0
for %%x in (*) do set /a StartCount+=1


echo %ESC%[32mDelete all THM and LRV files? (y/n)%ESC%[0m
set /p confirm=

if %confirm%==y goto action
if %confirm% NEQ y goto close

:action

del /s *.THM
del /s *.LRV


set EndCount=0
for %%x in (*) do set /a EndCount+=1


set /a StartCount-=EndCount

echo %ESC%[32m%StartCount% Items have been deleted%ESC%[0m
set /p poopoo= 
:close

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0