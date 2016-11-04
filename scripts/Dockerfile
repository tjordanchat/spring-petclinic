FROM RHEL7

ARG U=docker_user
ARG P=docker_password
ARG A=artifactory_url

COPY build_artifacts /usr/local/bin/build_artifacts
COPY sonar.xml /tmp/sonar.xml
COPY snapshot_settings.xml /tmp/snapshot_settings.xml
COPY release_settings.xml /tmp/release_settings.xml
COPY settings.xml /tmp/settings.xml
COPY addName.xsl /tmp/addName.xsl
COPY newerAddName.xsl /tmp/newAddName.xsl
COPY color /usr/local/bin/color
COPY pom.xml.sh /usr/local/bin/pom.xml.sh
COPY fortify_answer_file /tmp/fortify_answer_file
COPY keytool_answer_file /tmp/keytool_answer_file
COPY xldeploy_settings.xml.templ /tmp/xldeploy_settings.xml.templ
COPY xldeploy_pom.xml.templ /tmp/xldeploy_pom.xml.templ
COPY gen_json_4_deploy /usr/local/bin/gen_json_4_deploy
COPY xldeploy_cli /usr/local/bin/xldeploy_cli
COPY get_available_port /usr/local/bin/get_available_port
COPY get_build_tag /usr/local/bin/get_build_tag
COPY g_process_config /usr/local/bin/g_process_config
COPY g_sendto_artifactory /usr/local/bin/g_sendto_artifactory
COPY g_take_screenshot /usr/local/bin/g_take_screenshot

RUN \
    set -x && \
    cd /tmp && \
    yum repolist all && \
    yum clean metadata && \
    yum clean all && \
    yum -y install deltarpm && \
    yum -y update && \
    yum -y install wget && \
    yum -y install tar && \
    yum -y install git && \
    yum -y install jq && \
    yum -y install libxslt  && \
    yum -y install tomcat && \
    yum -y install tomcat-webapps && \
    yum -y install tomcat-admin-webapps && \
    yum -y groupinstall "Development Tools" && \
    yum -y install python-devel && \
    yum -y install pcre-devel && \
    yum -y install xclock && \
    yum -y install xterm && \
    yum -y install figlet && \
    yum -y install openssh-server && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
    /usr/bin/ssh-keygen -A && \
    cd /usr/local && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install shyaml && \
    yum -y install xorg-x11-server-Xvfb && \
    yum -y install firefox && \
    yum -y install ImageMagick && \
    wget http://nodejs.org/dist/v0.10.30/node-v0.10.30-linux-x64.tar.gz && \
    gunzip node-v0.10.30-linux-x64.tar.gz && \
    tar xf node-v0.10.30-linux-x64.tar && \
    rm node-v0.10.30-linux-x64.tar && \
    /usr/local/node-v0.10.30-linux-x64/bin/npm install tty.js && \
    /usr/local/node-v0.10.30-linux-x64/bin/npm install mustache --save && \
    dbus-uuidgen > /var/lib/dbus/machine-id && \
    wget --no-check-certificate --user ${U} --password ${P} ${A}/artifactory/xl-deploy-5.5.0-cli.zip && \
    unzip xl-deploy-5.5.0-cli.zip && \
    rm -f xl-deploy-5.5.0-cli.zip && \
		true

ENV HOME /root
ENV DISPLAY :1
ENV PATH /usr/local/maven/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/node-v0.10.30-linux-x64/bin
ENV TERM xterm
ENV XL_DEPLOY_CLI_HOME /usr/local/xl-deploy-5.5.0-cli

WORKDIR /root
