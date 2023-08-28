COMPOSE		=	srcs/docker-compose.yml

up:
	@cd srcs && docker compose up -d
	@echo "docker compose up completed"

down:
	@cd srcs && docker compose down

.PHONY: all up down
