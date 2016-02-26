#!/usr/bin/env bash
# Create Date: 2016-02-23
# Update: 2016-02-24  "Add function of send mail"
# Maintainer: YtRen <rytubuntulinux@gmail.com>
# Function: Backup the data of my website(i.e. http://www.StudyAndShare.info)

#################################################################
# Test if the  file '/tmp/articles.txt' already exist
if [ -e /tmp/articles.txt ]
then
	rm /tmp/articles.txt
fi

mysql -u root -pPassword -D db_name << EOF
select * from table_name into outfile '/tmp/articles.txt'
EOF

if [ -e /tmp/articles.txt ]
then
	mv  /tmp/articles.txt /root/Backup/
else
	echo "Not exitst file: /tmp/articles.txt"
fi
#################################################################

#################################################################
# Test if the  file '/root/site.tar.bz2' already exist
if [ -e /root/Backup/site.tar.bz2 ]
then 
	rm /root/Backup/site.tar.bz2
fi

tar -jcvf /root/Backup/site.tar.bz2 /home/ryt/site/
#################################################################

#################################### Send Mail #####################################
mail -s "Backup data of website" -a /root/Backup/articles.txt -a /root/Backup/site.tar.bz2 username@domain < /path/to/MailMessage
####################################################################################
