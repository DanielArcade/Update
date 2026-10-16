#!/bin/bash
source /opt/gatools/include/includes.sh

# Launch frontend in X environment
launch_X() {
  local xorg_opts=""
  if [[ $FE != lxde ]] ; then
    xorg_opts+=" -nocursor"
  fi
  FE="$FE" startx -- $xorg_opts &>/dev/null
}

# Extract video connector info from kernel command line
getConnectorFromKernel() {
  local p param val
  for p in $(< /proc/cmdline) ; do
    case "$p" in
      "video"=*)
        param="${p#*=}"
        val+="${param%:*}"
        # Performance update: Use bash native string manipulation instead of 'cut'
        echo "${val%%:*}"
        return 0
        ;;
    esac
  done
  return 1
}

# Find the corresponding DRM card for the connector
findConnectorCard() {
  local conn card
  conn=$(getConnectorFromKernel)
  [[ -z $conn ]] && return 1

  # Performance update: Use bash native globbing instead of subshells with 'ls' and 'grep'
  for card in /sys/class/drm/card*[0-9] ; do
    if [[ -d "${card}-${conn}" ]] ; then
      # Performance update: Use bash native substitution instead of 'basename'
      echo "/dev/dri/${card##*/}"
      return 0
    fi
  done
  return 1
}

# Launch frontend using KMS (Kernel Mode Setting)
launch_KMS() {
  tput civis
  case "$FE" in
    attractplus)
      log_info "Starting $FE on KMS"
      local dri_device
      if dri_device=$(findConnectorCard) ; then
        log_info "Forcing SFML_DRM_DEVICE=$dri_device"
        export SFML_DRM_DEVICE="$dri_device"
      fi
      [[ $DEBUG == 1 ]] && fe_opts+=" --loglevel debug "
      attractplus --config "$MOTHER_OF_ALL/frontends/attract" $fe_opts &>> "$LOG_DIR/attract.log"
      ;;
    retrofe)
      log_info "Starting $FE on KMS"
      RETROFE_PATH="$MOTHER_OF_ALL/frontends/retrofe" retrofe
      ;;
    pegasus-frontend)
      log_info "Starting $FE on KMS"
      export QT_QPA_EGLFS_HIDECURSOR=1
      pegasus-fe -platform eglfs &>> "$LOG_DIR/pegasus.log"
      ;;
    groovymame)
      log_info "Starting $FE on KMS"
      groovymame &>> "$LOG_DIR/mame.log"
      ;;
    retroarch)
      log_info "Starting $FE on KMS"
      retroarch &>> "$LOG_DIR/retroarch.log"
      ;;
    emulationstation)
      log_info "Starting $FE on KMS"
      [[ $DEBUG == 1 ]] && fe_opts+=" --debug "
      emulationstation $fe_opts &>> "$LOG_DIR/emulationstation.log"
      ;;
    *)
      log_ko "Attempted to start a non-existent frontend: $FE"
      exit 1
      ;;
  esac
  rc=$?
  tput cnorm
}

# Configuration loading
video="$(get_config_value "$GA_CONF" "video.backend")"
video=${video:-X}

[[ -z $FE ]] && FE=$(get_config_value "$GA_CONF" frontend)

FE=${FE:-attract}
FE=${FE%-git}
fe_opts=""

DEBUG=$(get_config_value "$GA_CONF" verbose)

# Stop plymouth splash screen if running
if pgrep plymouthd &>/dev/null ; then
  sudo systemctl start plymouth-quit.service
fi

# Determine running environment and launch
if [[ $video == X || $FE == lxde ]] ; then
  launch_X
elif [[ $video == KMS ]] ; then
  launch_KMS
fi

exit $rc