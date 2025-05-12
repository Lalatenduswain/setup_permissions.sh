#!/bin/bash

WEB_DIR="/var/www/html"
DEV_USER="ubuntu"
WEB_GROUP="www-data"

# Add ubuntu to www-data group
sudo usermod -aG $WEB_GROUP $DEV_USER

# Change ownership: ubuntu as user, www-data as group
sudo chown -R $DEV_USER:$WEB_GROUP $WEB_DIR

# Set correct permissions
sudo find $WEB_DIR -type d -exec chmod 2775 {} \;  # 2 = setgid, 7/7/5 = rwx/rwx/r-x
sudo find $WEB_DIR -type f -exec chmod 664 {} \;   # 6/6/4 = rw-/rw-/r--

# Set umask for current shell (optional)
umask 002

# Set ACLs so www-data and ubuntu both have full access
sudo apt install acl -y  # Skip if already installed

# Default ACLs (for new files and dirs)
sudo setfacl -R -m u:$DEV_USER:rwx $WEB_DIR
sudo setfacl -R -m u:$WEB_GROUP:rwx $WEB_DIR
sudo setfacl -dR -m u:$DEV_USER:rwx $WEB_DIR
sudo setfacl -dR -m u:$WEB_GROUP:rwx $WEB_DIR

echo "✅ Setup complete. '$DEV_USER' and '$WEB_GROUP' can now collaborate on $WEB_DIR"
echo "🔄 Please log out and log back in for group changes to take effect."
