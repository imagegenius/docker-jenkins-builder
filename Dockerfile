# syntax=docker/dockerfile:1

FROM ghcr.io/imagegenius/baseimage-alpine:3.18

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="ImageGenius Version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hydazz"

RUN \
  echo "**** install build packages ****" && \
  VERSION=v4.34.1 &&\
  wget https://github.com/mikefarah/yq/releases/download/${VERSION}/yq_linux_amd64 -O /usr/bin/yq &&\
  chmod +x /usr/bin/yq && \
  apk add --no-cache --upgrade \
    ansible \
    git && \
  apk del \
    alpine-release

COPY . /ansible

ENTRYPOINT [ "/ansible/entrypoint.sh" ]
