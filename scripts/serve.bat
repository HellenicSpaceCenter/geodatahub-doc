@ECHO OFF
SETLOCAL

SET "SCRIPT_DIR=%~dp0"
FOR %%I IN ("%SCRIPT_DIR%..") DO SET "SRC_DIR=%%~fI"

@REM activate venv
@CALL "%SRC_DIR%\.venv\Scripts\activate.bat"

@REM Load env from .env
IF EXIST "%SRC_DIR%\.env" (
    FOR /F "usebackq tokens=*" %%A IN ("%SRC_DIR%\.env") DO (
        SET "%%A"
    )
)

mkdocs serve -f "%SRC_DIR%\mkdocs.yml" -w "%SRC_DIR%"
