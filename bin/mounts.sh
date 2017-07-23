sudo mount /dev/sdb2 /mnt/archive
sshfs cloud9@kyaunet:/home/cloud9/public_html /home/kyau/public_html
sudo mount -t cifs //chloe/ARCHiVE /mnt/archive --verbose -o user=Kyau,uid=1000,gid=100,file_mode=0660,dir_mode=0770,noperm
