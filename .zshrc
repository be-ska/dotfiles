## zsh config
autoload -U compinit && compinit
eval "$(zoxide init zsh)"
# zsh autocomplete (up and down arrows to scroll history)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

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

# source .zsh_secrets
source ~/.zsh_secrets

# variables
ALIGN_LOGS="/Users/luca/Library/CloudStorage/GoogleDrive-luca@alignmachines.com/.shortcut-targets-by-id/1avRPfwfaWKzqSPMQn_9x6zymX4clPOGE/Pilot Testing 廠機手相關/FlightLog"
ALIGN_FW="/Users/luca/Library/CloudStorage/GoogleDrive-luca@alignmachines.com/My Drive/Align Software/最新版飛控韌體更新檔案 Flight Controller Firmware"

# aliases
alias me="MAVExplorer.py"
alias me_dev="/Users/luca/.pyenv/versions/3.13.0/bin/MAVExplorer.py"
alias cd="z"
alias mp="~/.pyenv/shims/python3.10 ~/code/util/serial-mavproxy.py"
alias gpu_disable="sudo pmset -b gpuswitch 0"
alias gpu_enable="sudo pmset -b gpuswitch 2"
alias di="say -v Alice"
alias ls="eza"

export STM32CubeMX_PATH=/Applications/STMicroelectronics/STM32CubeMX.app/Contents/Resources

eval $(thefuck --alias)

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/luca/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

