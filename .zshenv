
typeset -U path PATH
path=(~/.local/bin ~/.local/bin/statusbar ~/.cargo/bin /usr/local/sbin /usr/local/bin /usr/bin /opt/bin /usr/lib/llvm/16/bin $path)
export PATH

#==== exports
export EDITOR='nano'
export VISUAL='mousepad'
export BROWSER="firefox"
export TERMINAL="alacritty"

#==== for pfetch-with-kitties
export PF_SOURCE="${HOME}/.config/pfetch-with-kitties/pfetchrc"

#==== qt5ct
export QT_QPA_PLATFORMTHEME=qt5ct
#export QT_STYLE_OVERRIDE=kvantum

#==== use either mesa's radv or amd's amdvlk
#AMD_VULKAN_ICD=AMDVLK
export AMD_VULKAN_ICD=RADV


export LIBVA_DRIVER_NAME=radeonsi
#export VDPAU_DRIVER=nvidia
export VDPAU_DRIVER=radeonsi

# XDG - set defaults as they may not be set
# See https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# and https://wiki.archlinux.org/index.php/XDG_Base_Directory_support
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"