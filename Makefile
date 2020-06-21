.PHONY: test
name = "docker-flask-sqlite-skeleton"

help:
	@echo
	@echo "🍶 FLASK"
	@echo
	@echo "flask:       start app"
	@echo "hc:          hit healthcheck endpoint"
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

hc:
	http http://localhost:5000/healthcheck

image:
	docker build -t $(name) .

start:
	docker run --name $(name) -p 5000:5000 $(name)

stop:
	docker stop $(name); docker ps -a

restart:
	docker restart $(name); docker ps

export:
	poetry export -f requirements.txt > requirements.txt

env:
	poetry env info

deps:
	poetry show --tree --no-dev
