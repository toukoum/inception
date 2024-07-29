#!/bin/bash

service vsftpd start

adduser --disabled-password --gecos "" $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd

echo "$FTP_USER" >> /etc/vsftpd.userlist

mkdir -o /home/$(FTP_USER)/ftp
chown nobody:nogroup /home/$(FTP_USER)/ftp
chmod a-w /home/$(FTP_USER)/ftp

sed -i -r "s/#?local_enable=YES/local_enable=YES/" /etc/vsftpd.conf
sed -i -r "s/#?write_enable=YES/write_enable=YES/" /etc/vsftpd.conf
sed -i -r "s/#?chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd.conf
echo "
	allow_writeable_chroot=YES
	user_sub_token=\$USER
	local_root=/home/$(FTP_USER)/ftp
" >> /etc/vsftpd.conf

echo "
	pasv_min_port=21000
	pasv_max_port=21010
	local_enable=YES
	userlist_file=/etc/vsftpd.userlist
" >> /etc/vsftpd.conf


service vsftpd stop

/usr/sbin/vsftpd /etc/vsftpd.conf