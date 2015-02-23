# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

# Set name of the theme to load.
# Look in ~/oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mugenken"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git perl cpanm cabal ghc zsh-syntax-highlighting history-substring-search rvm ruby gem golang)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# disable autocorrection
unsetopt correct_all

# add basics to path
if [ -d /usr/local/bin ]; then
    PATH=/usr/local/bin:$PATH
fi
if [ ! -d $HOME/bin ]; then
    mkdir $HOME/bin
fi

# security considerations?
PATH=$HOME/bin:$PATH

export EDITOR=vim

# correctly complete ./ and ../
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

# support for Ruby::VersionManager
if [ -f ~/.ruby_vmanager/var/ruby_vmanager.rc ]; then
    unset RUBYOPT
    source ~/.ruby_vmanager/var/ruby_vmanager.rc
fi

# support perlbrew
if [ -f "$HOME/perl5/perlbrew/etc/bashrc" ]; then
    source "$HOME/perl5/perlbrew/etc/bashrc"
fi

# follow module maker suggestions
export PERL_MM_USE_DEFAULT=1

# 256 colour terminal
export TERM="xterm-256color"

# support local cabal
if [ -d "$HOME/.cabal" ]; then
    PATH=$HOME/.cabal/bin:$PATH
fi

# support pythonbrew
if [[ -s "$HOME/.pythonbrew/etc/bashrc" ]]; then
    source "$HOME/.pythonbrew/etc/bashrc"
fi

# support node
if [[ -d "$HOME/.node" ]]; then
    PATH=$HOME/.node/bin:$PATH
fi

# go support
if [[ -d "$HOME/gopath" ]]; then
    export GOROOT="/usr/local/go"
    export GOPATH="$HOME/gopath"
    PATH=$GOPATH/bin:$GOROOT/bin:$PATH
fi

# use most if installed
if [ -x /usr/bin/most ]; then
    export PAGER=most
fi

# rvm support
if [ -d $HOME/.rvm/bin ]; then
    PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
fi

# rakudobrew
if [ -d $HOME/.rakudobrew/bin ]; then
    PATH=$HOME/.rakudobrew/bin:$PATH # Add RVM to PATH for scripting
fi

# check if privoxy is running and export proxy if so
privoxy_port=8118
privoxy_host=localhost
if [ "$(which nc)" = "" ]; then
    echo "Install nc (netcat) to enable port checks"
else
    resp=$(echo 'GET / HTTP/1.0\n\n' | nc -w3 $privoxy_host $privoxy_port 2>&1)

    case "$resp" in
        *Privoxy*)
            export http_proxy="http://$privoxy_host:$privoxy_port"
            ;;
    esac
fi

export PATH
