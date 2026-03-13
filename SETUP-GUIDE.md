# Quick Setup Guide

## Prerequisites
1. ✅ Java 17 (Already installed)
2. ✅ Maven (Auto-downloaded by script)
3. ❓ MySQL Server (Need to verify)

## Setup Steps

### Option 1: Automated Setup (Recommended)

Run this command in PowerShell:
```powershell
cd backend
.\setup-and-run.ps1
```

This script will:
- Check if MySQL is running
- Create database user: `learninguser` with password: `learning123`
- Create database: `learning_dashboard`
- Build and run the application

**You'll need to enter your MySQL root password when prompted.**

---

### Option 2: Manual Setup

#### Step 1: Setup MySQL Database

Open MySQL Command Line or MySQL Workbench and run:

```sql
CREATE USER 'learninguser'@'localhost' IDENTIFIED BY 'learning123';
CREATE DATABASE IF NOT EXISTS learning_dashboard;
GRANT ALL PRIVILEGES ON learning_dashboard.* TO 'learninguser'@'localhost';
FLUSH PRIVILEGES;
```

#### Step 2: Run the Application

```powershell
cd backend
.\run.ps1
```

---

## Verify MySQL Installation

Check if MySQL is installed:
```powershell
Get-Service -Name "MySQL*"
```

If not installed, download from: https://dev.mysql.com/downloads/installer/

---

## Access the Application

Once running:
- **Backend API**: http://localhost:8080
- **Frontend**: Open `frontend/index.html` in your browser

---

## Default Database Credentials

The application is configured with:
- **Username**: learninguser
- **Password**: learning123
- **Database**: learning_dashboard

You can change these in: `backend/src/main/resources/application.properties`

---

## Troubleshooting

### MySQL Connection Error
If you see "Access denied for user":
1. Make sure MySQL is running
2. Verify you ran the database setup SQL commands
3. Check credentials in `application.properties`

### Port 8080 Already in Use
If port 8080 is busy, change it in `application.properties`:
```properties
server.port=8081
```

### MySQL Not Found
Add MySQL to your PATH or use full path:
```powershell
& "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p
```

---

## Next Steps

1. Run the backend: `.\setup-and-run.ps1`
2. Open frontend: `frontend/index.html`
3. Register a new user
4. Start taking quizzes!
