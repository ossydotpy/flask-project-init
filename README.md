# About
bash script to initialize skeleton for flask projects
includes automated python virtual environment setup 

## Installation

Follow these steps to install and set up the `flask_init` script on your system.

### Prerequisites

Before installing, ensure you have the following prerequisites:

- Unix-like operating system (Linux/macOS)
- `curl` command-line tool (typically pre-installed on most Unix-like systems)
- Basic understanding of shell scripting
- flask
	```pip install Flask```


### Installation Steps

1. **Download the Script:**

   Open your terminal and run the following command to download the `flask_init` script:

   ```bash
   curl -L https://raw.githubusercontent.com/ossydotpy/flask-project-init/master/flask_init.sh -o /usr/local/bin/flask_init
This command downloads the script and saves it as /usr/local/bin/flask_init.

2. **Make the Script Executable:**

    Next, make the script executable by running:
    ```sudo chmod +x /usr/local/bin/flask_init```
This command grants executable permissions to the flask_init script.

3. **Verify Installation:**
To verify that the installation was successful, you can run flask_init from your terminal:
	```bash flask_init --help
	```
    If installation was successful, you should see the help message for flask_init.

**Usage**

Once installed, you can use flask_init to set up a new Flask project or perform specific tasks related to Flask project initialization.

Example usage:

	```flask_init pathtofolder projectname```
This command initializes a new Flask project named projectname.


**Troubleshooting**

    Permission Denied: If you encounter permission errors when running flask_init, ensure you have appropriate permissions or use sudo where necessary.
    Script Not Found: If flask_init is not found after installation, double-check the installation steps and ensure /usr/local/bin is in your PATH.

**Contributing**

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request 
