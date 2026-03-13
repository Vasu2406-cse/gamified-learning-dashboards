-- Create database user for the learning dashboard
CREATE USER IF NOT EXISTS 'learninguser'@'localhost' IDENTIFIED BY 'learning123';

-- Create database
CREATE DATABASE IF NOT EXISTS learning_dashboard;

-- Grant all privileges
GRANT ALL PRIVILEGES ON learning_dashboard.* TO 'learninguser'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;

-- Show success message
SELECT 'Database user created successfully!' AS Status;
