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