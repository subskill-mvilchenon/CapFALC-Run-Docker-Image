FROM drupal:9.3.7-php8.0-fpm-bullseye

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

RUN useradd -m codatalab

USER codatalab

WORKDIR /home/codatalab

ADD resources/versions.sh .

CMD bash