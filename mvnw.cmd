@REM Maven Wrapper startup script for Windows
@echo off
setlocal

set ERROR_CODE=0
set MAVEN_PROJECTBASEDIR=%~dp0

if not "%JAVA_HOME%" == "" goto OkJHome
echo Error: JAVA_HOME not found in your environment.
echo Please set the JAVA_HOME variable to match the location of your Java installation.
goto error

:OkJHome
if exist "%JAVA_HOME%\bin\java.exe" goto init
echo Error: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
goto error

:init
set MAVEN_CMD_LINE_ARGS=%*
set WRAPPER_JAR="%MAVEN_PROJECTBASEDIR%.mvn\wrapper\maven-wrapper.jar"
set WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

"%JAVA_HOME%\bin\java.exe" -cp %WRAPPER_JAR% "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" %WRAPPER_LAUNCHER% %MAVEN_CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
set ERROR_CODE=1

:end
exit /B %ERROR_CODE%
