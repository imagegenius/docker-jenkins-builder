# syntax=docker/dockerfile:1

FROM ghcr.io/imagegenius/baseimage-alpine:3.18

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="ImageGenius Version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hydazz"

RUN \
  echo "**** install build packages ****" && \
  apk add --no-cache --upgrade \
    ansible \
    git

COPY . /ansible

ENTRYPOINT [ "/ansible/entrypoint.sh" ]
