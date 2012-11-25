# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mugenken"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git perl knife cpanm cabal ghc zsh-syntax-highlighting ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# disable autocorrection
unsetopt correct_all

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

# support local cabal
if [ -d "$HOME/.cabal" ]; then
    export PATH=$PATH:$HOME/.cabal/bin
fi

# support pythonbrew
if [[ -s "$HOME/.pythonbrew/etc/bashrc" ]]; then
    source "$HOME/.pythonbrew/etc/bashrc"
fi

# support node
if [[ -d "$HOME/.node" ]]; then
    export PATH=$PATH:$HOME/.node/bin
fi

export PATH=/usr/local/bin:$PATH

export PERL_MM_USE_DEFAULT=1
export TERM="xterm-256color"

# vim nerdtree root
NERD_TREE_ROOT=programming

# go support
if [[ -d "$HOME/gopath" ]]; then
    export GOPATH="$HOME/gopath"
    export PATH=$PATH:$GOPATH/bin
fi

