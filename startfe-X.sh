#!/bin/bash
source /opt/gatools/include/includes.sh
fe_opts=""

# Apply lxrandr settings if running X
autocfg=~/.config/autostart/lxrandr-autostart.desktop
if [[ -e $autocfg ]] ; then
  xrdrcmd="$(grep "^Exec=" "$autocfg" | grep -E -o "xrandr .*" | sed -E "s/--mode [0-9]+x[0-9_i]+//g" | sed -E "s/--rate [0-9\.]+//g" | tr -d "'")"
  log_debug "XRANDR: $xrdrcmd"
  $xrdrcmd
fi

# make startx just launch lxde
[[ -z $FE ]] && FE=lxde

if pgrep plymouthd &>/dev/null ; then
#  while pgrep plymouthd ; do sleep 0.01 ; done
sudo systemctl start plymouth-quit.service
fi

case "$FE" in
  attract)
    log_info "Starting $FE on X"
    [[ $DEBUG == 1 ]] && fe_opts+=" --loglevel debug "
    attract --config "$MOTHER_OF_ALL"/frontends/attract $fe_opts &>> "$LOG_DIR"/attract.log
    ;;
  attractplus)
    log_info "Starting $FE on X"
    [[ $DEBUG == 1 ]] && fe_opts+=" --loglevel debug "
    attractplus --config "$MOTHER_OF_ALL"/frontends/attract $fe_opts &>> "$LOG_DIR"/attract.log
    ;;
  lxde)
    log_info "Starting $FE on X"
    startlxde
    ;;
  retrofe)
    log_info "Starting $FE on X"
    RETROFE_PATH="$MOTHER_OF_ALL"/frontends/retrofe retrofe
    ;;
  pegasus-frontend)
    log_info "Starting $FE on X"
    pegasus-fe -platform eglfs &>> "$LOG_DIR"/pegasus.log
    ;;
  groovymame)
    log_info "Starting $FE on X"
    groovymame &>> "$LOG_DIR"/mame.log
    ;;
  retroarch)
    log_info "Starting $FE on X"
    retroarch &>> "$LOG_DIR"/retroarch.log
    ;;
  emulationstation)
    log_info "Starting $FE on X"
    [[ $DEBUG == 1 ]] && fe_opts+=" --debug "
    emulationstation $fe_opts &>> "$LOG_DIR"/emulationstation.log
    ;;
  *)
    log_ko "Atttempted to start a non existant frontend: $FE"
    exit 1
    ;;
esac
