#!/bin/zsh
# make sure your git is updated!!

# install oh-my-zsh first
[ ! -d $HOME/.oh-my-zsh/ ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# the deposit for old conf files
ORIG_CONF_BCK="$HOME/conf.orig"
[ -d $ORIG_CONF_BCK ] && rm -rf $ORIG_CONF_BCK
mkdir -p $ORIG_CONF_BCK

cd "$( dirname "${BASH_SOURCE[0]}" )"
GIT_CONF_DEP=`pwd`
if [ "$(ls -A $GIT_CONF_DEP/dougblack)" ]; then
  echo 'submodule already init.'
else
  git submodule update --init --recursive
  echo 'submodule update OK'
fi

mvf () {
  if [ -e $1 ];then
    mv $1 $2
    echo "mv $1 $2"
  else
    echo "$1 not exist, no need to move"
  fi
}

cd $HOME/.oh-my-zsh/
git reset --hard origin/master
echo "reset .oh-my-zsh"

rm $HOME/.oh-my-zsh/themes/crcandy.zsh-theme # 可以通过git reset 找到rm掉的文件
cp $GIT_CONF_DEP/crcandy.zsh-theme $HOME/.oh-my-zsh/themes/crcandy.zsh-theme
echo "set crcandy.zsh-theme"
git commit -am 'use my crcandy.zsh-theme'

for p in .zshrc .aliasrc .hashrc .screenrc .pathrc .variables .gitconfig .vimrc .vim/ .viminfo
do
  mvf $HOME/$p $ORIG_CONF_BCK
done
echo "move original configuration file into ~/conf.orig/ directory"

for p in .zshrc .aliasrc .hashrc .screenrc .pathrc .variables .gitconfig .vimrc .vim/ 
do
  cp -rf $GIT_CONF_DEP/$p $HOME/$p
done
echo "copy new conf files from git deposit"
set +e

source $HOME/.zshrc

if [ "$(uname)" == "Darwin" ];then
  echo "it is a Mac"
  # install homebrew
  command -v brew || mkdir $HOME/.brew && git clone https://github.com/Homebrew/brew $HOME/.brew && echo 'export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"' >> $HOME/.zshrc
  source $HOME/.zshrc
  brew update

  command -v ag || brew install the_silver_searcher
  command -v j || brew install autojump
  command -v subl || brew cask install sublime-text
  
  brew cask list iterm2 || brew cask install iterm2
  brew cask list manico || brew cask install manico
  # brew cask list caffine || brew cask install caffeine # download Caffeinated.app from App Store 
  brew cask list rectangle || brew cask install rectangle

fi
command -v yum
if [ "$?" != "0" ]; then
  command -v ag || yum install the_silver_searcher
  command -v j || yum install autojump-zsh
fi



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
echo "All jobs done."
set +e

