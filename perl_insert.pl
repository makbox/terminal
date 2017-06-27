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




print "-------------------------------------------\n";
print "MAK CLOUD ADD NEW USER FOR CONTROL PANEL:  \n";
print "-------------------------------------------\n";

print "Give username:";
$username =  <STDIN>;
chomp ($username);


  print "Give password:";
   $pass =  <STDIN>;
   chomp ($pass);


   print "Retype password:";
   $retype_pass = <STDIN>;
   chomp ($retype_pass);


=begin
   use Digest::MD5 qw(md5 md5_hex md5_base64);

   my $password = $pass;

   my $encpass = md5_hex($password);
=cut


use DBI;

my $driver = "mysql"; 
my $db = "1-cloud";
my $link = "DBI:$driver:database=$db";
my $user = "mak";
my $pass = "6983450";

my $conn = DBI->connect($link, $user, $pass ) or die $DBI::errstr;




      if ($pass==$retype_pass)
           {

     my $sth = $conn->prepare("insert into login
                       (username,password)
                        values
                       ('$username','$pass'");

         $sth->execute();
         $sth->finish();

          print "The $username user registration was successful.\n";

          }


=begin
      elsif ($pass!=$retype_pass)
         {
     print "Password and password retype does not match.\n";
           }
=cut



      else
         {
     print "The $username user registration failed\n";
           }




