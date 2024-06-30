#!/bin/bash


INSTALL_DIR="$HOME/bin"

# URLs for the scripts
FLASK_INIT_URL="https://raw.githubusercontent.com/ossydotpy/flask-project-init/master/init_flask.sh"
STARTER_SCRIPTS_URL="https://raw.githubusercontent.com/ossydotpy/flask-project-init/master/starter_scripts.sh"


install_script() {
    local url="$1"
    local script_name="$2"
    
    echo "Installing $script_name..."
    curl -L "$url" -o "$INSTALL_DIR/$script_name"
    chmod +x "$INSTALL_DIR/$script_name"
}


mkdir -p "$INSTALL_DIR"


install_script "$FLASK_INIT_URL" "flask_init"
install_script "$STARTER_SCRIPTS_URL" "starter_scripts"

echo "Installation complete."
