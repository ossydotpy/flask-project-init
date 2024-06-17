#!/bin/bash
FLASK_INIT_URL="https://raw.githubusercontent.com/ossydotpy/flask-project-init/master/init_flask.sh"
STARTER_SCRIPTS_URL="https://raw.githubusercontent.com/ossydotpy/flask-project-init/master/starter_scripts.sh"

curl -L $FLASK_INIT_URL -o /usr/local/bin/flask_init.sh
curl -L $STARTER_SCRIPTS_URL -o /usr/local/bin/starter_scripts.sh

sudo chmod +x /usr/local/bin/flask_init.sh
