#!/bin/bash
#MySQL Backup Script
#By JM @ www.burnsoft.net 2018

#settings
scriptVersion="0.0.1"						#script version
username="root";							#MySQL User
password="toor";							#MySQL Password
targetPath="/media/shares/database/backups";	#Backup TargetPath
targetDatabase="bssm";					#Default Database to back up, if no -d is passed
net_User="mysql";								#Network Username
net_Password="mysql";							#Network Password
net_MapPath="//nas1/mysql";								#Network Path share
net_MapTo="/media/shares/database/net";								#local map for network
mapNet=false;								#Backup to network drive
deleteAfterNetCopy=true;					#Delete the local copy after a network copy

#Global Vars
backupFile="";								#The name of the ending backup file
declare -r TRUE=0;
declare -r FALSE=1;

#Check to see if the mount already exists
function ismounted()
{
	if mountpoint -q $net_MapTo; then
		return $TRUE;
	else
		return $FALSE;
	fi
}

#Mount the Network Drive
function mountNetDrive()
{
	if ( ismounted ); then
		echo "Drive Already Mounted!";
	else
		runCommand="mount -o username=$net_User,password=$net_Password $net_MapPath $net_MapTo";
		eval $runCommand;
		echo "Mounted Network Drive!";
	fi
}

#Copy BackupFile to NetworkDrive
function copyToNetDrive(){
	runCommand="cp $targetPath/$backupFile $net_MapTo/$backupFile";
	eval $runCommand;
	echo "Backup file copied to Network Drive!";
}
#If enabled, mount the network drive and copy the file
# to the network drive
function doNetBackup()
{
	if $mapNet ; then
		mountNetDrive;
		copyToNetDrive;
		deleteLocalCopy;
	fi
}
#if enabled, this will delete the local copy after a network copy
function deleteLocalCopy()
{
	if $deleteAfterNetCopy ; then
		runCommand="rm -rf $targetPath/$backupFile";
		eval $runCommand;
		echo "Delete Local Copy.";
	fi
}
#Generate the Backup Name 
#Based on the database name, date and time
function backupName()
{
	d=$(date +"%Y-%m-%d");
	t=$(date +"%I%M%S");
	dbname="$1"
	backupFile="$dbname-$d-$t.sql";
}

#Run the backup command
function doBackup()
{
	runCommand=$(mysqldump -u $username -p$password $targetDatabase > $targetPath/$backupFile);
	eval $runCommand;
	echo "Backup is complete!";
}

#Main()

if [[ $# -gt 0 ]] ; then

        while getopts "d:n" opt; do

                case $opt in

                        n) mapNet=true;; #mapnetwork drive

                        d) targetDatabase=$OPTARG;;  # databasename
                esac

         done;
fi


backupName $targetDatabase;
doBackup;
doNetBackup;