function pt () {
    echo "ripgrep: rg"
}

function screensaver () {
    echo "a nonsense activity generator: genact"
}

claude() {
  if [[ -n "$TMUX" ]]; then
    tmux rename-window "claude"
    {
      command claude "$@"
    } always {
      tmux set-window-option automatic-rename on
    }
  else
    command claude "$@"
  fi
}
