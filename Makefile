all:
	mkdir -p /home/ybelatar/data/mariadb
	mkdir -p /home/ybelatar/data/wordpress
	# mkdir -p /home/ybelatar/data/minecraft
	docker compose -f ./srcs/docker-compose.yml up --build -d


logs:
	docker logs nginx
	docker logs mariadb
	docker logs wordpress
	docker logs redis
	docker logs adminer
	docker logs ftp
	docker logs portfolio
	docker logs minecraft


clean:
	docker stop nginx ; \
	docker stop mariadb ; \
	docker stop wordpress ; \
	docker stop redis ; \
	docker stop adminer ; \
	docker stop ftp ; \
	docker stop portfolio ; \
	docker stop minecraft ; \
	docker network rm inception ; \
	pwd

fclean: clean
	@sudo rm -rf /home/ybelatar/data/mariadb/*
	@sudo rm -rf /home/ybelatar/data/wordpress/*
	# @sudo rm -rf /home/ybelatar/data/minecraft/*
	@docker system prune -af


re: fclean all

.PHONY: all logs clean fclean re
