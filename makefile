.PHONY: help
help: makefile
	@tail -n +4 makefile | grep ".PHONY"


.PHONY: deploy
deploy: stdlib-deploy


# Deploy for testing
.PHONY: stdlib-deploy-dev
stdlib-deploy-dev:
	lib up dev


# Deploy a release
# Attention: Package file version must be updated before
.PHONY: stdlib-deploy
stdlib-deploy:
	lib release


.PHONY: aws-deploy
aws-deploy: index.main sun.main


.PHONY: %.main
%.main: %.js
	serverless deploy function --function $*
