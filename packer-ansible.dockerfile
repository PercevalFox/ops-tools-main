FROM hashicorp/packer:latest

LABEL version="0.1"

# DEBUT COMMANDES
RUN apk update
RUN apk add python3
RUN apk add ansible
RUN apk add curl
