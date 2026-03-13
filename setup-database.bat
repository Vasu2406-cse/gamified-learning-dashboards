@echo off
echo ========================================
echo   MySQL Database Setup
echo ========================================
echo.
echo This will create a database user for the application.
echo You'll need to enter your MySQL root password.
echo.
echo If MySQL is not in your PATH, the script will try common locations.
echo.
pause

REM Try to find MySQL
set MYSQL_CMD=mysql
where mysql >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo MySQL not in PATH, trying common locations...
    if exist "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" (
        set MYSQL_CMD="C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"
        echo Found MySQL at: C:\Program Files\MySQL\MySQL Server 8.0\bin\
    ) else if exist "C:\Program Files\MySQL\MySQL Server 8.4\bin\mysql.exe" (
        set MYSQL_CMD="C:\Program Files\MySQL\MySQL Server 8.4\bin\mysql.exe"
        echo Found MySQL at: C:\Program Files\MySQL\MySQL Server 8.4\bin\
    ) else if exist "C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" (
        set MYSQL_CMD="C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe"
        echo Found MySQL at: C:\Program Files\MySQL\MySQL Server 5.7\bin\
    ) else (
        echo ERROR: MySQL not found!
        echo Please run these commands manually in MySQL:
        echo.
        type setup-database.sql
        echo.
        pause
        exit /b 1
    )
)

echo.
echo Running database setup...
echo Please enter your MySQL root password when prompted:
echo.

%MYSQL_CMD% -u root -p < setup-database.sql

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   Database setup completed!
    echo ========================================
    echo.
    echo Database user created:
    echo   Username: learninguser
    echo   Password: learning123
    echo   Database: learning_dashboard
    echo.
) else (
    echo.
    echo ========================================
    echo   Setup failed or was cancelled
    echo ========================================
    echo.
    echo Please run these commands manually in MySQL:
    echo.
    type setup-database.sql
    echo.
)

pause
