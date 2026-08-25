#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- package manager detection ---
if command -v dnf >/dev/null 2>&1; then
    PKG_INSTALL="sudo dnf install -y"
elif command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update
    PKG_INSTALL="sudo apt-get install -y"
else
    echo "No supported package manager found (need dnf or apt-get)" >&2
    exit 1
fi

# a display is physically attached if any DRM connector reports "connected",
# checked at the kernel/sysfs level so it works before any GUI is installed
has_display() {
    local status
    for status in /sys/class/drm/*/status; do
        [ -e "$status" ] || continue
        [ "$(cat "$status")" = "connected" ] && return 0
    done
    return 1
}

# install ohmyzsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

$PKG_INSTALL tmux git neovim zsh stow jq curl htop

# install tpm (tmux plugin manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
"$HOME/.tmux/plugins/tpm/bin/install_plugins"

# sway and related components, derived from the "Requires:"/"Recommends:"
# comments in sway/.config/sway/config.d/* and the on-click commands in
# waybar/.config/waybar/config -- only relevant if a monitor is attached
if has_display; then
    echo "Display detected, installing sway and related components"
    $PKG_INSTALL \
        sway waybar fuzzel \
        swayidle swaylock \
        grim slurp wl-clipboard \
        brightnessctl playerctl \
        libnotify pulseaudio-utils \
        lxqt-policykit xdg-user-dirs \
        pavucontrol kitty
else
    echo "No display detected, skipping sway and related components"
fi

# stow dotfiles into $HOME
STOW_PACKAGES="alacritty fuzzel git nvim rofi ssh tmux zsh"
if has_display; then
    STOW_PACKAGES="$STOW_PACKAGES sway waybar qutebrowser"
fi

cd "$SCRIPT_DIR"
for pkg in $STOW_PACKAGES; do
    stow "$pkg" -t ~
done
