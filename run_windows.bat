@echo off
setlocal

rem Set up prog to be the path of this script, including following symlinks,
rem and set up progdir to be the fully-qualified pathname of its directory.
set prog=%~f0

rem Change current directory and drive to where the script is, to avoid
rem issues with directories containing whitespaces.
cd /d %~dp0

rem Get the CWD as a full path with short names only (without spaces)
for %%i in ("%cd%") do set prog_dir=%%~fsi

rem Check we have a valid Java.exe in the path.
set java_exe=
call tools\find_java.bat
if not defined java_exe goto :EOF

set jarpath=iDebugTool.jar

:JarFileOk
if debug NEQ "%1" goto SetPath
    set java_debug=-agentlib:jdwp=transport=dt_socket,server=y,address=8050,suspend=y
    shift 1

:SetPath
echo Java Found = %java_exe%
@echo on
call %java_exe% -Xms512m -Xmx2048m %java_debug% -Didevicetool.IDeviceTool.bindir=%prog_dir% -classpath "%jarpath%" idevicetool.IDeviceTool %*