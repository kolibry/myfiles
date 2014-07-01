export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export EDITOR=vim
export LIBVA_DRIVER_NAME=vdpau
export VDPAU_DRIVER=r600
export PATH=$PATH:/home/kolibry/.scripts/


#feh --bg-scale /home/kolibry/Images/wallpaper-2148644.jpg
ansiblocks
bind 'set completion-ignore-case on'

if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='vim PKGBUILD'

alias starwars="telnet towel.blinkenlights.nl"

alias inxi="inxi -Fxzc2"

alias weechat="weechat-curses"

alias news='newsbeuter'

alias zik="mpd && ncmpcpp"

alias version="lsb_release -si -sr -sc"

alias fdisk="sudo fdisk -l"

alias formater="sudo mkfs.vfat -F 32"

		### Dropbox ###

#alias ./dropbox_uploader.sh upload="upload dropbox"
#alias ./dropbox_uploader.sh download="download dropbox"

conf() {

case $1 in
bspwm)	vim ~/.config/bspwm/bspwmrc ;;
sxhkd)	vim ~/.config/sxhkd/sxhkdrc ;;
conky)	vim ~/.conkyrc ;;
menu)	vim ~/.config/openbox/menu.xml ;;
mpd)	vim ~/.mpd/mpd.conf ;;
mutt)	vim ~/.mutt/muttrc ;;
ncmpcpp)	vim ~/.ncmpcpp/config ;;
moc) sudo vim /home/kolibry/.moc/config ;;
moctheme) sudo vim /home/kolibry/.moc/themes/kolibry_theme ;;
weechat) vim ~/.weechat/weechat.conf ;;
pacman)	sudo vim /etc/pacman.conf ;;
mirrorlist) vim /etc/pacman/mirrorlist ;;
termite) vim ~/.config/termite/config ;;
ranger)	vim ~/.config/ranger/rc.conf ;;
rifle)	vim ~/.config/ranger/rifle.conf ;;
tmux)	vim ~/.tmux.conf ;;
vim)	vim ~/.vimrc ;;
compton)   vim ~/.config/compton.conf ;;
xinit)	vim ~/.xinitrc ;;
xresources)	vim ~/.Xresources && xrdb ~/.Xresources ;;
zathura)	vim ~/.config/zathura/zathurarc ;;
tint2)	vim ~/.config/tint2/tint2rc ;;
bashrc)	vim ~/.bashrc && source ~/.bashrc ;;
dwb) vim ~/.config/dwb/default/quickmarks ;;
grub) sudo vim /etc/default/grub.cfg ;;
*)	echo "Unknown application: $1" ;;
esac
}

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
function cdl () { cd "$@" && ls; }


alias dpi="xdpyinfo | grep resolution"

		### Gestion du système ###

# Créer une liste des paquets installés :
alias pkglist='comm -23 <(pacman -Qeq|sort) <(pacman -Qmq|sort) > pkglist'

# Créer une liste des paquets AUR installés :
alias pkglist-aur='pacman -Qqm > pkglist-aur'

# Restaurer la liste des paquets :
alias installpkglist='yaourt -S $(< pkglist)'
 
# Mise à jour des miroirs et mettre à jour le système :
alias update='sudo pacman-mirrors -g && sudo pacman -Syu'

#Mettre à jour le système :
alias maj='sudo pacman -Syu'
 
# Installer un paquet :
alias installer='sudo pacman -S'
 
# Effacer un paquet :
alias supprimer='sudo pacman -R'
 
# Paquets orphelins :
alias orphans='sudo pacman -Qdt'

# Infos paquet :
alias info='sudo pacman -Si'

# Rafraichissement de la liste des paquets:
alias refresh='sudo pacman -Syy'
 
# cacheclean -v 2 ,deletes all but the last 2 versions of installed packages the pacman cache:
alias c-c='sudo cacheclean -v 2'
 
# yaourt -Syu by typing yaur :
alias majaur='yaourt -Syu --aur'
 
# yaourt -S by typing yS :
alias install='yaourt -S'
 
# yaourt -Rsn , which fully deletes packages - see above :
alias remove='yaourt -Rsn'

# Date dernière maj
alias lastup='echo -e "\e[1;31mLast Upgraded:\e[0m " ; sort /var/log/pacman.log | tail -n 50 | grep upgraded | cut -c 1-18 | uniq -d'

#Détails dernière maj
alias lastupd='echo -e "\e[1;31mLast upgraded:\e[0m " ; cat /var/log/pacman.log | grep upgraded | tail -n 20'

# Recharger URxvt config
alias x='xrdb  .Xresources'

# Convertir vidéo youtube en fichier audio
alias ogg='youtube-dl -x --audio-format vorbis --audio-quality 0'

# mpv en couleurs
alias mpv='mpv --msgmodule'

# Nettoyer le terminal
alias c='clear'

#Restaurer tmux
alias res='sh /home/kolibry/Scripts/restoretmux'
# Eteindre le PC
alias stop='shutdown now'

# Ecran externe
alias externe='xrandr --output VGA-0 --mode 1600x900 --output LVDS --off'

# Ecran interne
alias interne='xrandr --output LVDS --mode 1366x768 --output VGA-0 --off'

# Touchpad

alias touchpadon='synclient TouchpadOff=0'
alias touchpadoff='synclient TouchpadOff=1'

# Test scroll rapidité terminal
alias testterminal='for i in {0..9999}; do echo -n "------$i-"; done'

