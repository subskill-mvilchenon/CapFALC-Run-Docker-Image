FROM drupal:9.3.7-php8.0-fpm-bullseye
#

RUN apt-get update -qq && apt-get install -yqq  --no-install-recommends \
        libssh2-1-dev libssh2-1 \
#        openssl curl git gnupg2 \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && curl https://pecl.php.net/get/ssh2-1.3.1.tgz -o ssh2.tgz \
    && pecl install ssh2 ssh2.tgz \
    && docker-php-ext-enable ssh2 \
    && rm -rf ssh2.tgz
#    && pecl install ssh2 \
#    && docker-php-ext-enable ssh2 
#    && docker-php-ext-install -j$(nproc) openssl

RUN apt install git

RUN echo 'alias ll="ls -l"' >> ~/.bashrc

# COPY SSH Keygen
COPY resources/ssh/id_rsa /home/codatalab/.ssh/id_rsa
COPY resources/ssh/id_rsa.pub /home/codatalab/.ssh/id_rsa.pub

# COPY settings.php
COPY resources/ssh/id_rsa /home/codatalab/.ssh/id_rsa

# GIT clone repo UNAPEI SUBSKILL
# docker run --rm -v /path/to/project:/git-project -v /PATH/TO/SSHDIR:/root/.ssh binfalse/git-pull
RUN git clone https://github.com/subskill/unapei.git:subskill/unapei.git /opt/drupal

RUN useradd -m codatalab

RUN chown -R codatalab:codatalab /home/codatalab/.ssh

USER codatalab

WORKDIR /home/codatalab
#WORKDIR /opt/drupal/web

#ADD resources/versions.sh .

CMD bash
