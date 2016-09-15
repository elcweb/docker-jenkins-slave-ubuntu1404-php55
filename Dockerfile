FROM elcweb/docker-jenkins-slave-ubuntu1404-base

# Install PHP 5.5
RUN DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew"  --no-install-recommends php5 php5-cli php5-curl php5-gnupg php5-memcached php5-mysql php5-mcrypt php-pear &&\
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin

RUN php5enmod mcrypt

# Add SSH configuration
RUN mkdir /home/jenkins/.ssh
ADD known_hosts /home/jenkins/.ssh/
RUN chown -R jenkins.jenkins /home/jenkins/.ssh
