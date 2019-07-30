# Makefile
# Copyright (C) 2019 yueli <yueli@tusdao.com>
# Distributed under terms of the GPL license.
# https://github.com/yuelicn/containers

REPO=https://github.com/Kong/kong.git
TAG=1.2.1

PREFIX=yueli
IMAGE=${PREFIX}/kong:${TAG}
BASE_IMAGE=${PREFIX}/openresty:centos

.PHONY: base prod push

base:
	docker build -f ./Dockerfile.base -t ${BASE_IMAGE}  .

prod:
	#./checkcodes.sh ${REPO} ${TAG} kong
	docker build -f ./Dockerfile -t ${IMAGE}  .

push:
	docker push ${IMAGE}
