REM xemu Frontend Configurator
REM Backs up original config, and edits dvd_path value
REM Everything is put back as it was when the script terminates

PUSHD %~dp0

SET XEMU_CONFIG=%appdata%\xemu\xemu\xemu.ini
SET XEMU_CONFIG_BACKUP=%appdata%\xemu\xemu\xemu.ini.back
SET GAME_PATH=%1

COPY %XEMU_CONFIG% %XEMU_CONFIG_BACKUP%

initool.exe s %XEMU_CONFIG% system dvd_path %GAME_PATH% > temporary.ini
MOVE /y temporary.ini %XEMU_CONFIG%

START /WAIT xemuw.exe

DEL %XEMU_CONFIG%
MOVE %XEMU_CONFIG_BACKUP% %XEMU_CONFIG%
POPD