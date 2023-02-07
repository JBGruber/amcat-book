COMPOSEVERSION := $(shell curl --silent https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*\d')
OS := $(shell uname -s)
OS2 := $(shell uname -m)

all: download-compose-bin compose-file spin-up wait config render-book clean

download-compose:
	echo ${OS2}
	curl -SL https://github.com/docker/compose/releases/download/${COMPOSEVERSION}/docker-compose-${OS}-${OS2} -o docker-compose2
	chmod +x docker-compose2
	
compose-file:
	curl https://raw.githubusercontent.com/ccs-amsterdam/amcat4docker/main/docker-compose.yml -o docker-compose-render.yml 
	sed -i 's/container_name: /container_name: render-/g' docker-compose-render.yml
	sed -i 's/elastic7:9200/render-elastic7:9200/g' docker-compose-render.yml
	sed -i 's|http://amcat|http://render-amcat|g' docker-compose-render.yml
	sed -i 's|80:80|8000:80|g' docker-compose-render.yml

spin-up:
	./docker-compose2 -f docker-compose-render.yml up -d --pull="missing" --quiet-pull

wait:
	sleep 30 # wait for container to spin-up

config:
	docker exec -t render-amcat4 amcat4 create-test-index
	
render-book:
	quarto render
	
clean:
	rm docker-compose.yml docker-compose2