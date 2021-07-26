# inception
docker compose project

///       RU

1. Для того, чтобы запустить проект вам понадобится: Docker, Docker-compose, Make

2. Так же, для корректной работы, нужно будет создать директорию с двумя поддиректориями:
- /home/${USER}/data/db - для базы данных
- /home/${USER}/data/wp - для данных wordpress

3. C помощью Makefile, в корне проекта необходимо собрать образы командой "make all" или просто "make"

4. Для проверки, работают ли сервисы правильно, необходимо ввести "make ps"

5. Для проверки работоспособности в браузере, нужно перейти по адресу "hcherrie.42.fr" или "localhost" или "127.0.0.1"

///       ENG

In order to run the project you will need: Docker, Docker-compose, Make

Also, for correct operation, you will need to create a directory with two subdirectories:

/ home / $ {USER} / data / db - for the database
/ home / $ {USER} / data / wp - for wordpress data
Using the Makefile, at the root of the project, you need to build images with the command "make all" or just "make"

To check if the services are working correctly, you need to type "make ps"

To check the functionality in the browser, you need to go to the address "hcherrie.42.fr" or "localhost" or "127.0.0.1"
