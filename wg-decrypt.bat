@echo off
SET /P _passphrase= Passphrase:
rmdir /S /Q wg-decrypted
mkdir wg-decrypted
xcopy /s /Y %1\*.* wg-decrypted
cd wg-decrypted
call :treeProcess %_passphrase%
cd ..
goto :eof

:treeProcess
for %%f in (*.gpg) do (
	echo %%~nf
	gpg --passphrase %1 --batch --output "%%~nf" -d "%%f"
	del "%%f"
)
for /D %%d in (*) do (
    cd %%d
    call :treeProcess %1
    cd ..
)
exit /b