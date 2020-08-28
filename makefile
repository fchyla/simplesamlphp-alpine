TAG		:= $$(git log -1 --pretty=%h)
STAG	:= fchyla/simplesamlphp:${TAG}
PRD_TAG := $$(git describe --tag)

new:
	@docker build -t ${STAG} .
	@docker tag ${STAG} fchyla/simplesamlphp:latest 

security:
	@docker run --rm -v /var/run/docker.sock:/var/run/docker.sock goodwithtech/dockle:v0.2.4 ${STAG}