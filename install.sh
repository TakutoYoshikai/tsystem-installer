#!/bin/bash

dir=`pwd`
sudo apt install git

echo -n name:
read name
git config --global user.name $name

echo -n email:
read email
git config --global user.email $email

echo -n github id:
read github

git clone https://github.com/TakutoYoshikai/tsystem-core.git ~/tsystem
rm -rf ~/tsystem/.git
cd ~/tsystem/
git init 
git add .
git commit -m "init"
git remote add origin git@github.com:$github/tsystem.git

cd $dir

git clone https://github.com/TakutoYoshikai/tbin-core.git ~/tbin
rm -rf ~/tbin/.git
cd ~/tbin/
git init
git add .
git commit -m "init"
git remote add origin git@github.com:$github/tbin.git

cd $dir

echo -n github rsa key:
read keypath
cp $keypath ~/tsystem/id_github

cd ~/tsystem/bin
./setup.sh $github

cd ~/tsystem
git push origin master

cd ~/tbin
git push origin master
