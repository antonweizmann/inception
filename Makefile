all: prepare up

prepare:
	@echo "Creating directories for volumes..."
	@if [ ! -d "/home/aweizman/data/mariadb" ]; then mkdir -p /home/aweizman/data/mariadb; fi
	@if [ ! -d "/home/aweizman/data/wordpress" ]; then mkdir -p /home/aweizman/data/wordpress; fi
	@sudo chown -R aweizman:aweizman /home/aweizman/data
	@echo "directories created"

up:
	@docker compose -f srcs/docker-compose.yml up --build
