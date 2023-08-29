COMPOSE		=	srcs/docker-compose.yml

VOLUMES		=	${HOME}/data/wp\
			${HOME}/data/db

up: ${VOLUMES}
	@cd srcs && docker compose up -d
	@echo "docker compose up completed"

${VOLUMES}:
	mkdir -p $@

down:
	@cd srcs && docker compose down

.PHONY: all up down
