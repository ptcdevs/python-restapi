#!make

user=ptcdevs
export

venv-terminal:
	@echo "source ./venv/bin/activate"

requirements:
	pip install -r requirements.txt

dev-run:
	uvicorn app.main:app --reload

docker-build:
	docker build -t ghcr.io/ptcdevs/python-backend:latest .

docker-run:
	docker run -p 8000:8000 --name python-backend-latest ghcr.io/ptcdevs/python-backend:latest

docker-login:
	echo ${GITHUB_TOKEN} | docker login ghcr.io -u ${user} --password-stdin

docker-push:
	docker push ghcr.io/ptcdevs/python-backend:latest

docker-all:	docker-build docker-push

