git_version = $$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
docker_machine_ip = $$(docker-machine ip default)
reliable_master_port = 8080

all: test
start:
	RELIABLE_MASTER_PORT=$(reliable_master_port) docker-compose down
	RELIABLE_MASTER_PORT=$(reliable_master_port) docker-compose build
	RELIABLE_MASTER_PORT=$(reliable_master_port) docker-compose up -d --remove-orphans

start-with-data:
	tar -zxvf backup.tar.gz
	cp -r backup /var/mongo/data/db
	RELIABLE_MASTER_PORT=$(reliable_master_port) docker-compose down
	RELIABLE_MASTER_PORT=$(reliable_master_port) docker-compose build
	RELIABLE_MASTER_PORT=$(reliable_master_port) docker-compose up -d --remove-orphans
	docker exec -it reliable_mongo mongorestore -d reliable /data/db/backup/reliable
	rm -rf backup
