#!/bin/sh

. $HOME/.config/bar/bar_config
desktop() {
  groupstats="$(groupstat)"
  echo "%{U$YELLOW} $groupstats %{U-}" | tr -d ' ' | sed -e s/0//g -e s/1/'%{F#F9D48C#}%{F-}'/g
}
clock(){
  clock=$(date "+%A, %d %B %I:%M:%S")
  echo "%{B$BG}%{F$CYAN}%{U$CYAN}%{F-}$clock%{U-}%{B-} "
}

music(){
  play=$(mpc current)
  echo "%{B$BG}%{F$RED} %{+u}%{U$RED}%{F-}$play %{U-}%{B-}"
}
weather(){
  out="$(wget -q -O- -w 3600 http://www.accuweather.com/en/us/chapel-hill-nc/27516/weather-forecast/329826 | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $14", "$12"°" }'| head -1)"

  echo -e "%{B$BLACK2}%{F$FG}$out  %{B-}"
}
while :; do
echo "$(desktop) %{c}$(clock) %{r}$(music)"
sleep 0.1s
done | lemonbar  -u 3 -g ${PW}x${PH}+${PX}+${PY} -b -f "$FONT2" -f "$FONT1" -B "$BG" -F "$FG" -d -p & 
