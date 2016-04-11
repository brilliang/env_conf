#!/bin/zsh
# make sure your git is updated!!

set -e

GIT_CONF_DEP=`pwd`
if [[ $GIT_CONF_DEP != *env_conf ]];then
  echo 'the script should run in env_conf dir'
  exit 0
fi
if [ "$(ls -A $GIT_CONF_DEP/dougblack)" ]; then
  echo 'submodule already init.'
else
  git submodule update --init --recursive
  echo 'submodule update OK'
fi

cd ~
HOME_DIR=`pwd`
ORIG_CONF_BCK="$HOME_DIR/conf.orig"

if [ -d $ORIG_CONF_BCK ];then
  echo '$ORIG_CONF_BCK exist. pls clean it.'
  exit 1
fi

# make the deposit for old conf files
mkdir -p $ORIG_CONF_BCK
echo "mkdir -p $ORIG_CONF_BCK"

mvf () {
  if [ -e $1 ];then
    mv $1 $2
    echo "mv $1 $2"
  else
    echo "$1 not exist"
  fi
}

cd $HOME_DIR/.oh-my-zsh/
git reset --hard origin/master
echo "reset .oh-my-zsh"

rm $HOME_DIR/.oh-my-zsh/themes/crcandy.zsh-theme # 可以通过git reset 找到rm掉的文件
cp $GIT_CONF_DEP/crcandy.zsh-theme $HOME_DIR/.oh-my-zsh/themes/crcandy.zsh-theme
echo "set crcandy.zsh-theme"

for p in .zshrc .aliasrc .hashrc .screenrc .pathrc .gitconfig .vimrc .vim/ .viminfo
do
  mvf $HOME_DIR/$p $ORIG_CONF_BCK
done
echo "move original configuration file into ~/conf.orig/ directory"

for p in .zshrc .aliasrc .hashrc .screenrc .pathrc .gitconfig .vimrc .vim/
do
  cp -rf $GIT_CONF_DEP/$p $HOME_DIR
done
echo "copy new conf files from git deposit"
set +e

source $HOME_DIR/.zshrc

set -e
# 安装vundle管理的vim插件
echo "start set vundle plugins"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
if [ -d ~/.vim/bundle/YouCompleteMe ];then
  echo "install YouCompleteMe"
  cd ~/.vim/bundle/YouCompleteMe
  ./install.sh
fi


# 因为 $GIT_CONF_DEP 中的文件被移开了，所以需要将deposit还原
for p in  $GIT_CONF_DEP/dougblack/ $GIT_CONF_DEP/
do
  cd $p
  #git reset --hard origin/master
  git checkout .
done

cd $HOME_DIR/.oh-my-zsh
git commit -am 'zl modified.'
echo "All jobs done."
set +e

