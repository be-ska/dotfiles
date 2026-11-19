# Run tmux at startup in ~/code
if [[ -z "$TMUX" ]]; then
    cd code
    tmux attach || tmux
fi

## zsh config
autoload -U compinit && compinit
eval "$(zoxide init zsh)"

# zsh git status
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{blue}[%b]%f'
setopt PROMPT_SUBST
PROMPT='%F{green}%(3~|%2~|%~)%f${vcs_info_msg_0_} %F{yellow}%f '

# default editor
export EDITOR="nvim"

# zsh autocomplete (up and down arrows to scroll history)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# fzf shell integration (Ctrl-R history search, Ctrl-T files, Alt-C cd)
source <(fzf --zsh)

# homebrew local path
export PATH=/usr/local/bin:$PATH

# Python pyenv version manager
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
if command -v pyenv 1>/dev/null 2>&1; 
then
  eval "$(pyenv init -)"
fi

# ArduPilot need gcc-arm-none-eabi-10-2020-q4-major
export PATH="/Applications/Arm/bin:$PATH"

# Flight Gear simulator for ArduPilot
export PATH="/Applications/FlightGear.app/Contents/MacOS:$PATH"

# pio
export PATH="$PATH:$HOME/.platformio/penv/bin/"

# variables
ALIGN_LOGS="$HOME/Library/CloudStorage/GoogleDrive-luca@alignmachines.com/.shortcut-targets-by-id/1avRPfwfaWKzqSPMQn_9x6zymX4clPOGE/Pilot Testing 廠機手相關/FlightLog"
ALIGN_DRIVE="$HOME/Library/CloudStorage/GoogleDrive-luca@alignmachines.com/My Drive"
IDF_PATH="$HOME/code/esp-idf"
ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
AESPD="$HOME/Library/CloudStorage/Dropbox"

# aliases
alias sitl='./Tools/autotest/sim_vehicle.py -v Copter --console --map --mavproxy-args "--load-module horizon,graph"'
alias me="MAVExplorer.py"
alias cd="z"
alias mp="python ~/code/util/serial-mavproxy.py"
alias crash="python ~/code/util/log-crash-detector.py"
alias di="say -v Alice"
alias ls="eza"
alias lsd="eza -l --sort date"
alias vi="nvim"
alias g="nvim +Git +only"
alias py="python3"
alias f="yazi"
alias ccc="claude"

export STM32CubeMX_PATH=/Applications/STMicroelectronics/STM32CubeMX.app/Contents/Resources

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
# fpath=($HOME/.docker/completions $fpath)
# autoload -Uz compinit
# compinit

export STM32_PRG_PATH=/Applications/STMicroelectronics/STM32CubeProgrammer/STM32CubeProgrammer.app/Contents/MacOs/bin

# claude code
export PATH="$HOME/.local/bin:$PATH"
