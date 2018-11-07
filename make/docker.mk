$(eval $(call defw,DOCKER,docker))

.PHONY: du
du:: ##@Docker System disk usage
	@sudo su -c '$(DOCKER) system df -v'

.PHONY: prune
prune:: ##@Docker Prune docker all
	@sudo su -c '$(DOCKER) system prune -a -f'

.PHONY: pruneall
pruneall:: ##@Docker Prune docker system and images
	@sudo su -c '$(DOCKER) system prune -a -f  && $(DOCKER) image prune -f && $(DOCKER) volume prune -f && docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi'

.PHONY: install-docker
install-docker:: ##@Docker Install Docker
	@wget -qO- https://get.docker.com | bash


.PHONY: install-docker-compose
install-docker-compose:: ##@Docker Install docker-compose
	@curl -L \"https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose
	@chmod +x /usr/local/bin/docker-compose

		
