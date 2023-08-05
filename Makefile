SERVICES	= mariadb\
			  wordpress\
			  nginx

MAIN_COMPOSE= srcs/docker-compose.yml

VOLUMES_ROOT= $(HOME)/data
VOLUMES		= wordpress\
			  db
VOLUMES_OPT	= -o type=none -o o=bind -o device=$<

#
up: $(VOLUMES) #$(NETWORKS)
	docker compose -f $(MAIN_COMPOSE) -d up

down:
	docker compose -f $(MAIN_COMPOSE) down

$(SERVICES): $(VOLUMES) #$(NETWORKS)
	docker compose -f $(MAIN_COMPOSE) up $@

# volumes
$(VOLUMES): %: $(VOLUMES_ROOT)/%/
	docker volume create $(VOLUMES_OPT) $@_volume 

$(VOLUMES_ROOT)/*: $(VOLUMES_ROOT)
	mkdir $@

$(VOLUMES_ROOT):
	mkdir $@

# networks
#(NETWORKS):
#	docker network create

#
.PHONY: all
