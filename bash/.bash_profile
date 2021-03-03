#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
  exec env WLR_DRM_DEVICES=/dev/dri/card0 MOZ_ENABLE_WAYLAND=1 sway --my-next-gpu-wont-be-nvidia
fi
