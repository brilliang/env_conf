#!/bin/sh

GIT_CONF_DEP=`pwd`
if [[ $GIT_CONF_DEP != *env_conf ]];then
  echo 'the script should run in env_conf dir'
  exit 0
fi
if [ "$(ls -A $GIT_CONF_DEP/dougblack)" ]; then
  echo 'submodule already init.'
else
  git submodule update --init --recursive
fi

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

cd $HOME_DIR/.oh-my-zsh/
git reset --hard origin/master

rm $HOME_DIR/.oh-my-zsh/themes/crcandy.zsh-theme # 可以通过git reset 找到rm掉的文件
cp $GIT_CONF_DEP/crcandy.zsh-theme $HOME_DIR/.oh-my-zsh/themes/crcandy.zsh-theme

# move original configuration file into ~/conf.orig/ directory
for p in .zshrc .aliasrc .hashrc .screenrc .pathrc .gitconfig .vimrc .vim/ .viminfo
do
  mvf $HOME_DIR/$p $ORIG_CONF_BCK
done

# copy new conf files from git deposit
for p in .zshrc .aliasrc .hashrc .screenrc .pathrc .gitconfig .vimrc .vim/
do
  mvf $GIT_CONF_DEP/$p $HOME_DIR
done

source $HOME_DIR/.zshrc
# 安装vundle管理的vim插件
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh


# 因为 $GIT_CONF_DEP 中的文件被移开了，所以需要将deposit还原
for p in  $GIT_CONF_DEP/dougblack/ $GIT_CONF_DEP/
do
  cd $p
  git reset --hard origin/master
done

cd $HOME_DIR/.oh-my-zsh
git commit -am 'zl modified.'
