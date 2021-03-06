VER = 1.0.0
GX = granatumx/scripts:$(VER)

main:

docker:
	docker build --build-arg VER=$(VER) --build-arg GX=$(GX) -t $(GX) .

docker-push:
	docker push $(GX)

shell:
	docker run -v /var/run/docker.sock:/var/run/docker.sock --network=gx-net --rm -it $(GX) bash

doc:
	./gendoc.sh
