path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.cargo/bin"

if [[ $OSTYPE == 'darwin'* ]]; then
  path_prepend "$HOME/.dotfiles/bin/macos"
else
  path_prepend "$HOME/.dotfiles/bin/linux/"
fi
