# z
if type zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# google-cloud-sdk
export CLOUDSDK_PYTHON=$(which python3)
MY_GCLOUD=~/google-cloud-sdk/path.zsh.inc
if [ -f $MY_GCLOUD ]; then
  source $MY_GCLOUD
fi
MY_GCLOUD_COMPLETION=~/google-cloud-sdk/completion.zsh.inc
if [ -f $MY_GCLOUD_COMPLETION ]; then
  source $MY_GCLOUD_COMPLETION
fi

# fzf
if type fzf &> /dev/null; then
  FZF_CTRL_T_COMMAND=
  FZF_ALT_C_COMMAND=
  source <(fzf --zsh)
fi

# tmux
if [[ ! -n $TMUX  ]]; then
  # Get the session IDs
  session_ids="$(tmux list-sessions)"

  # Create new session if no sessions exist
  if [[ -z "$session_ids" ]]; then
    tmux new-session
  fi

  # Select from following choices
  #   - Attach existing session
  #   - Create new session
  #   - Start without tmux
  create_new_session="Create new session"
  start_without_tmux="Start without tmux"
  choices="$session_ids\n${create_new_session}:\n${start_without_tmux}:"
  choice="$(echo $choices | fzf | cut -d: -f1)"

  if expr "$choice" : "[0-9]*$" >&/dev/null; then
    # Attach existing session
    tmux attach-session -t "$choice"
  elif [[ "$choice" = "${create_new_session}" ]]; then
    # Create new session
    tmux new-session
  elif [[ "$choice" = "${start_without_tmux}" ]]; then
    # Start without tmux
    :
  fi
fi
