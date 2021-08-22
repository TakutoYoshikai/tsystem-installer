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

echo Please create tsystem repo on your github.
echo -n tsystem repo name:
read tsystem_repo

git clone https://github.com/TakutoYoshikai/tsystem-core.git ~/tsystem
rm -rf ~/tsystem/.git
cd ~/tsystem/
git init 
git add .
git commit -m "init"
git remote add origin git@github.com:$github/$tsystem_repo.git

cd $dir

echo Please create tbin repo on your github.
echo -n tbin repo name:
read tbin_repo

git clone https://github.com/TakutoYoshikai/tbin-core.git ~/tbin
rm -rf ~/tbin/.git
cd ~/tbin/
git init
git add .
git commit -m "init"
git remote add origin git@github.com:$github/$tbin_repo.git

echo $tbin_repo > ~/tsystem/tbin-name.txt

cd $dir

echo Please prepare your github private key.
echo -n path to github private key:
read keypath
cp $keypath ~/tsystem/id_github

cd ~/tsystem/bin
./update.sh
./setup.sh $github

cd ~/tsystem
git push origin master

cd ~/tbin
git push origin master
