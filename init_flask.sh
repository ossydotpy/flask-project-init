#!/bin/bash

source starter_scripts


app_files=("__init__.py" "models.py" "db.py" "routes.py" "forms.py")
static_folders=("css" "js" "img")


usage() {
    echo "Usage: $0 PROJECT_DIRECTORY APP_NAME [OPTIONS]"
    echo "Initialize a Flask project structure."
    echo "Options:"
    echo "  -h, --help        Display this help message and exit"
    exit 1
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    usage
fi


if [ "$#" -lt 2 ]; then
    echo "Error: Please specify BASE_DIRECTORY and APP_NAME."
    usage
fi


base_dir="$1"
app_name="$2"


mkdir -p "$base_dir"
mkdir -p "$base_dir/$app_name"
touch "$base_dir/.env"
echo "SECRET_KEY=your_secret_key_here" > "$base_dir/.env"

app_path="$base_dir/$app_name"
mkdir -p "$app_path/templates"
mkdir -p "$app_path/static"


for file in "${app_files[@]}"; do
    touch "$app_path/$file"
done


for path in "${static_folders[@]}"; do
    mkdir -p "$app_path/static/$path"
done

touch "$app_path/templates/base.html" "$app_path/templates/index.html"


initpy "$app_path/__init__.py" "$app_name"
app_py "$base_dir/app.py" "$app_name"


echo "Project structure created. Do you want to create a virtual environment? (Y/N)"
read -r venv

if [[ "$venv" == "Y" || "$venv" == "y" ]]; then
    echo "Creating virtual environment..."
    cd "$base_dir"

    if [ -d "venv" ]; then
        echo "A virtual environment already exists in this directory."
        pip install Flask Flask-SQLAlchemy Flask-WTF
        pip freeze > requirements.txt
    else
        python -m venv venv
        source venv/bin/activate
        pip install Flask Flask-SQLAlchemy Flask-WTF
        pip freeze > requirements.txt
    fi
else
    echo "Skipping virtual environment setup."
fi

echo "Done."
