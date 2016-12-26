#!/bin/bash
## Description: Install VNC

[ -z $vncpassword ] && vncpassword=''
[ -z $user ] && user='user'
[ -z $uid ] && uid='1001'
[ -z $gid ] && gid='0'
[ -z $sudoersgroup ] && sudoersgroup='wheel'

# TODO replace on packets and universal call
yum groupinstall -y --setopt=tsflags=nodocs "X Window System" "Fonts" && \
yum install -y --setopt=tsflags=nodocs tigervnc-server gnome-session metacity xterm sudo mc && \
yum clean all && rm -rf /var/cache/yum/*
   
/bin/dbus-uuidgen --ensure

export DISPLAY=":1"
export HOME=/home/${user}

useradd -u ${uid} -r -g ${gid} -d ${HOME} -s /bin/bash ${user} && \
passwd -d ${user} && \
usermod -a -G ${sudoersgroup} ${user} && \
[ ! -d ${HOME}/.vnc ] && mkdir -p ${HOME}/.vnc

/bin/echo -e "#!/bin/sh\n\
\n\
\x23 unset DBUS_SESSION_BUS_ADDRESS\n\
\n\
\x23 Run it before for clipboard support\n\
[ -x  /usr/bin/vncconfig ] && /usr/bin/vncconfig -iconic &\n\
\n\
\x23 Uncomment the following two lines for normal desktop:\n\
unset SESSION_MANAGER\n\
\x23 exec /etc/X11/xinit/xinitrc\n\
\n\
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup\n\
[ -r \$HOME/.Xresources ] && xrdb \$HOME/.Xresources\n\
\n\
[ -x /usr/bin/xsetroot ] && /usr/bin/xsetroot -solid '#222E45'\n\
[ -x /usr/bin/xclock ] && /usr/bin/xclock -geometry 100x100-5+5 &\n\
[ -x /usr/bin/xterm ] && xterm -geometry 132x44-10-10 -ls -title \"\$VNCDESKTOP Desktop\" &\n\
[ -x /usr/bin/metacity ] && /usr/bin/metacity &\n\
if test -z \"\$DBUS_SESSION_BUS_ADDRESS\" ; then\n\
	eval \`dbus-launch --sh-syntax -–exit-with-session\`\n\
	echo \"D-BUS per-session daemon address is: \\n\
	\$DBUS_SESSION_BUS_ADDRESS\"\n\
fi\n\
\n\
\x23 Add autostart soft here: /path/to/file &
\n\
exec sudo /usr/bin/gnome-session\n\
" >> ${HOME}/.vnc/xstartup

/bin/echo "${vncpassword}" | vncpasswd -f > ${HOME}/.vnc/passwd

chown -R ${uid}:${gid} ${HOME} && \
chmod 600 ${HOME}/.vnc/passwd && \
chmod 775 ${HOME}/.vnc/xstartup && \
mkdir /mnt/external && \
chmod 777 /mnt/external-dir

# EXPOSE 5901
# LABEL io.openshift.expose-services="5901:tcp"
# USER ${user}
## /usr/bin/vncserver -fg
