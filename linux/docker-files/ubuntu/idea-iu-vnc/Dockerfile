FROM ubuntu:latest

apt-get update && \
apt-get --no-install-recommends install -y curl sudo which curl && \
rm -rf /var/lib/apt/lists/*

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/apt-get/nodejs.sh | sh -x /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/oracle-java.sh | sh -x /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/maven.sh | sh -x /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/gradle.sh | sh -x /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/intellij-idea-iu.sh | sh -x /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/tigervnc-server.sh | sh -x /dev/stdin

RUN . /etc/profile.d/java-env.sh && \
    . /etc/profile.d/maven-env.sh && \
    . /etc/profile.d/gradle-env.sh && \
    . /etc/profile.d/idea-env.sh && \
    sed -e 's!^.*gnome-session!\. /etc/profile\.d/java-env\.sh\n\0!' -i /home/user/.vnc/xstartup && \
    sed -e 's!^.*gnome-session!\. /etc/profile\.d/maven-env\.sh\n\0!' -i /home/user/.vnc/xstartup && \
    sed -e 's!^.*gnome-session!\. /etc/profile\.d/gradle-env\.sh\n\0!' -i /home/user/.vnc/xstartup && \
    sed -e 's!^.*gnome-session!\. /etc/profile\.d/idea-env\.sh\n\0!' -i /home/user/.vnc/xstartup && \
    sed -e 's!^.*gnome-session!$IDEA_HOME/bin/idea.sh \&\n\0!' -i /home/user/.vnc/xstartup && \
    echo '\x32!/bin/sh' > ${HOME}/.dev-profile && \
    echo '. /etc/profile.d/java-env.sh' >> ${HOME}/.dev-profile && \
    echo '. /etc/profile.d/maven-env.sh' >> ${HOME}/.dev-profile && \
    echo '. /etc/profile.d/gradle-env.sh' >> ${HOME}/.dev-profile && \
    echo '. /etc/profile.d/idea-env.sh' >> ${HOME}/.dev-profile

#RUN echo '. ~/.dev-profile' >> ${HOME}/.bashrc


VOLUME /mnt/docker-volume
EXPOSE 5901
LABEL io.openshift.expose-services="5901:tcp"
# USER ${USER}
USER user
CMD []
ENTRYPOINT ["/usr/bin/vncserver", "-fg"]
