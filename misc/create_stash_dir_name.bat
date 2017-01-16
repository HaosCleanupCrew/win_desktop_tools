@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

echo year ^= %YY%
echo year ^= %YYYY%

echo month ^= %MM%
echo day ^= %DD%

echo hours ^= %HH%
echo minutes ^= %Min%
echo seconds ^= %Sec%

set "START_STRING=desktp_clear"
set "desktop_stash_dir_name=%START_STRING%_%MM%_%DD%_%YY%_%HH%%Min%%Sec%"
echo %desktop_stash_dir_name%

pause
