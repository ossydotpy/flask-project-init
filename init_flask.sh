#!/bin/bash
source starter_scripts.sh


app_files=("__init__.py" "models.py" "db.py" "routes.py" "forms.py")
static_folders=("css" "js" "img")


if [ "$#" -lt 2 ]; then
	echo "please specify project name or path"
	exit 0
else
	base_dir="$1"
	app_name="$2"
	mkdir -p "$base_dir"
	mkdir -p "$base_dir/$app_name"
	touch "$base_dir/.env"
	echo "SECRET_KEY=your_secret_key_here" > "$base_dir/.env"

	app_path="$base_dir/$app_name"
	mkdir -p "$app_path/templates"
	mkdir -p "$app_path/static"

	# creatng files in the app directory
	for file in "${app_files[@]}"; do
		touch "$app_path/$file"
	done

	# creating the directories in the static folder
	for path in  "${static_folders[@]}"; do
		if [ ! -d "$app_path/static/$path" ]; then
			mkdir -p "$app_path/static/$path"
		fi
	done
	touch "$app_path/templates/base.html" "$app_path/templates/index.html"

	initpy "$app_path/__init__.py" "$app_name"
	app_py "$base_dir/app.py" "$app_name"

	echo "project structure created. do you want to create a virtual environment? (Y/N)"

	read venv
	if [[ "$venv" == "Y" || "$venv" == "y" ]]; then

		echo "creating virual environment"
		cd "$base_dir"

		if [ -d "venv" ]; then
    			echo "A virtual environment already exists in this directory."
			pip install Flask Flask-SQLAlchemy Flask-WTF
			pip freeze>requirements.txt
			exit 1
		else
			python -m venv venv
			pip install Flask Flask-SQLAlchemy Flask-WTF
        		pip freeze>requirements.txt
		fi
	else
		echo "skipping virtual environment"
		echo "done"
	fi
exit 1
fi

