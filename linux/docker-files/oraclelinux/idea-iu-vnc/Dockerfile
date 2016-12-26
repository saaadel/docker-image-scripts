FROM oraclelinux:latest

## Install 'which' for next calls
RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/yum/clean-update-install.sh | sh /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/yum/nodejs.sh | sh /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/oracle-java.sh | sh /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/maven.sh | sh /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/gradle.sh | sh /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/intellij-idea-iu.sh | sh /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/tigervnc-server.sh | sh /dev/stdin

RUN . /etc/profile.d/java-env.sh && \
    . /etc/profile.d/maven-env.sh && \
    . /etc/profile.d/gradle-env.sh && \
    . /etc/profile.d/idea-env.sh && \
    sed -e 's!^.*gnome-session!\. /etc/profile\.d/java-env\.sh\n\0!' -i /home/user/.vnc/xstartup && \
    sed -e 's!^.*gnome-session!\. /etc/profile\.d/maven-env\.sh\n\0!' -i /home/user/.vnc/xstartup && \
    sed -e 's!^.*gnome-session!\. /etc/profile\.d/gradle-env\.sh\n\0!' -i /home/user/.vnc/xstartup && \
    sed -e 's!^.*gnome-session!\. /etc/profile\.d/idea-env\.sh\n\0!' -i /home/user/.vnc/xstartup && \
    sed -e 's!^.*gnome-session!$IDEA_HOME/bin/idea.sh &\n\0!' -i /home/user/.vnc/xstartup

VOLUME /mnt/docker-volume
EXPOSE 5901
LABEL io.openshift.expose-services="5901:tcp"
# USER ${USER}
USER user
CMD []
ENTRYPOINT ["/usr/bin/vncserver", "-fg"]

