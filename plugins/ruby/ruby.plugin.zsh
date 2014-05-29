# TODO: Make this compatible with rvm.
#       Run sudo gem on the system ruby, not the active ruby.
alias sgem='sudo gem'

# Find ruby file
alias rfind='find . -name "*.rb" | xargs grep -n'

rubyversion-prompt () {
  local rubyversion=$RUBY_VERSION
  [[ -z $rubyversion ]] && rubyversion="system ruby"
  echo $rubyversion
}
