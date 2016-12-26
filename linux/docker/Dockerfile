FROM oraclelinux:latest

## Install 'which' for next calls
RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/yum/clean-update-install.sh | sh /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/yum/nodejs.sh | bash /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/gradle.sh | bash /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/maven.sh | bash /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/oracle-java.sh | bash /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/intellij-idea-ui.sh | bash /dev/stdin

RUN curl -sjkL https://raw.githubusercontent.com/saaadel/scripts/master/linux/install/tigervnc-server.sh | bash /dev/stdin

VOLUME /mnt/docker-volume
EXPOSE 5901
LABEL io.openshift.expose-services="5901:tcp"
# USER ${USER}
USER user
CMD []
ENTRYPOINT ["/usr/bin/vncserver", "-fg"]

