SHELL := /bin/bash

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

build: # Build defn/vault
	podman build -t defn/vault .

push: # Push defn/vault
	podman push defn/vault

bash: # Run bash shell with defn/vault
	docker run --rm -ti --entrypoint bash defn/vault

clean:
	docker-compose down --remove-orphans

up:
	docker-compose up -d --remove-orphans

down:
	docker-compose rm -f -s

recreate:
	$(MAKE) clean
	$(MAKE) up

logs:
	docker-compose logs -f

status:
	docker-compose exec vault \
		vault status

init:
	docker-compose exec vault \
		vault operator init \
			-recovery-shares=1 -recovery-threshold=1

migrate:
	docker-compose exec vault \
		vault operator unseal \
			-migrate
