DOCKER_MACHINE=websocket-demo

build:
	docker build -t scottw/mojolicious-toolkit-websockets .

run:
	docker run -it --rm -p 8080:8080 scottw/mojolicious-toolkit-websockets

ip:
	docker-machine ip $(DOCKER_MACHINE)
