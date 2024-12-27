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

# gazebo for ArduPilot
export GZ_SIM_SYSTEM_PLUGIN_PATH=$HOME/code/uav/gz_ws/src/ardupilot_gazebo/build:${GZ_SIM_SYSTEM_PLUGIN_PATH}
export GZ_SIM_RESOURCE_PATH=$HOME/code/uav/gz_ws/src/ardupilot_gazebo/models:$HOME/code/uav/gz_ws/src/ardupilot_gazebo/worlds:${GZ_SIM_RESOURCE_PATH} 

# pio
export PATH="$PATH:$HOME/.platformio/penv/bin/"

eval "$(zoxide init zsh)"

alias me="MAVExplorer.py"
alias cd="z"
alias mp="~/.pyenv/shims/python3.10 ~/code/util/serial-mavproxy.py"
alias gpu_disable="sudo pmset -b gpuswitch 0"
alias gpu_enable="sudo pmset -b gpuswitch 2"
alias di="say -v Alice"
alias ls="eza"

# zsh autocomplete
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# zsh touchbar
source ~/.zsh/zsh-apple-touchbar/zsh-apple-touchbar.zsh

# Android path
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH

export STM32CubeMX_PATH=/Applications/STMicroelectronics/STM32CubeMX.app/Contents/Resources

eval $(thefuck --alias)
