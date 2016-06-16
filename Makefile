git_version = $$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
docker_machine_ip = $$(docker-machine ip default)
reliable_master_port = 8083

all: test
start:
	RELIABLE_MASTER_PORT=$(reliable_master_port) docker-compose down
	RELIABLE_MASTER_PORT=$(reliable_master_port) docker-compose build
	RELIABLE_MASTER_PORT=$(reliable_master_port) docker-compose up -d --remove-orphans
