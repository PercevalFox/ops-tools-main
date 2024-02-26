FROM alpine:latest

LABEL version="0.1"

# VARIABLES TEMPORAIRES
ARG SSH_PRIVATE_KEY=$SSH_PRIVATE_KEY

# --------------- DÉBUT COMMANDES ---------------
RUN apk update
RUN apk add python3
RUN apk add ansible

# RUN 'which ssh-agent || ( apt install -qq openssh-client )' # Installe le client SSH si applicable
# RUN eval $(ssh-agent -s)
RUN mkdir -p ~/.ssh
RUN touch ~/.ssh/id_rsa
RUN echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa
RUN eval $(ssh-agent -s) && ssh-add ~/.ssh/id_rsa
#RUN '[[ -f /.dockerenv ]]
RUN touch ~/.ssh/config
RUN echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
# --------------- FIN COMMANDES -----------------
