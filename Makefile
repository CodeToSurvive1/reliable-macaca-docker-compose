git_version = $$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
docker_machine_ip = $$(docker-machine ip default)

all: test
start:
	@./bootstrap.sh
	echo ${docker_machine_ip}
