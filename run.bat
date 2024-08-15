@echo off
REM Update the local repository
echo Updating the local repository...
git pull origin main
if errorlevel 1 exit /b 1

REM Start the playit.gg service in the background
echo Starting playit.gg service...

REM Start the Minecraft server
echo Starting Minecraft server...
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.20.1-47.3.0/win_args.txt %*
if errorlevel 1 exit /b 1

REM Commit and push changes
echo Committing and pushing changes...
git commit -am "Auto commit"
if errorlevel 1 exit /b 1
git push origin main
if errorlevel 1 exit /b 1

pause
