@echo off

set iss_compiler=

if %PROCESSOR_ARCHITECTURE%==x86 (
    Set RegQry="HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Inno Setup 5_is1"
) else (
    Set RegQry="HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Inno Setup 5_is1"
)

if not defined iss_compiler (
    for /F "tokens=2*" %%a in ('reg query %RegQry% /v InstallLocation ^|findstr InstallLocation') do set iss_compiler=%%b
)

if defined iss_compiler (
    "%iss_compiler%\ISCC.exe" %1
) else (
    echo "Error, build system cannot find ISCC! Please reinstall or add it to the batch file variable iss_compiler."
)