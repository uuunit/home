#!/bin/bash
# /usr/local/bin/start-fushion.sh

## pcmanfm 使用 gvfs 挂载移动设备时需要用到
## 依赖：dbus-launch --> 软件包 dbus
#dbuslaunch="`which dbus-launch 2>/dev/null`"
#if [ -n "$dbuslaunch" ] && [ -x "$dbuslaunch" ] && [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
#  eval `$dbuslaunch --sh-syntax --exit-with-session`
#fi

#(sleep 2 && adeskbar) &
feh --bg-scale ~/pic/wall/sailor.starrynight.jpg &
#(sleep 4 && conky -c conky/compiz_conky) &
# 执行顺序 [?]
exec compiz --replace ccp & emerald --replace
# 缺少 emerald 无法启动 compiz 桌面
#exec compiz --replace ccp &

####################  Below the 'exec' will not run    ######################
#exec compiz --replace ccp & 
#exec emerald --replace
#sh /root/.scripts/start_compiz.sh

#exec compiz --replace ccp &
#exec emerald --replace &
#exec fusion-icon &
# Autostart applications
#(sleep 80 && conky) &











