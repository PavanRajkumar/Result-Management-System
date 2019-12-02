# Result-Management-System

Steps for Use:

Step 1: Install dependencies
Execute the following commands to install LAMP stack:

sudo apt-get update
sudo apt-get install apache2
sudo apt-get install mysql-server
sudo apt-get install php libapache2-mod-php php-mysql

Step 2: Place source code in correct directory
Copy the source code into var/www/html directory

OR

Execute below command in the directory var/www/html/ if source code not available
git clone https://github.com/rajkumar-99/Result-Management-System.git

Step 3: Setting up database
open a terminal and enter

sudo mysql

The mysql prompt should appear, now create a database by running the command

create database DBMS_PROJECT;
quit;

On terminal run the project.sql file using

mysql -u <username> -p DBMS_PROJECT < project.sql
                                                 
Step 4: Start the servers
on terminal execute the commands

sudo /etc/init.d/mysql start
sudo /etc/init.d/apache2 start

Step 5: Run the program
navigate to /var/www/html and double click the home.html file to begin using
Result Management System


