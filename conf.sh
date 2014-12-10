#!/bin/sh

GIT_CONF_DEP=`pwd`
if [[ $GIT_CONF_DEP != *env_conf ]];then
  echo 'the script should run in env_conf dir'
  exit 0
fi
git submodule update --init --recursive

cd ~
HOME_DIR=`pwd`
ORIG_CONF_BCK="$HOME_DIR/conf.orig"

if [ -d $ORIG_CONF_BCK ];then
  echo $ORIG_CONF_BCK' exist. pls clean it.'
  exit 1
fi

# make the deposit for old conf files
mkdir -p $ORIG_CONF_BCK
echo mkdir -p $ORIG_CONF_BCK

function mvf {
  if [ -e $1 ];then
    mv $1 $2
    echo mv $1 $2
  else
    echo "$1 not exist"
  fi
}

# move original configuration file into ~/conf.orig/ directory
for p in .zshrc .aliasrc .hashrc .screenrc .profile .gitconfig .vimrc .vim/ .viminfo
do
  mvf $HOME_DIR/$p $ORIG_CONF_BCK
done

# copy new conf files from git deposit
for p in .zshrc .aliasrc .hashrc .screenrc .profile .gitconfig .vimrc .vim/
do
  mvf $GIT_CONF_DEP/$p $HOME_DIR
done
source $HOME_DIR/.zshrc

for p in  $GIT_CONF_DEP/dougblack/ $GIT_CONF_DEP/
do
  cd $p
  git reset --hard origin/master
done