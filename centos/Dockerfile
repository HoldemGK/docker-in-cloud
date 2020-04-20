FROM centos:7

RUN yum install -y epel-release dnf \
        && \
        dnf install -y \
            tigervnc-server \
            openbox obconf-qt \
            lxqt-about lxqt-common lxqt-config lxqt-globalkeys lxqt-notificationd \
            lxqt-openssh-askpass lxqt-panel lxqt-policykit lxqt-qtplugin lxqt-runner \
            lxqt-session pcmanfm-qt \
            dejavu-sans-mono-fonts \
            xterm nano htop expect sudo \
        && \
        yum clean all && dnf clean all \
        && \
        rm -rf /var/cache/yum/* && rm -rf /var/cache/dnf/*

ENV HOME=/home/headless
ENV ROOT_PASS=centos
ENV HEAD_PASS=centos

RUN /bin/dbus-uuidgen --ensure && useradd headless && \
      echo "${ROOT_PASS}" | passwd --stdin root && \
      echo "${HEAD_PASS}" | passwd --stdin headless

COPY ./vnc_conf.sh ${HOME}
RUN mkdir -p ${HOME}/.vnc && \
      echo '#!/bin/sh' > ${HOME}/.vnc/xstartup && \
      echo 'exec startlxqt' >> ${HOME}/.vnc/xstartup && \
      chmod 775 ${HOME}/.vnc/xstartup && \
      chown headless:headless -R ${HOME}

WORKDIR ${HOME}
USER headless
ENTRYPOINT ["expect", "./vnc_conf.sh"]
