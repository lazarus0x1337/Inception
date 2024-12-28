CMD = docker-compose -f srcs/docker-compose.yml -p inception
all: build up

build:
	$(CMD) build

up:
	$(CMD) up -d

down:
	$(CMD) down

clean:
	$(CMD) down -v

ps:
	$(CMD) ps

fclean: down
	$(CMD) down --rmi all -v
	docker system prune -af