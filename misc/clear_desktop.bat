@echo off
rem ToDo : Make it only make one archive for each day. If an archive exists, put the files in it.
rem ToDo : Have it Archive the Scratch files and make new ones. Maybe make it optional.
rem ToDo : Put the stuffs in an array or an object?
rem ToDo : Make it more readable?
rem ToDo : Have it ask for what the desktop clear contains.
rem ToDo : 

set location_of_desktop=%UserProfile%\Desktop
set location_of_desktop_clears=%UserProfile%\Desktop\stash\z_desktop_clears\

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

rem THE BELOW goto comments out useful code for creating date strings!
goto end_of_date_format_helper

echo year ^= %YY%
echo year ^= %YYYY%

echo month ^= %MM%
echo day ^= %DD%

echo hours ^= %HH%
echo minutes ^= %Min%
echo seconds ^= %Sec%

:end_of_date_format_helper

set "desktop_stash_dir_name=deskclear_%DD%%MM%%YY%_%HH%%Min%%Sec%_NEED_SORT"

echo desktop_stash_dir_name ^= %desktop_stash_dir_name%
echo location_of_desktop ^= %location_of_desktop%
echo location_of_desktop_clears ^= %location_of_desktop_clears%

cd %location_of_desktop_clears%
mkdir %desktop_stash_dir_name%

rem robocopy %location_of_desktop% %location_of_desktop_clears%\%desktop_stash_dir_name% *.* /E /XF scratch.txt scratch.docx /XD %UserProfile%\Desktop\stash\ /MOVE
robocopy "C:\Users\Benjamin Haos\Desktop" "C:\Users\Benjamin Haos\Desktop\stash\z_desktop_clears" *.* /E /XF scratch.txt scratch.docx /XD %UserProfile%\Desktop\stash\ /MOVE

pause
