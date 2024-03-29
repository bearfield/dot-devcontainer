CONTAINER_NAME_TAG=packer-1.7

# common
PWD=$(shell pwd)
SCRIPT_DIR=$(PWD)/script
# git
TARGET_BRANCH=$(CONTAINER_NAME_TAG)

.PHONY:git-create-branch
git-create-branch:
	make create-branch \
	TARGET_BRANCH=$(TARGET_BRANCH) \
	-f $(SCRIPT_DIR)/git.mk

.PHONY:git-push
git-push:
	$(eval CURRENT_BRANCH := $(shell git symbolic-ref --short HEAD))
	make push \
	TARGET_BRANCH=$(TARGET_BRANCH) \
	CURRENT_BRANCH=$(CURRENT_BRANCH) \
	-f $(SCRIPT_DIR)/git.mk