##fun&entertaining
alias insults='wget http://www.randominsults.net -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias matrix='echo -e "\e[32m"; while :; do for i in {1..16}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1 ]]; then if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r   "; else v+="\e[2m $r   "; fi; else v+="     "; fi; done; echo -e "$v"; v=""; done'
alias matrix2='echo -e "\e[31m"; while $t; do for i in `seq 1 30`;do r="$[($RANDOM % 2)]";h="$[($RANDOM % 4)]";if [ $h -eq 1 ]; then v="\e[1m $r";else v="\e[2m $r";fi;v2="$v2 $v";done;echo -e $v2;v2="";done;'
alias matrix3='COL=$(( $(tput cols) / 2 )); clear; tput setaf 2; while :; do tput cup $((RANDOM%COL)) $((RANDOM%COL)); printf "%$((RANDOM%COL))s" $((RANDOM%2)); done'
alias matrix4='echo -ne "\e[32m" ; while true ; do echo -ne "\e[$(($RANDOM % 2 + 1))m" ; tr -c "[:print:]" " " < /dev/urandom | dd count=1 bs=50 2> /dev/null ; done'
alias matrix5='tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=lcase,unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias colorrainbow='yes "$(seq 1 255)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .01; done'
alias roulette='[ $[ $RANDOM % 6 ] == 0 ] && echo Die || echo Live'           # command line Russian roulette
alias einsteiny='A=1;B=100;X=0;C=0;N=$[$RANDOM%$B+1];until [ $X -eq $N ];do read -p "N between $A and $B. Guess? " X;C=$(($C+1));A=$(($X<$N?$X:$A));B=$(($X>$N?$X:$B));done;echo "Took you $C tries, Einstein";'                 # numbers guessing game
alias etchasketch='c=12322123;x=20;y=20;while read -sn1 p;do k=${c:(p-1)*2:2};let x+=$((k/10-2));let y+=$((k%10-2));echo -en \\033[$y\;"$x"HX;done'   # use the 1 2 3 and 4 keys to move the cursor around the screen (It's an etch-a-sketch for your terminal!)
alias excuses='echo `telnet bofh.jeffballard.us 666 2>/dev/null` |grep --color -o "Your excuse is:.*$"'     # excuses
alias freechess='telnet fics.freechess.org 5000'                  # connects to a telnet server for free internet chess
alias funfacts='wget http://www.randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias 99bottles='x="bottles of beer";y="on the wall";for b in {99..1};do echo "$b $x $y, $b $x. Take one down pass it around, $(($b-1)) $x $y"; sleep 3;done'
alias addictive='count="1" ; while true ; do read next ; if [[ "$next" = "$last" ]] ; then count=$(($count+1)) ; echo "$count" ; else count="1" ; echo $count ; fi ; last="$next" ; done'                      # simple addicting bash game
alias busy='for i in `seq 0 100`;do timeout 6 dialog --gauge "Install..." 6 40 "$i";done' # pretend to be busy in office to enjoy a cup of coffee
alias busy2='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'
alias busy3='cat /dev/urandom | hexdump -C | highlight ca fe 3d 42 e1 b3 ae f8 | perl -MTime::HiRes -pnE "Time::HiRes::usleep(rand()*1000000)"'

### Fonction scrot + upload ###
imgur-upl() {
	curl -s -F image=@"$1" -F "key=1913b4ac473c692372d108209958fd15" \
			http://api.imgur.com/2/upload.xml | grep -Eo "<original>(.)*</original>" \
				| grep -Eo "http://i.imgur.com/[^<]*"
}

# Back up file
bu() {
	cp -a "$1" "$1.$(date +%d.%m.%y-%H:%M)" 
}

# ex - archive extractor
# usage: ex <file>

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
 

##### Couleurs prompt ####


#Black            \e[0;30m
#Blue             \e[0;34m
#Green            \e[0;32m
#Cyan             \e[0;36m
#Red              \e[0;31m
#Purple           \e[0;35m
#Brown            \e[0;33m
#Gray             \e[0;37m
#Dark Gray        \e[1;30m
#Light Blue       \e[1;34m
#Light Green      \e[1;32m
#Light Cyan       \e[1;36m
#Light Red        \e[1;31m
#Light Purple     \e[1;35m
#Yellow           \e[1;33m
#White            \e[1;37m
#NC='\e[0m'              # No Color
# background colors
#RED='\e[41m'
#BLUE='\e[44m'
#CYAN='\e[46m'
#GREEN='\e[42m'
#YELLOW='\e[43m'


# prompt
#PS1="\[\e[0;33m\]┌─[\[\e[1;31m\u\e[0;33m\]]──[\[\e[0;34m\]${HOSTNAME%%.*}\[\e[0;33m\]]\[\e[0;32m\]:\w$\[\e[0;33m\]\n\[\e[0;33m\]└──\[\e[0;33m\]>>\[\e[0m\]"
#prompt essai
PS1="\[\e[0;34m\]┌─[\[\e[0;31mo_o\e[0;34m\]]──[\[\e[0;33m\]\w\[\e[0;34m\]]\[\e[0;34m\]\n\[\e[0;34m\]└──\[\e[0;34m\][\[\e[0m\]"
# prompt robot
#PS1='┌─[\e[0;31mo_o\e[m] ─ [\e[0;36m\w\e[m]\n└─|'

BROWSER=/usr/bin/xdg-open

### Man pages en couleur ###
man() {
    env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

