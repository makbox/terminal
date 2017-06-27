#!/usr/bin/perl


 #
 # Copyright (c) 2016-2017 Barchampas Gerasimos <http://makbox.co.nf/>
 # Makbox is a personal (staas) cloud.
 #
 # Makbox is free software: you can redistribute it and/or modify
 # it under the terms of the GNU Affero General Public License as
 # published by the Free Software Foundation, either version 3 of the
 # License, or (at your option) any later version.
 #
 #
 # Makbox is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 # GNU Affero General Public License for more details.
 #
 # You should have received a copy of the GNU Affero General Public License, version 3,
 # along with this program.  If not, see <http://www.gnu.org/licenses/>
 #
 #



print "---------------------------------------------------\n";
print "MAKBOX UPDATE ACCOUNT :\n";
print "---------------------------------------------------\n";



print "Give your username:";
$username =  <STDIN>;
chomp ($username);




use DBI;


my $driver = "mysql"; 
my $db = "";
my $link = "DBI:$driver:database=$db";
my $user = "";
my $pass = "";

my $conn = DBI->connect($link, $user, $pass ) or die $DBI::errstr;



 my $sth1=$conn->prepare("select username from login where username='$username'");
    $sth1->execute();

    my $row;

   while($row = $sth1->fetchrow_hashref()) 
         {

       if ($username==$row['username'])
          {
   

        print "Give new password:";
        $pass =  <STDIN>;
        chomp ($pass);


        print "Give password again:";
        $pass_again = <STDIN>;
        chomp ($pass_again);



   use Digest::MD5 qw(md5 md5_hex md5_base64);


   my $password = $pass;
   my $password_again = $pass_again;

   my $encpass = md5_hex($password);


    if($password==$password_again)
       {
   my $sth2 = $conn->prepare("update login
                          set password = '$encpass'
                          where username = '$username'");

       $sth2->execute();

    print "Update user password successfully.\n";
        }


       elsif($password!=$password_again)
        {
        print "Password and password again does not match.\n";
         }

 
        
       else
        {
        print "Update user password fail. Please try again.\n";
         }

         }



      elsif ($username!=$row['username'])
        {
       print "This username does not exist.\n";
         }


       } 


