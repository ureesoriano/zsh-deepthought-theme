# Colors:
# https://jonasjacek.github.io/colors/
: ${USER_COLOR=118}
: ${PWD_COLOR=67}
: ${BRANCH_COLOR=2}
: ${UNINDEXED_COLOR=9}
: ${INDEXED_COLOR=2}
: ${UNTRACKED_COLOR=9}
: ${AHEAD_COLOR=white}
: ${BEHIND_COLOR=white}
: ${DIVERGED_COLOR=white}
: ${UNINDEXED_IND=*}
: ${INDEXED_IND=+}
: ${UNTRACKED_IND=%%}

setopt nopromptbang prompt{cr,percent,sp,subst}

typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info' verbose yes
  zstyle ':zim:git-info:branch' format '%b'
  zstyle ':zim:git-info:commit' format '%c'
  zstyle ':zim:git-info:ahead' format '%F{${AHEAD_COLOR}}>%f'
  zstyle ':zim:git-info:behind' format '%F{${BEHIND_COLOR}}<%f'
  zstyle ':zim:git-info:diverged' format '%F{${DIVERGED_COLOR}}<>%f'
  zstyle ':zim:git-info:action' format '(%F{${INDEXED_COLOR}}%s%f)'
  zstyle ':zim:git-info:unindexed' format '%F{${UNINDEXED_COLOR}}${UNINDEXED_IND}'
  zstyle ':zim:git-info:indexed' format '%F{${INDEXED_COLOR}}${INDEXED_IND}'
  zstyle ':zim:git-info:untracked' format '%F{${UNTRACKED_COLOR}}${UNTRACKED_IND}'
  if [[ -n ${STASHED_IND} ]]; then
    zstyle ':zim:git-info:stashed' format '%F{${STASHED_COLOR}}${STASHED_IND}'
  fi
  zstyle ':zim:git-info:keys' format \
      'prompt' ' (%F{${BRANCH_COLOR}}%b %A%B%V%c%I%i%u%f%S%f)%s'

  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

PS1='%(?:%F{${USER_COLOR}}:%F{red})%B%n%b%f %F{${PWD_COLOR}}%B%~%b%f${(e)git_info[prompt]}%f%(?:%F{white}:%F{red}%B)$%b%f '
unset RPS1
