# --------------- DÉBUT COUCHE OS -------------------
FROM kroniak/ssh-client
# --------------- FIN COUCHE OS ---------------------

# MÉTADONNÉES DE L'IMAGE
LABEL version="1.0"

# VARIABLES TEMPORAIRES
ARG SSH_PRIVATE_KEY=$SSH_PRIVATE_KEY

# --------------- DÉBUT COMMANDES ---------------
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


# OUVERTURE DU PORT HTTP
#EXPOSE 80


# RÉPERTOIRE DE TRAVAIL
#WORKDIR  ${DOCUMENTROOT}


# DÉMARRAGE DES SERVICES LORS DE L'EXÉCUTION DE L'IMAGE
#ENTRYPOINT service toto start
