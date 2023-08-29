VOLUMES		=	${HOME}/data/wp\
			${HOME}/data/db

#TODO: add -d option
up: ${VOLUMES}
	@cd srcs && docker compose up --build
	@echo "docker compose up completed"

${VOLUMES}:
	mkdir -p $@

down:
	@cd srcs && docker compose down

clean: down
	sudo rm -rf ${VOLUMES}

.PHONY: all up down clean
