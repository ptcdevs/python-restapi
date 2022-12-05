#!make

venv-terminal:
	source ./venv/bin/activate

requirements:
	pip install -r requirements.txt

dev-run:
	uvicorn app.main:app --reload

prod-run:
	echo "TBA, something w/gunicorn"

docker-build: