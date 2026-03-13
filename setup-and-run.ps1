# Set JAVA_HOME to Java 17
$env:JAVA_HOME = "C:\Program Files\Java\jdk-17"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Gamified Learning Dashboard Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if MySQL is running
Write-Host "Checking MySQL service..." -ForegroundColor Yellow
$mysqlService = Get-Service -Name "MySQL*" -ErrorAction SilentlyContinue

if ($mysqlService) {
    if ($mysqlService.Status -ne "Running") {
        Write-Host "Starting MySQL service..." -ForegroundColor Yellow
        Start-Service $mysqlService.Name
        Start-Sleep -Seconds 3
    }
    Write-Host "✓ MySQL is running" -ForegroundColor Green
} else {
    Write-Host "⚠ MySQL service not found. Please ensure MySQL is installed and running." -ForegroundColor Red
    Write-Host ""
    Write-Host "To install MySQL:" -ForegroundColor Yellow
    Write-Host "1. Download from: https://dev.mysql.com/downloads/installer/" -ForegroundColor White
    Write-Host "2. Install MySQL Server" -ForegroundColor White
    Write-Host "3. Remember your root password during installation" -ForegroundColor White
    Write-Host ""
    $continue = Read-Host "Do you want to continue anyway? (y/n)"
    if ($continue -ne "y") {
        exit
    }
}

Write-Host ""
Write-Host "Setting up database..." -ForegroundColor Yellow
Write-Host "Please enter your MySQL root password when prompted." -ForegroundColor Cyan
Write-Host ""

# Try to create database user
$mysqlPath = "mysql"
$setupScript = "setup-database.sql"

# Check if mysql command is available
$mysqlExists = Get-Command mysql -ErrorAction SilentlyContinue

if ($mysqlExists) {
    Write-Host "Running database setup script..." -ForegroundColor Yellow
    & mysql -u root -p < $setupScript
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Database setup completed successfully!" -ForegroundColor Green
    } else {
        Write-Host "⚠ Database setup had issues. Continuing anyway..." -ForegroundColor Yellow
    }
} else {
    Write-Host "⚠ MySQL command not found in PATH." -ForegroundColor Yellow
    Write-Host "Please run this command manually in MySQL:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "CREATE USER 'learninguser'@'localhost' IDENTIFIED BY 'learning123';" -ForegroundColor White
    Write-Host "CREATE DATABASE IF NOT EXISTS learning_dashboard;" -ForegroundColor White
    Write-Host "GRANT ALL PRIVILEGES ON learning_dashboard.* TO 'learninguser'@'localhost';" -ForegroundColor White
    Write-Host "FLUSH PRIVILEGES;" -ForegroundColor White
    Write-Host ""
    $continue = Read-Host "Press Enter after running these commands, or 'n' to exit"
    if ($continue -eq "n") {
        exit
    }
}

Write-Host ""
Write-Host "Building and starting application..." -ForegroundColor Yellow
Write-Host ""

$mvnCmd = "maven\apache-maven-3.9.5\bin\mvn.cmd"

if (Test-Path $mvnCmd) {
    Write-Host "Starting Spring Boot application..." -ForegroundColor Green
    & $mvnCmd spring-boot:run
} else {
    Write-Host "Maven not found. Running full setup..." -ForegroundColor Yellow
    .\run.ps1
}
