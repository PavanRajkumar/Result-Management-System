# Result-Management-System

Steps for Use:

Step 1: Install dependencies
Execute the following commands to install LAMP stack:

<code>sudo apt-get update</code><br></br>
<code>sudo apt-get install apache2</code><br></br>
<code>sudo apt-get install mysql-server</code><br></br>
<code>sudo apt-get install php libapache2-mod-php php-mysql</code>

Step 2: Place source code in correct directory
Copy the source code into var/www/html directory

OR

Execute below command in the directory var/www/html/ if source code not available
<code>git clone https://github.com/rajkumar-99/Result-Management-System.git

Step 3: Setting up database
open a terminal and enter

<code>sudo mysql

The mysql prompt should appear, now create a database by running the command

<code>create user 'pavan'@'localhost' identified by 'password';
GRANT ALL PRIVILEGES ON *.* TO 'pavan'@'localhost' IDENTIFIED BY 'password';
create database DBMS_PROJECT;
quit;</code>

On terminal run the project.sql file using

<code>mysql -u <username> -p DBMS_PROJECT < project.sql
                                                 
Step 4: Start the servers
on terminal execute the commands

<code>sudo /etc/init.d/mysql start
<code>sudo /etc/init.d/apache2 start

Step 5: Run the program
navigate to /var/www/html and double click the home.html file to begin using
Result Management System


