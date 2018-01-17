# MySQLDatabaseBackup

The doBackup.sh Shell script was created to help MySQL Administrators automate the backups of their MySQL Databases.
You can setup a single database in the script to just have the script backup that database every time it runs or
you can pass the database name to the script and backup that database.

Either way you can setup this script in cron to backup the database on a regular basis. 
In Addition, there is an option to mount to a network drive and also have the database 
copied to that network drive.  This can be setup in the settings or you can pass a parameter to the script
to tell it to execute the net copy function.

NOTE:  There are some settings in the script that you will have to setup in the code, Please see the settings 
sections for more details

## Switches

<table>
<tr>
<th>Switch</th>
<th>Description</th>
</tr>
<tr>
<td>-d databasename</td>
<td>The Database Name that you want to backup</td>
</tr>
<tr>
<td>-n</td>
<td>Enable the Network Drive Backup</td>
</tr>
</table>

Settings

<table>
<tr>
<th>Setting</th>
<th>Description</th>
</tr>
<tr>
<td>username</td>
<td>Default MySQL Username that has access to the database(es)</td>
</tr>
<tr>
<td>password</td>
<td>Default MySQL User Password</td>
</tr>
<tr>
<td>targetPath</td>
<td>Default Target Path to copy the database to</td>
</tr>
<tr>
<td>targetDatabase</td>
<td>Default MySQL Database to use.</td>
</tr>
<tr>
<td>net_User</td>
<td>Optional if Using Copy to NetDrive option, Default Network Share Username</td>
</tr>
<tr>
<td>net_Password</td>
<td>Optional if Using Copy to NetDrive option, Default Network Share Username Password</td>
</tr>
<tr>
<td>net_MapPath</td>
<td>Optional if Using Copy to NetDrive option, Default Path to network share //server/sharepath</td>
</tr>
<tr>
<td>net_MapTo</td>
<td>Optional if Using Copy to NetDrive option, Local Drive to map the network share to</td>
</tr>
<tr>
<td>mapNet</td>
<td>You can use the switch to override this, but you can enable or disable the copy to network share as a default.</td>
</tr>
</table>


[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=JSW8XEMQVH4BE)]
