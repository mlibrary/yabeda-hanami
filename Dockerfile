FROM ruby:3.2.3

ARG USERNAME=dcde
ARG UID=1000
ARG GID=1000
ARG NODE_VERSION=20

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install --no-install-recommends \
      build-essential \
      curl \
      git \
      wget \
      unzip \
      vim

RUN curl -SLO https://deb.nodesource.com/nsolid_setup_deb.sh && \
    chmod 500 nsolid_setup_deb.sh && \
    ./nsolid_setup_deb.sh ${NODE_VERSION} && \
    apt-get install nodejs -yq

RUN groupadd -g $GID -o $USERNAME && \
    useradd -m -d /$USERNAME -u $UID -g $GID -o -s /bin/bash $USERNAME

COPY --chown=$UID:$GID . /$USERNAME

USER $USERNAME

WORKDIR /$USERNAME

CMD ["sleep", "infinity"]
