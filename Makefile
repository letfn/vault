SHELL := /bin/bash

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

build: # Build defn/vault:1.6.3
	docker build -t defn/vault:1.6.3 .

push: # Push defn/vault:1.6.3
	docker push defn/vault:1.6.3

pull : # Pull defn/vault:1.6.3
	docker pull defn/vault:1.6.3

bash: # Run bash shell with defn/vault:1.6.3
	docker run --rm -ti --entrypoint bash defn/vault:1.6.3

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

pr:
	gh pr create --web

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
