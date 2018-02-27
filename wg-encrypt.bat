@echo off
SET /P _passphrase= Passphrase:
rmdir /S /Q .\wg-encrypted\
mkdir .\wg-encrypted
xcopy /s /Y %1\*.* .\wg-encrypted\
cd .\wg-encrypted\
call :treeProcess %_passphrase%
cd ..
goto :eof

:treeProcess
for %%f in (*.*) do (
	echo %%f encrypted
	gpg --output "%%f.gpg" --cipher-algo AES256 --passphrase %1 --batch --symmetric "%%f"
	del "%%f"
)
for /D %%d in (*) do (
    cd %%d
    call :treeProcess %1
    cd ..
)
exit /b