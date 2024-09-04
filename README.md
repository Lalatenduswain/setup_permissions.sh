# Setup Permissions For Apache / LAMPP Web Server

## Overview

This repository contains the `setup_permissions.sh` bash script designed to set up and manage file permissions and ownership for Apache and LAMPP environments. The script installs necessary packages, sets default file permissions, and applies ACLs to ensure that your web server environment maintains the correct settings.

## Prerequisites

Before running the script, make sure you have the following prerequisites:

1. **Operating System**: This script is designed for Debian-based Linux distributions (e.g., Ubuntu).
2. **Packages**:
   - `acl` (used for managing Access Control Lists)
3. **Permissions**: You need `sudo` privileges to execute the script.

## Installation

### Cloning the Repository

To get started, clone the repository using the following command:

```bash
git clone https://github.com/Lalatenduswain/setup_permissions.sh.git
cd setup_permissions.sh
```

### Script Details

The script is named `setup_permissions.sh` and performs the following actions based on user input:

1. Installs the `acl` package.
2. Sets the `umask` to `022` to define default permissions for newly created files.
3. Configures default ACLs for directories and files for both Apache and LAMPP environments.
4. Adjusts file and directory permissions.
5. Sets ownership to `www-data` for Apache or `daemon` for LAMPP.

## Usage

1. **Make the Script Executable**:

   ```bash
   chmod +x setup_permissions.sh
   ```

2. **Run the Script**:

   Execute the script with the following command:

   ```bash
   ./setup_permissions.sh
   ```

   The script will prompt you to specify whether you are configuring permissions for Apache or LAMPP. Enter `apache` or `lampp` based on your environment.

## Example

Here is an example of running the script for Apache:

```bash
./setup_permissions.sh
```

**Prompt:**
```
Are you configuring permissions for Apache or LAMPP? (apache/lampp):
```

Enter `apache` and the script will handle the configuration.

## Disclaimer | Running the Script

**Author:** Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.

## Donations

If you find this script useful and want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain).

## Support or Contact

Encountering issues? Don't hesitate to submit an issue on our [GitHub page](https://github.com/Lalatenduswain/setup_permissions.sh/issues).
