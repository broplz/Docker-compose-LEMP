all:
	cd ./srcs/ && docker-compose up -d
stop:
	cd ./srcs/ && docker-compose stop
down:
	cd ./srcs/ && docker-compose down
restart:
	cd ./srcs/ && docker-compose restart
logs:
	cd ./srcs/ && docker-compose logs -f
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
drv:
	docker volume rm $$(docker volume ls -q)
dps:
	docker ps -qa
dim:
	docker images
dvol:
	docker-compose volume ls -q

.PHONY: all stop down ps rm
