.PHONY: test

help:
	@echo
	@echo "🍶 FLASK"
	@echo
	@echo "flask:       start app"
	@echo "index:       hit index route"
	@echo
	@echo "🚢 DOCKER"
	@echo
	@echo "image:       build image"
	@echo "start:       start container"
	@echo "stop:        stop container"
	@echo "restart:     restart container"
	@echo
	@echo "📦 DEPENDENCIES"
	@echo
	@echo "export:      export Poetry dependencies to requirements.txt"
	@echo "env:         show environment info"
	@echo "deps:        list prod dependencies"
	@echo

flask:
	poetry run flask run

index:
	open http://localhost:5000/index

image:
	docker build -t docker-flask-sqlite-skeleton .

start:
	docker run --name docker-flask-sqlite-skeleton -p 5000:5000 docker-flask-sqlite-skeleton

stop:
	docker stop docker-flask-sqlite-skeleton; docker ps -a

restart:
	docker restart docker-flask-sqlite-skeleton; docker ps

export:
	poetry export -f requirements.txt > requirements.txt

env:
	poetry env info

deps:
	poetry show --tree --no-dev
