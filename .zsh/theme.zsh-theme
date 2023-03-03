autoload -Uz vcs_info
setopt PROMPT_SUBST

# add-zsh-hook precmd vcs_info
precmd() { vcs_info }

# enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true

# set custom symbol for unstaged changes (*)
# and staged changes (+)
zstyle ':vcs_info:*' unstagedstr '%F{yellow}󰛄%f'
zstyle ':vcs_info:*' stagedstr '%F{green}󰐕%f'

# format git string
zstyle ':vcs_info:git:*' formats '%F{blue}󰊢%f %b %u%c'

# set prompt
PROMPT='%(?.%F{green}.%F{red})%f  %B%F{blue}%1~%f%b  '
RPROMPT='%B${vcs_info_msg_0_}%b'
