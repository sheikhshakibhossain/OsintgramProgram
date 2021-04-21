#!/bin/sh


# Declearing Color Codes into varieable

Color_yellow="\e[1;33m"
Color_end="\e[0m"

# Automation of osintgram setup and installation

echo "$Color_yellow

	Hello $USER, Initiating your Automation...

      $Color_end" ;

# Installing Essential packages

echo "$Color_yellow

	Dear $USER, Please Enter Your Sudo Password.

      $Color_end" ;
      
rm -rf osintgram ;      
cd ~ ;
sudo apt install wget git python3 python3-pip libncurses5-dev -y ;

# Old Osintgram Backup

cp Osintgram Old_Osintgram ;
cp .Osintgram Old_Osintgram_Hidden ;
rm -rf Osintgram .Osintgram ;

echo "$Color_yellow

	Dear $USER, Old Osintgram Files are Backed Up in Home Folder.
	    [ if it was installed before ]

      $Color_end" ;

read -p "Do you want to Delete the Backup files ? [ type yes or no ] : " ANSWER
if [ $ANSWER = "yes" ];
then
	rm -rf Old_Osintgram Old_Osintgram_Hidden
fi ;
echo ""

# Cloning and Later

git clone https://github.com/Datalux/Osintgram.git ;
mv Osintgram .Osintgram ;
cd ~/.Osintgram ;
pip3 install -r requirements.txt ;

# Setup credentials

cd ~/.Osintgram/config ;

# Input prompt

echo "$Color_yellow



	To continue please setup Instagram Credentials


 
     $Color_end";

read -p "Enter UserName :" User ;
read -p "Enter PassWord :" Passwd ;

echo "[Credentials]
username = $User 
password = $Passwd" > credentials.ini ;

# Making Osintgram Script

cd ~/.Osintgram ;
wget https://raw.githubusercontent.com/linuxbud/OsintgramProgram/main/osintgram ;
chmod +x osintgram ;

# Setting up one click osintgram 

sudo mv osintgram /usr/bin ;
osintgram ;

exit
