#! bash oh-my-bash.module

# Set term to 256color mode, if 256color is not supported, colors won't work properly
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

# Detect whether a rebbot is required
function show_reboot_required() {
  if [ ! -z "$_bf_prompt_reboot_info" ]; then
    if [ -f /var/run/reboot-required ]; then
      printf "Reboot required!"
    fi
  fi
}

# Set different host color for local and remote sessions
function set_host_color() {
  # Detect if connection is through SSH
  if [[ ! -z $SSH_CLIENT ]]; then
    printf "${powder_blue}"
  else
    printf "${teal_grey}"
  fi
}

# Set different username color for users and root
function set_user_color() {
  case $(id -u) in
    0)
      printf "${_omb_prompt_brown}"
      ;;
    *)
      printf "${lavender}"
      ;;
  esac
}

function scm_prompt {
  CHAR=$(scm_char)
  if [ $CHAR = $SCM_NONE_CHAR ]
    then
      return
    else
      echo "[$(scm_char)$(scm_prompt_info)]"
  fi
}

# Define custom colors we need
# non-printable bytes in PS1 need to be contained within \[ \].
# Otherwise, bash will count them in the length of the prompt
function set_custom_colors() {
  dark_grey="\[$(tput setaf 244)\]"
  light_grey="\[$(tput setaf 7)\]"

  light_orange="\[$(tput setaf 214)\]"
  bright_yellow="\[$(tput setaf 220)\]"
  lime_yellow="\[$(tput setaf 190)\]"

  powder_blue="\[$(tput setaf 153)\]"
  sky_blue="\[$(tput setaf 39)\]"
  storm_blue="\[$(tput setaf 31)\]"

  teal_grey="\[$(tput setaf 152)\]"
  faded_teal="\[$(tput setaf 73)\]"
  sage_green="\[$(tput setaf 151)\]"
  avocado="\[$(tput setaf 148)\]"

  wine_plum="\[$(tput setaf 125)\]"
  carrot_orange="\[$(tput setaf 208)\]"
  burnt_orange="\[$(tput setaf 172)\]"
  
  burnt_rose="\[$(tput setaf 139)\]"
  periwinkle="\[$(tput setaf 147)\]"
  lavender="\[$(tput setaf 183)\]"
}

function __ps_time {
  echo "$(clock_prompt)${_omb_prompt_normal}\n"
}

function _omb_theme_PROMPT_COMMAND() {
  ps_reboot="${bright_yellow}$(show_reboot_required)${_omb_prompt_normal}\n"

  ps_username="${faded_teal}\u${_omb_prompt_normal}"

  ps_uh_separator="${dark_grey}@${_omb_prompt_normal}"
  ps_hostname="${sage_green}\h${_omb_prompt_normal}"

  ps_path="${burnt_rose}\W${_omb_prompt_normal}"

  ps_scm_prompt="${light_grey}$(scm_prompt)"

  ps_user_mark="${_omb_prompt_normal} ${_omb_prompt_normal}"
  ps_user_input="${_omb_prompt_normal}"

  ps_timestamp="${burnt_rose}[\$(date '+%Y-%m-%d %H:%M:%S')] ${_omb_prompt_normal}"

  # Set prompt
  # PS1="${light_grey}[\$(date '+%Y-%m-%d %H:%M:%S')] ${_omb_prompt_normal}\u@\h $ "
  # PS1="$ps_reboot$(__ps_time)$ps_username$ps_uh_separator$ps_hostname $ps_path $ps_scm_prompt$ps_user_mark$ps_user_input"
  
  PS1="$ps_reboot$ps_timestamp $ps_username$ps_uh_separator$ps_hostname $ps_path $ "

}

# Initialize custom colors
set_custom_colors

THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$dark_grey"}

# scm theming
SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

SCM_THEME_PROMPT_DIRTY=" ${_omb_prompt_bold_brown}✗${light_grey}"
SCM_THEME_PROMPT_CLEAN=" ${_omb_prompt_green}✓${light_grey}"
SCM_GIT_CHAR="${_omb_prompt_green}±${light_grey}"
SCM_SVN_CHAR="${_omb_prompt_bold_teal}⑆${light_grey}"
SCM_HG_CHAR="${_omb_prompt_bold_brown}☿${light_grey}"

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
