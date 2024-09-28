all: prepare up

prepare:
	@echo "Creating directories for volumes..."
	@if [ ! -d "/home/aweizman/data/mariadb" ]; then mkdir -p /home/aweizman/data/mariadb; fi
	@if [ ! -d "/home/aweizman/data/wordpress" ]; then mkdir -p /home/aweizman/data/wordpress; fi
	@sudo chown -R aweizman:aweizman /home/aweizman/data
	@echo "directories created"

up:
	@docker compose -f srcs/docker-compose.yml up  --build

down:
	@docker compose -f srcs/docker-compose.yml down

fclean:
	@docker compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
	@docker volume prune -f
	@sudo rm -rf /home/aweizman/data

re: fclean prepare up

.PHONY: all prepare up down fclean re
