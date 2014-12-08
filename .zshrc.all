# suggest from: http://stackoverflow.com/questions/6636066/zsh-rvm-woes-rvm-prompt-doesnt-resolve
alias rvm-prompt=$HOME/.rvm/bin/rvm-prompt

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crcandy"

#ssh-add ~/.ssh/mac_gitos &>/dev/null


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vzshrc="vi ~/.zshrc"
alias szshrc="source ~/.zshrc"
alias ssheva="ssh eva@42.96.157.54"
alias sshali1="ssh zhuliang@121.42.48.15"

alias sshj="ssh zhuliang@211.151.84.133"  # jump!23All
alias sshmitm="ssh zhuliang@122.112.10.132"

alias sshyd="ssh zhuliang@101.251.192.186"

alias sshha0="ssh zhuliang@101.251.192.178"
alias sshha1="ssh zhuliang@101.251.192.179"
alias sshha2="ssh zhuliang@101.251.192.180"
alias sshha3="ssh zhuliang@101.251.192.181"
alias sshha4="ssh zhuliang@101.251.192.182"

alias sshmo="ssh zhuliang@101.251.192.183"
alias sshmo1="ssh zhuliang@101.251.192.184"
alias sshmo2="ssh zhuliang@101.251.192.185"


alias ls='ls -F '
alias ll='ls -al'
alias la='ls -a'

alias his='history '
alias hisg='history | grep '
alias grep='grep --color=auto'


alias py='python '

PYTHONPATH=''
alias pyzl='export PYTHONPATH=$PYTHONPATH:/Users/zhuliang/dance/repos/:/Users/zhuliang/dance/repos/pyutil/:/Users/zhuliang/dance/repos/ss_thrift_gen python '


# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

#export PS1="[%n@%m:%~ %T]%#"
#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}%# "
#RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

hash -d C="/Users/zhuliang/work/cuc"
hash -d rep="/Users/zhuliang/dance/repos"
hash -d pyutil="/Users/zhuliang/dance/repos/pyutil"
hash -d ssad="/Users/zhuliang/dance/repos/ssad"
hash -d ss_data="/Users/zhuliang/dance/repos/ss_data"

export JAVA_HOME=`/usr/libexec/java_home`
export M2_HOME=/Users/zhuliang/program/apache/apache-maven-3.2.1/
export PATH=$PATH:$M2_HOME/bin

export ANT_HOME="/Users/zhuliang/program/apache-ant-1.9.4/"
export PATH=$PATH:$ANT_HOME/bin


export PATH=$PATH:/opt/local/bin:/opt/local/sbin
export MANPATH=/opt/local/share/man:$MANPATH

CODE_REPOS=/Users/zhuliang/dance/repos/
ZL_PY_HOME=${CODE_REPOS}/pyutil/:${CODE_REPOS}/ss_lib/:${CODE_REPOS}/ss_thrift_gen/:${CODE_REPOS}:
alias pyzl='export PYTHONPATH=$ZL_PY_HOME;python '

function test_sum() {
    echo $[ $1+ $2 ]
}
