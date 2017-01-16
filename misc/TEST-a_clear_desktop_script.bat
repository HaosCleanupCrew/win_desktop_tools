@echo off

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"

set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "START_STRING=desktp_clear"
set "desktop_stash_dir_name=%START_STRING%_%MM%_%DD%_%YY%_%HH%%Min%%Sec%"

goto skip_this_one
:skip_this_one

mkdir %desktop_stash_dir_name%

set location_of_desktop=%UserProfile%\Desktop

set "src=%location_of_desktop%"
set "dest=%CD%\%desktop_stash_dir_name%"
set "comment_file=%dest%\a_comment_on_these_files.md"

robocopy "%src%" "%dest%" *.* /E /XF scratch.txt scratch.docx /XD "%src%\stash" /MOVE

set /p comments=Enter comments on cleared items : 

echo Scripted Desktop Clear.>"%comment_file%"
echo.>>"%comment_file%"
echo Called : at %HH%:%Min%:%Sec% on %MM%/%DD%/%YYYY%.>>"%comment_file%"

echo.>>"%comment_file%"
echo Comment(s):>>"%comment_file%"

echo.>>"%comment_file%"
echo %comments%>>"%comment_file%"


rem pause
goto skip_this_two
...skip this...
:skip_this_two

rem DONE : Have it add a comment file.

rem ToDo : Make it only make one archive for each day. If an archive exists, put the files in it.
rem ToDo : Have it Archive the Scratch files and make new ones. Maybe make it optional.
rem ToDo : Put the stuffs in an array or an object?
rem ToDo : Make it more readable?
rem ToDo : Have it ask for what the desktop clear it makes, should or should not contain.
rem ToDo : Have it offer to push to a remote repo?
rem ToDo :
