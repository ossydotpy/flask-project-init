#!/bin/bash

initpy(){
    local filename="$1"
    local app_name="$2"
    cat > "$filename" <<EOF
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv
import os

load_dotenv()

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'
app.config['SECRET_KEY'] = os.getenv("SECRET_KEY")

db = SQLAlchemy(app=app)

from $app_name import routes
EOF
}

app_py(){
    local filename="$1"
    local app_name="$2"
    cat > "$filename" <<EOF
from $app_name import app

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=4000, debug=True)
EOF
}

