# 概述                 
自动定时备份VPS上的网站(http://www.StudyAndShare.info)数据,并将备份好的数据发送到 `BackupWebsite.sh` 中指定的电子邮箱中。                                  

# 使用方法             
以 **root** 身份在VPS中执行如下命令:              

```bash
# crontab -e              
```
之后会打开一个文件，文件大致内容如下:               

> \# Edit this file to introduce tasks to be run by cron.          
> \#                                                             
> \# Each task to run has to be defined through a single line          
> \# indicating with different fields when the task will be run          
> \# and what command to run for the task           
> \#                                                           
> \# To define the time you can provide concrete values for            
> \# minute (m), hour (h), day of month (dom), month (mon),             
> \# and day of week (dow) or use '*' in these fields (for 'any').#             
> \# Notice that tasks will be started based on the cron's system          
> \# daemon's notion of time and timezones.             
> \#                                                                   
> \# Output of the crontab jobs (including errors) is sent through            
> \# email to the user the crontab file belongs to (unless redirected).           
> \#                                                                 
> \# For example, you can run a backup of all your user accounts           
> \# at 5 a.m every week with:                       
> \# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/                   
> \#                                                                     
> \# For more information see the manual pages of crontab(5) and cron(8)            
> \#                               
> \# m h  dom mon dow   command          

之后在文件末尾添加如下内容:            

```bash
0 0 * * * /path/to/BackupWebsite.sh   
```
保存文件并退出，之后在每天的0点0分就会自动备份VPS上的数据，并将备份好的数据发送到 `BackupWebsite.sh` 中指定的电子邮箱中。            

# 参考           
如何在命令行中发送Email:                
[Send Gmail from the Linux Command Line](http://tuxtweaks.com/2012/10/send-gmail-from-the-linux-command-line/)               
               

备份工具 `tar` 教程:           
[18 Tar Command Examples in Linux](http://www.tecmint.com/18-tar-command-examples-in-linux/)            
          

如何在Shell Script中执行MySQL语句:         
[MySQL:如何在Shell Script中执行MySQL命令?](http://www.studyandshare.info/execute_mysql_cmd_in_shell.html)                



