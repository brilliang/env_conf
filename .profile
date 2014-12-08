echo 'init in ~/.profile'
# export PS1="[%n@%m:%~ %T]%#"
# PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}%# "
#RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"
# export MANPATH="/usr/local/man:$MANPATH"
# export MANPATH=/opt/local/share/man:$MANPATH

export LC_ALL=zh_CN.UTF-8
export LANG=zh_CN.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"
# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='mvim'
fi

if [ `uname` == 'Darwin' ]; then
    export JAVA_HOME=`/usr/libexec/java_home`
else
    echo 'not mac system'
fi

export M2_HOME=/Users/zhuliang/program/apache/apache-maven-3.2.1/
export PATH=$PATH:$M2_HOME/bin

export ANT_HOME="/Users/zhuliang/program/apache-ant-1.9.4/"
export PATH=$PATH:$ANT_HOME/bin

CODE_REPOS=/Users/zhuliang/dance/repos/
ZL_PY_HOME=${CODE_REPOS}/pyutil/:${CODE_REPOS}/ss_lib/:${CODE_REPOS}/ss_thrift_gen/:${CODE_REPOS}:
alias pyzl='export PYTHONPATH=$ZL_PY_HOME;python '

function test_sum() {
    echo $[ $1+ $2 ]
}
