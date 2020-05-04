VER = 1.0.0
GX = granatumx/scripts:$(VER)

main: docker

docker:
	docker build --build-arg VER=$(VER) --build-arg GX=$(GX) -t $(GX) .

docker-push:
	docker push $(GX)

shell:
	docker run --rm -it $(GX) bash
