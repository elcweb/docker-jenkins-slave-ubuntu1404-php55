FROM elcweb/docker-jenkins-slave-ubuntu1404-base

# Install PHP 5.5
RUN DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew"  --no-install-recommends php5 php5-cli php5-curl php5-gnupg php5-memcached php5-mysql php-pear &&\
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin

USER jenkins
RUN mkdir /home/jenkins/.ssh
RUN touch /home/jenkins/.ssh/known_hosts
RUN ssh-keyscan github.com >> /home/jenkins/.ssh/known_hosts
RUN ssh-keyscan bitbucket.org >> /home/jenkins/.ssh/known_hosts
USER root
