SHELL := /bin/bash

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

clean:
	docker-compose down --remove-orphans

up:
	docker-compose up -d --remove-orphans

down:
	docker-compose rm -f -s

recreate:
	$(MAKE) clean
	$(MAKE) up

init:
	docker-compose exec vault vault operator init

unseal:
	for a in 1 2 3; do docker-compose exec vault vault operator unseal; done

seal:
	docker-compose exec vault vault operator seal

