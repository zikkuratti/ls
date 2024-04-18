#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install required packages
sudo apt install -y apache2 php mysql-server php-mysql unzip

# Download LimeSurvey
wget https://download.limesurvey.org/latest-master/limesurvey6.5.3+240415.zip

# Extract LimeSurvey to /var/www/html/
sudo unzip limesurvey6.5.3+240415.zip -d /var/www/html/

# Set permissions
sudo chown -R www-data:www-data /var/www/html/limesurvey
sudo chmod -R 755 /var/www/html/limesurvey

# Create MySQL database
sudo mysql -e "CREATE DATABASE IF NOT EXISTS limesurveydb;"
sudo mysql -e "CREATE USER IF NOT EXISTS 'limesurvey'@'localhost' IDENTIFIED BY 'your_password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON limesurveydb.* TO 'limesurvey'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Remove install directory
sudo rm -rf /var/www/html/limesurvey/install

echo "LimeSurvey installation completed!"
