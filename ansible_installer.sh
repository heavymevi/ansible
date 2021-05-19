#!/bin/bash



#create user 


echo " insert username to be created "
read username
echo "insert password "
read password 

sudo adduser $username --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "$username:$password" | sudo chpasswd




#create keys 

echo "create keys"
echo "==========="
cd ~
ls -la 
mkdir /home/$username/.ssh
chmod 700 /home/$username/.ssh
touch  /home/$username/.ssh/authorized_keys
chmod 640 /home/$username/.ssh/authorized_keys
ssh-keygen -t rsa -N "" -f /home/$username/.ssh/id_rsa_$username
chown -R $username:$username  /home/$username/.ssh
cat /home/$username/.ssh/id_rsa_$username.pub >/home/$username/.ssh/authorized_keys
cp /home/$username/.ssh/id_rsa_$username.pub /root/.ssh/
echo "done"


#instaliling ansible
echo "checking if ansible is installed if not it will install it ..."
if [ $(dpkg-query -W -f='${Status}' ansible 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo "installing ansible"
dpkg -i /ansible/*.deb | tee -a  Log_ansible.txt
fi


