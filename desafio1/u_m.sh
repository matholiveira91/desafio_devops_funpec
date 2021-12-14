#!/bin/bash
# AUTHOR MATHEUS OLIVEIRA
# PROPOSE AUTOMATE GRANT/REVOKE USERS ACESS BY SSH PBKEY TO A GROUP OF HOSTS

function create_users {

	for user in $(cat users.txt)  
	do 
		senha=$(echo -n oi | md5sum)
		
	        useradd --password "$senha"  --no-create-home  --no-user-group "$user"	

	done 

}
function create_pkey {

for user in $(cat users.txt)
do
ssh-keygen -t rsa -C “FUNPEC:$user:$(date +%d-%m-%Y
)"" -f "./pkeys/$user"
done
}
function distribuition {
	for user in $(cat users.txt) 
do
	for host in $(cat rhosts.txt)
	do
		ssh-copy-id -i ./pkeys/$user.pub root@$host
	done
done

}
function revoke {
	for user in $(cat users.txt) 
do
	for host in $(cat rhosts.txt)
	do
		
		ssh root@$host "echo '' > /root/.ssh/authorized_keys "

	done
done

}
#create_users
#create_pkey
#distribuition
revoke
