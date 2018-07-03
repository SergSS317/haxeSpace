@echo off
::Go up a folder, so khamake is called from the right directory
cd ..\

echo ___________________________________
echo khamake builder
echo type q to quit.
echo ___________________________________
::Target input.
:platform_input
 



::Options input.




::If the input is valid call Hake
::If True is not defined ( no valid target ) jump back to the start

   start /b /wait %opt% node Kha\make html5 --compile


:end_of_file

echo ___________________________________
pause
