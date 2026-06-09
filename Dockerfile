ARG NEO4J_VERSION=5.26-community

FROM neo4j:${NEO4J_VERSION}

# Dossiers utiles pour import / plugins / backups
USER root

RUN mkdir -p /var/lib/neo4j/import \
    && mkdir -p /plugins \
    && chown -R neo4j:neo4j /var/lib/neo4j/import /plugins

USER neo4j