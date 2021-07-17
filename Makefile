all:
	cd ./srcs/ && docker-compose up -d
stop:
	cd ./srcs/ && docker-compose stop
down:
	cd ./srcs/ && docker-compose down
ps:
	cd ./srcs/ && docker-compose ps
rm:
	cd ./srcs/ && docker-compose rm
dsc:
	docker stop $$(docker ps -qa)
drc:	
	docker rm -f $$(docker ps -qa)
drm:	
	docker rmi -f $$(docker images -q)
dps:
	docker ps -qa
di:
	docker images

.PHONY: all stop down ps rm
