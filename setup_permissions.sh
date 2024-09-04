#!/bin/bash

# Function to set permissions for Apache
setup_apache_permissions() {
    echo "Setting up permissions for Apache..."

    # Install ACL
    sudo apt-get update
    sudo apt-get install -y acl

    # Set umask
    umask 022

    # Set default ACLs for directories
    sudo setfacl -d -m u::rwx,g::r-x,o::r-x /var/www/html
    sudo setfacl -d -m u:www-data:rwx /var/www/html

    # Set default ACLs for files
    sudo setfacl -d -m u::rw-,g::r--,o::r-- /var/www/html
    sudo setfacl -d -m u:www-data:rw- /var/www/html

    # Set directory permissions to 755
    sudo find /var/www/html -type d -exec chmod 755 {} \;

    # Set file permissions to 644
    sudo find /var/www/html -type f -exec chmod 644 {} \;

    # Set ownership for all existing files and directories
    sudo chown -R www-data:www-data /var/www/html

    # Set the setgid bit on the directory
    sudo chmod g+s /var/www/html

    # Apply ACLs recursively
    sudo setfacl -R -m u::rwX,g::rX,o::rX /var/www/html
    sudo setfacl -dR -m u::rwX,g::rX,o::rX /var/www/html

    echo "Permissions for Apache have been set."
}

# Function to set permissions for LAMPP
setup_lampp_permissions() {
    echo "Setting up permissions for LAMPP..."

    # Install ACL
    sudo apt-get update
    sudo apt-get install -y acl

    # Set umask
    umask 022

    # Set default ACLs for directories
    sudo setfacl -d -m u::rwx,g::r-x,o::r-x /opt/lampp/htdocs/
    sudo setfacl -d -m u:daemon:rwx /opt/lampp/htdocs/

    # Set default ACLs for files
    sudo setfacl -d -m u::rw-,g::r--,o::r-- /opt/lampp/htdocs/
    sudo setfacl -d -m u:daemon:rw- /opt/lampp/htdocs/

    # Set directory permissions to 755
    sudo find /opt/lampp/htdocs/ -type d -exec chmod 755 {} \;

    # Set file permissions to 644
    sudo find /opt/lampp/htdocs/ -type f -exec chmod 644 {} \;

    # Set ownership for all existing files and directories to daemon
    sudo chown -R daemon:daemon /opt/lampp/htdocs/

    # Set the setgid bit on the directory
    sudo chmod g+s /opt/lampp/htdocs/

    # Apply ACLs recursively
    sudo setfacl -R -m u::rwX,g::rX,o::rX /opt/lampp/htdocs/
    sudo setfacl -dR -m u::rwX,g::rX,o::rX /opt/lampp/htdocs/

    echo "Permissions for LAMPP have been set."
}

# Prompt user for input
read -p "Are you configuring permissions for Apache or LAMPP? (apache/lampp): " server_type

# Convert to lowercase
server_type=$(echo "$server_type" | tr '[:upper:]' '[:lower:]')

# Call the appropriate function
case $server_type in
    apache)
        setup_apache_permissions
        ;;
    lampp)
        setup_lampp_permissions
        ;;
    *)
        echo "Invalid input. Please enter 'apache' or 'lampp'."
        ;;
esac
