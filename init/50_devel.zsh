# Make 1.9.3 default ruby installation.
rbenv global 1.9.3-stable

# install gems
if [[ "$(type -P gem)" ]]; then
  gems=(bundler awesome_print git-up)

  list="$(to_install "${gems[*]}" "$(gem list | awk '{print $1}')")"
  if [[ "$list" ]]; then
    e_header "Installing Ruby gems: $list"
    gem install $list
  fi
fi
