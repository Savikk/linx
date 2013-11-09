#przydatny skrypt wspomagajacy instalacje sterownikow #radeon
#not mine
#!/bin/sh
UNSUPPORTED=1
LEGACY=0
#CARDS="$(lspci -n|gawk '{sub("Class","")} $2 == "0300:" {print$3}')"
CARDS="$(lspci -n|perl -e 'while(<>){(push(@cards,$_)) if (s/^.+?\s*0300\:\s+(.+?)\s+.*$/$1/)} print join(" ",@cards);')"
for card in $CARDS; do
 VENDOR=${card%:*}
 DEVICE=${card#*:}
 case $VENDOR in
  1002)
   case $DEVICE in
    #strings /usr/lib/xorg/modules/drivers/fglrx_drv.so|awk '/^0x....$/{print tolower($1)}'|sed s/0x//|sort -u|tr '\n' '|'|sed 's/|$//'
    #awk -F'[()x]' '/FGL_ASIC_ID/{print tolower($3)}' common/lib/modules/fglrx/build_mod/fglrxko_pci_ids.h|sort -u|tr '\n' '|'|sed 's/|$//'
    #671f|673e|689b|9806|9807) UNSUPPORTED=0;LEGACY=5 ;;
    1304|1305|1306|1307|6600|6601|6602|6603|6606|6607|6610|6611|6613|6620|6621|6623|6631|6640|6641|6649|6650|6651|6660|6663|6667|666f|6700|6701|6702|6703|6704|6705|6706|6707|6708|6709|6718|6719|671c|671d|671f|6720|6721|6722|6723|6724|6725|6726|6727|6728|6729|6738|6739|673e|6740|6741|6742|6743|6744|6745|6746|6747|6748|6749|674a|6750|6751|6758|6759|675b|675d|675f|6760|6761|6762|6763|6764|6765|6766|6767|6768|6770|6771|6772|6778|6779|677b|6780|6784|6788|678a|6790|6791|6792|6798|6799|679a|679e|6800|6801|6806|6808|6809|6810|6811|6818|6819|6820|6821|6823|6824|6825|6826|6827|6828|682b|682d|682f|6830|6831|6837|6838|6839|683b|683d|683f|6840|6841|6842|6843|6849|684c|6850|6858|6859|6880|6888|6889|688a|688c|688d|6890|6898|6899|689b|689c|689d|689e|68a0|68a1|68a8|68a9|68b0|68b1|68b8|68b9|68ba|68be|68bf|68c0|68c1|68c7|68c8|68c9|68d0|68d1|68d8|68d9|68da|68de|68e0|68e1|68e4|68e5|68e8|68e9|68f0|68f1|68f2|68f8|68f9|68fa|68fe|9640|9641|9642|9643|9644|9645|9647|9648|9649|964a|964b|964c|964e|964f|9802|9803|9804|9805|9806|9807|9808|9809|980a|9830|9831|9832|9833|9834|9835|9836|9837|9838|9839|983a|983b|983c|983d|983e|983f|9900|9901|9903|9904|9905|9906|9907|9908|9909|990a|990b|990c|990d|990e|990f|9910|9913|9917|9918|9919|9990|9991|9992|9993|9994|9995|9996|9997|9998|9999|999a|999b|99a0|99a2|99a4) UNSUPPORTED=0 ;;
    4242|4966|4967|4c64|4c66|4c67|5148|514c|514d|5960|5961|5962|5964|5965|5c61|5c63) UNSUPPORTED=0;LEGACY=1 ;;
    5834|5835|728c|7834|7835) UNSUPPORTED=0;LEGACY=2 ;;
    3151|3154|3e54|4147|4154|4a4d|4e47|4e4b|4e54|5464|5550|5551|5554|5555|564a|564b|5b64|5b65|5d49|5d50|5d51|5e48|7103|7104|7105|7106|710e|710f|7144|7152|7153|719b|71c4|71d2|71d4|71da|728c) UNSUPPORTED=0;LEGACY=3 ;;
    3150|3151|3152|3154|3e50|3e54|4144|4146|4147|4148|4149|4150|4151|4152|4153|4154|4155|4a48|4a49|4a4a|4a4b|4a4c|4a4d|4a4e|4a4f|4a50|4a54|4b48|4b49|4b4a|4b4b|4b4c|4e44|4e45|4e46|4e47|4e48|4e49|4e4a|4e4b|4e50|4e51|4e52|4e54|4e56|5460|5461|5462|5464|5548|5549|554a|554b|554c|554d|554e|554f|5550|5551|5554|5555|564a|564b|564f|5652|5653|5657|5854|5874|5954|5955|5974|5975|5a41|5a42|5a43|5a61|5a62|5a63|5b60|5b62|5b63|5b64|5b65|5b66|5d48|5d49|5d4a|5d4c|5d4d|5d4f|5d50|5d51|5d52|5d57|5e48|5e4a|5e4b|5e4c|5e4d|5e4f|7100|7101|7102|7103|7104|7105|7106|7108|7109|710a|710b|710c|710e|710f|7140|7141|7142|7143|7144|7145|7146|7147|7149|714a|714b|714c|714d|714e|714f|7151|7152|7153|715e|715f|7180|7181|7183|7186|7187|7188|718a|718b|718c|718d|718f|7193|7196|719b|719f|71c0|71c1|71c2|71c3|71c4|71c5|71c6|71c7|71cd|71ce|71d2|71d4|71d5|71d6|71da|71de|7200|7210|7211|7240|7243|7244|7245|7246|7247|7248|7249|724a|724b|724c|724d|724e|724f|7280|7281|7283|7284|7287|7288|7289|728b|728c|7290|7291|7293|7297|791e|791f|793f|7941|7942|796c|796d|796e|796f|9270) UNSUPPORTED=0;LEGACY=4 ;;
    9400|9401|9402|9403|9405|940a|940b|940f|9440|9441|9442|9443|9444|9446|9447|944a|944b|944c|944e|944f|9450|9451|9452|9456|945a|945b|945e|9460|9462|946a|946b|947a|947b|9480|9487|9488|9489|948a|948f|9490|9491|9495|9498|949c|949e|949f|94a0|94a1|94a3|94b1|94b3|94b4|94b5|94c0|94c1|94c3|94c4|94c5|94c6|94c7|94c8|94c9|94cb|94cc|9500|9501|9504|9505|9506|9507|9508|9509|950f|9511|9513|9515|9517|9519|9540|9541|9542|954e|954f|9552|9553|9555|9557|955f|9580|9581|9583|9586|9587|9588|9589|958a|958b|958c|958d|958e|958f|9590|9591|9593|9595|9596|9597|9598|9599|959b|95c0|95c2|95c4|95c5|95c6|95c7|95c9|95cc|95cd|95ce|95cf|9610|9611|9612|9613|9614|9615|9616|9710|9711|9712|9713|9714|9715) UNSUPPORTED=0;LEGACY=5 ;;
    *) UNSUPPORTED=1 ;;
   esac
   ;;
 esac
done

X_VER=$(X -version 2>&1 | grep -E '(X Window System Version|X.Org X Server) [0-9]\.' | sed -e 's/^.*X Window System Version //;s/^.*X.Org X Server //' | cut -d' ' -f1)

case $LEGACY in
 1|2) case $X_VER in
     1.[5-9]*|1.1[0-9]*) UNSUPPORTED=1 ;;
    esac ;;
 3|4) case $X_VER in
     1.[6-9]*|1.1[0-9]*) UNSUPPORTED=1 ;;
    esac ;;
esac

KVER=$(uname -r)
KV=$(uname -r|cut -d. -f1-2)

RMML=0
SHELL=0
UPDATE=0
VER_FORCE=""
PRINT_VER=0
NO_X_KILL=0
PATCH=0
COMPOSITE=1
AUTO_RES=0
AUTO_SYNC=0
FIREGL=0

while getopts pabcfrsuv:yzh opt; do
 case $opt in
  p) PRINT_VER=1
     ;;
  a) AUTO_RES=1
     ;;
  b) AUTO_SYNC=1
     ;;
  c) COMPOSITE=0
     ;;
  f) FIREGL=1
     ;;
  r) RMML=1
     ;;
  s) SHELL=1
     ;;
  u) UPDATE=1
     ;;
  v) VER_FORCE="$OPTARG"
     ;;
  y) PATCH=1
     ;;
  z) NO_X_KILL=1
     ;;
  \?|h) echo "Usage $0 [options] " >&2
        echo "optional options are:" >&2
        echo " -a      Use Auto-Selection for screen res" >&2
        echo " -b      Use Auto-Selection for H/V sync" >&2
        echo " -c      Disable Composite extension" >&2
        echo " -r      Remove ModeLines" >&2
        echo " -v VER  Force use of specific driver version. Example: -v 8.29.6" >&2
        echo " -p      Print driver version to be installed and quit" >&2
	echo " -s      Run shell before ati-installer.sh (debug)" >&2
	echo " -u      Update package scripts (debug)" >&2
        echo " -y      Force patching. Special purpose only!" >&2
        echo " -z      No X kill/restart. Special purpose only!" >&2
        echo " -h      Show this help" >&2
        exit 6
        ;;
 esac
done

# most DX8 cards
VER_LEGACY_1=8.28.8

# rest of DX8 cards
VER_LEGACY_2=8.29.6

# FireGL DX9 cards
VER_LEGACY_3=9-3

# all DX9 cards
VER_LEGACY_4=9-3

# all DX10 cards
VER_LEGACY_5=13.1-legacy

# OpenCL1.2-Static-Cplus-preview
#VER_SPECIAL=8.93.10

# AMD Radeon HD 7970
#VER_SPECIAL=8.921

# OpenCL1.2beta
#VER_SPECIAL=8.96

# Catalyst 12.6 Beta
#VER_SPECIAL=8.98

# Last official stable
VER_SPECIAL=13.1

VER=13.2-beta6
#VER=13.2-beta3
#VER=13.1
#VER=12.11-beta11
#VER=12.11-beta
#VER=12.10
#VER=12-9-beta
#VER=12-8
#VER=12.6-legacy
#VER=12-6
#VER=8.98
#VER=12-4
#VER=12-3
#VER=8.96
#VER=12-2
#VER=8.93.10
#VER=12-1
#VER=11-12
#VER=11-11
#VER=11-10
#VER=11-9
#VER=11-8
#VER=8.88.8
#VER=11-7
#VER=11-6
#VER=11-5
#VER=11-4
#VER=8.84
#VER=11-3
#VER=11-2
#VER=11-1
#VER=10-12
#VER=10-11
#VER=10-10
#VER=10-9
#VER=10-8
#VER=10-7
#VER=10-6
#VER=10-5
#VER=10-4
#VER=8.712.3.1
#VER=10-3
#VER=10-2
#VER=10-1
#VER=8.682.2
#VER=9-12
#VER=9-11
#VER=9-10
#VER=9-9
#VER=9-8
#VER=9-7
#VER=9-6
#VER=9-5
#VER=9-4
#VER=9-3
#VER=9.2
#VER=9-1
#VER=8-12
#VER=8-11
#VER=8-10
#VER=8-9
#VER=8-8
#VER=8-7
#VER=8-6
#VER=8-5
#VER=8-4
#VER=8-3
#VER=8-02
#VER=8-01
#VER=8.443.1
#VER=7-11
#VER=8.42.3
#VER=8.41.7
#VER=8.40.4
# Google Earth does not run with 8.40.4
#VER=8.39.4
# first release 8.39.4 showed "AMD Testing use only" in down right corner ;)
#VER=8.38.7
#VER=8.38.6
#VER=8.37.6
#VER=8.36.5
# No modeline support for Xorg 7.2 - disabled
#VER=8.35.5
#VER=8.34.8
#VER=8.33.6
# 8.33.6 used 85 hz on 75 hz max setting with modelines
# 8.33.6 and newer required for Xorg 7.2
#VER=8.32.5
# 8.32.5 supports Xorg 7.2 RC2
#VER=8.31.5
#VER=8.30.3
# 8.30.3 does not work with 71c1|71d4|71d5
#VER=8.29.6
#VER=8.28.8
#VER=8.27.10
# 8.27.10 and newer required for Xorg 7.1
#VER=8.26.18
#VER=8.25.18
#VER=8.24.8
#VER=8.23.7
#VER=8.22.5

[ "$LEGACY" = "1" ] && VER=$VER_LEGACY_1
[ "$LEGACY" = "2" ] && VER=$VER_LEGACY_2
[ "$LEGACY" = "3" ] && VER=$VER_LEGACY_3
[ "$LEGACY" = "4" ] && VER=$VER_LEGACY_4
[ "$LEGACY" = "5" ] && VER=$VER_LEGACY_5

if [ -n "$VER_FORCE" ]; then
 if [ "${#VER_FORCE}" = "1" ]; then
  [ "$VER_FORCE" = "1" ] && VER=$VER_LEGACY_1
  [ "$VER_FORCE" = "2" ] && VER=$VER_LEGACY_2
  [ "$VER_FORCE" = "3" ] && VER=$VER_LEGACY_3
  [ "$VER_FORCE" = "4" ] && VER=$VER_LEGACY_4
  [ "$VER_FORCE" = "5" ] && VER=$VER_LEGACY_5
  [ "$VER_FORCE" = "s" ] && VER=$VER_SPECIAL
 else
  VER=$VER_FORCE
 fi
fi

# check for pipe usage
[ "$0" = "sh" -o "$0" = "bash" ] && NO_X_KILL=1

# check for kms usage - not possible to unload
lsmod|grep -q drm_kms_helper && NO_X_KILL=1

if [ "$UNSUPPORTED" = "1" ]; then
 echo Error: No supported ATI RADEON/FIREGL adapter found. >&2
 exit 3
fi

if [ "$PRINT_VER" = "1" ]; then
 echo $VER
 exit
fi

if [ ! -f /etc/kanotix-version ]; then
 echo Error: No KANOTIX found. Do not ask for support! >&2
fi
if [ ! -f /etc/debian_version ]; then
 echo Error: No Debian compatible system found. Do not ask for support! >&2
 exit 100
fi
if [ "$(id -u)" != 0 ]; then
 echo Error: You must be root to run this script! >&2
 exit 6
fi
LAPTOP=""
[ "$(find /proc/acpi/battery/ -mindepth 1 -type d 2>/dev/null)" ] && LAPTOP="yes"
[ -d /KNOPPIX -o -d /KANOTIX ] && INSTALLED="no" || INSTALLED="yes"
if [ -f /etc/default/distro ]; then
 . /etc/default/distro
 [ "$FLL_DISTRO_MODE" = "live" ] && INSTALLED="no"
fi
if [ "$INSTALLED" = "yes" ]; then
 if [ "$NO_X_KILL" = "0" ] && [ -n "$DISPLAY" ]; then
  echo Error: Can\`t be run within X! Use a text console \(ALT-CTRL-F1\) >&2
  exit 7
 fi
else
 if grep -q -e unionfs -e aufs /proc/mounts; then
  echo Unionfs found. >&2
 else
  echo Activating Unionfs now. >&2
  UNIONFS=unionfs
  modinfo aufs >/dev/null 2>&1 && UNIONFS=aufs
  AUFSOPT=""
  [ "$UNIONFS" = "aufs" ] && AUFSOPT="udba=reval,"
  mkdir -p /tmp/union
  UNION=/KNOPPIX
  [ -d /KANOTIX ] && UNION=/KANOTIX
  [ -d "$FLL_MOUNTPOINT" ] && UNION="$FLL_MOUNTPOINT"
  mount -t $UNIONFS -o ${AUFSOPT}dirs=/tmp/union/:$UNION none $UNION/ >/dev/null 2>&1
 fi
fi
X_CONF=XF86Config-4
if which Xorg >/dev/null; then
 [ -e /etc/X11/xorg.conf ] && X_CONF=xorg.conf
fi

X_CONF_CREATE=0
if ! [ -e /etc/X11/$X_CONF ]; then
 X_CONF=xorg.conf
 X_CONF_CREATE=1
fi

unset UP

# create minimalistic xorg.conf when without Driver entry

if [ "$X_CONF_CREATE" = "0" ]; then
 if ! grep -v ^# /etc/X11/$X_CONF|grep Driver|grep -q -e ati -e fglrx -e radeon -e fbdev -e vesa; then
  echo Warning: /etc/X11/$X_CONF needs some modifications. Trying now. >&2
  if ! [ -x /usr/bin/patch ]; then
   apt-get update && UP=1
   apt-get install --allow-unauthenticated --yes patch
  fi
  if ! [ -x /usr/bin/patch ]; then
   echo Error: No patch tool installed - please install it and try again! >&2
   exit 7
  fi
  rm -f /etc/X11/$X_CONF.pure /etc/X11/$X_CONF.rej
  cp /etc/X11/$X_CONF /etc/X11/$X_CONF.pure
  if ! grep -q "Device.*Configured Video Device" /etc/X11/$X_CONF; then
   echo 'Warning: Adding "Configured Video Device" to "Screen" Section.' >&2
   perl -pi -e 's/(^\tMonitor\t\t"Configured Monitor"\n)/\1\tDevice\t\t"Configured Video Device"\n/' /etc/X11/$X_CONF
  fi
  patch --no-backup-if-mismatch /etc/X11/$X_CONF <<'EOT'
Index: xorg.conf
@@ -31,6 +31,7 @@
 
 Section "Device"
 	Identifier	"Configured Video Device"
+	Driver		"vesa"
 EndSection
 
 Section "Monitor"
@@ -41,6 +42,11 @@
 	Identifier	"Default Screen"
 	Monitor		"Configured Monitor"
 	Device		"Configured Video Device"
+	DefaultDepth	24
+	SubSection	"Display"
+		Depth	24
+		Modes
+	EndSubSection
 EndSection
 
 Section "ServerLayout"
EOT
  if [ $? -ne 0 ]; then
   echo Error: Unable to patch. Please manually fix file! >&2
   rm -f /etc/X11/$X_CONF
   mv /etc/X11/$X_CONF.pure /etc/X11/$X_CONF
   exit 8
  else
   echo Warning: Patch applied successfully. >&2
  fi
 fi
fi
cd /usr/src

X -version 2>&1|grep -q -e "X Window System Version 7.1" && case $VER in 8.22.5|8.23.7|8.24.8|8.25.18|8.26.18)
 echo Error: No Xorg 7.1 support in $VER >&2
 exit 8
 ;;
esac
X -version 2>&1|grep -q -e "X Window System Version 7.2" -e "X Window System Version 1.3" -e "X Server 1.4" && case $VER in 8.22.5|8.23.7|8.24.8|8.25.18|8.26.18|8.27.10|8.28.8|8.29.6|8.30.3|8.31.5|8.32.5)
 echo Error: No Xorg 7.2 support in $VER >&2
 case $VER in
  8.28.8|8.29.6|8.32.5)
   if [ "$PATCH" = "1" ]; then
    echo Warning: Only incomplete patch possible \(2d only\) >&2
   else
    echo Error: Only incomplete patch possible \(2d only\), use -y option to try >&2
    exit 9
   fi
   ;;
  *)
   exit 10
   ;;
 esac
esac
if X -version 2>&1|grep -q -e "X Window System Version 1.3" -e "X Server 1.4"; then
 case $VER in
  8.33.6|8.34.8|8.35.5|8.36.5)
   echo Error: No Xorg 1.3 support in $VER >&2
   PATCH=1
   ;;
  8.37.6|8.38.6|8.38.7|8.39.4|8.40.4|8.41.7|8.42.3|7-11|8.443.1|8-01|8-02|8.3|8-3|8-4|8-5|8-6|8-7|8-8|8-9|8-10|8-11|8-12|9-*|1*-*|8.5*|8.6*|8.7*|8.8*|8.9*|9.*) # supports Xorg 1.3
   ;;
  *)
   if [ "$PATCH" = "0" ]; then
    echo Error: Unknown status of Xorg 1.3 support for this release, use -y to force. >&2
    exit 11
   fi
   ;;
 esac
fi

#[ "$VER" = "8.84" ] && PATCH=1

[ "$PATCH" = "1" ] && echo Warning: Patching driver to support any Xorg release >&2
#if [ "$VER" = "8.39.4" ]; then
# PATCH=1
# echo Warning: Brutally patching driver to disable logo >&2
#fi

case $VER in 
 8.38.7|8.38.6|8.37.6|8.36.5|8.35.5|8.34.8|8.33.6|8.32.5|8.31.5|8.30.3|8.29.6|8.28.8|8.27.10|8.26.18|8.25.18|8.24.8|8.23.7|8.22.5)
  if [ $(set -f ; IFS=.- ; set -- $KVER ; printf %d%.2d%.4d "$1" "$2" "$3") -ge 2060024 ]; then
   echo Error: No patches available to get selected driver release work with current kernel! >&2
   exit 12
  fi
  ;;
esac

# remove possible live-config file
rm -vf /etc/profile.d/zz-live.sh

CPU=$(uname -m)
if [ "$CPU" = "x86_64" ]; then
 ARCH="amd64"
else
 ARCH="i386"
fi

CPU="x86.x86_64" # since 8.31.5
if [ "$VER" = "8.22.5" -o "$VER" = "8.23.7" ]; then 
 if [ "$ARCH" = "i386" ]; then
  CPU="i386"
 else
  CPU="x86_64"
 fi
fi
case $VER in 
 8.24.8|8.25.18|8.26.18|8.27.10|8.28.8|8.29.6|8.30.3) CPU="x86" ;;
esac

unset X86
[ "$ARCH" = "amd64" ] && X86=64
unset BIT
[ "$ARCH" = "amd64" ] && BIT="64bit/"
[ "$VER" = "8-11" ] && BIT="64bit/"

case $VER in
 11-12|11-11|11-10|11-9|11-8|8.88.8|11-7|11-6|11-5|11-4|8.84|11-3|11-2|11-1|10-12|10-11|10-10|10-9|10-8|10-7|10-6|10-5|10-4|8.712.3.1|10-3|10-2|10-1|8.682.2|9-12|9-11|9-10|9-9|9-8|9-7|9-6|9-5|9-4|9-3|9.2|9-1|8-12|8-11|8-10|8-9|8-8|8-7|8-6|8-5|8-4|8-3|8-02|8-01|8.443.1|7-11|8.42.3|8.41.7|8.40.4|8.39.4|8.38.7|8.38.6|8.37.6|8.36.5|8.35.5|8.34.8|8.33.6|8.32.5|8.31.5|8.30.3|8.29.6|8.28.8|8.27.10|8.26.18|8.25.18|8.24.8|8.23.7|8.22.5) VENDOR=ati ;;
 *) VENDOR=amd ;;
esac

case $VER in
 8.22.5|8.23.7|8.24.8|8.25.18|8.26.18|8.27.10) DRIVER=ati-driver-installer-$VER-$CPU.run ;;
 8.24.8|8.25.18|8.26.18|8.27.10|8.28.8|8.29.6|8.30.3) DRIVER=ati-driver-installer-$VER.run ;;
 12.1*) DRIVER=$VENDOR-driver-installer-catalyst-$VER-$CPU.run ;;
 1[3-9].*) DRIVER=$VENDOR-driver-installer-catalyst-$VER-linux-$CPU.run ;;
 *) DRIVER=$VENDOR-driver-installer-$VER-$CPU.run ;;
esac

if [ ! -e $DRIVER -a "$VER" = 8.682.2 ]; then
 wget --referer amd.com -Nc http://www2.ati.com/drivers/hotfix/Catalyst_9.12_Hotfix_Linux_8.682.2RC1_Dec15.zip
 unzip -jo Catalyst_9.12_Hotfix_Linux_8.682.2RC1_Dec15.zip "*.run"||rm -f Catalyst_9.12_Hotfix_Linux_8.682.2RC1_Dec15.zip
fi

if [ ! -e $DRIVER -a "$VER" = 8.712.3.1 ]; then
 wget --referer amd.com -Nc http://www2.ati.com/drivers/hotfix/ATI_Catalyst_10.3_OGL4_Preview_Linux.zip
 unzip -jo ATI_Catalyst_10.3_OGL4_Preview_Linux.zip "*.run"||rm -f ATI_Catalyst_10.3_OGL4_Preview_Linux.zip
fi

if [ ! -e $DRIVER -a "$VER" = 8.84 ]; then
 wget -O ati-driver-installer-$VER-x86.x86_64.run --referer amd.com -c http://www2.ati.com/drivers/hotfix/caicos_turks_barts_le/amd_catalyst_8.84_linux_radeon_hd_6700_6600_6500_6400_apr5.run
fi

if [ ! -e $DRIVER -a "$VER" = 8.88.8 ]; then
 wget -O ati-driver-installer-$VER-x86.x86_64.run --referer amd.com -c http://www2.ati.com/drivers/hotfix/AMD_Catalyst_Preview_driver_OpenGL_4.2_beta_support_8.88.8-x86.x86_64.run
fi

if [ ! -e $DRIVER -a "$VER" = 8.921 ]; then
 wget --referer amd.com -Nc http://www2.ati.com/drivers/hotfix/radeon_7900_series/amd-driver-installer-8.921-x86.x86_64.run
fi

if [ ! -e $DRIVER -a "$VER" = 8.93.10 ]; then
 wget --referer amd.com -Nc http://download2-developer.amd.com/amd/APPSDK/OpenCL/OpenCL1.2-Static-Cplus-preview-drivers-Linux.tgz
 tar xzf OpenCL1.2-Static-Cplus-preview-drivers-Linux.tgz
 unzip -jo root/Desktop/rt/111216a-130492E-LNX/R6LNX/8.93.10-111216a-130492E.zip \*.run||rm -f OpenCL1.2-Static-Cplus-preview-drivers-Linux.tgz
 rm -rf root
fi

if [ ! -e $DRIVER -a "$VER" = 8.96 ]; then
 wget --referer amd.com -Nc http://download2-developer.amd.com/amd/APPSDK/OpenCL1.2betadriversLinux.tgz
 tar xzf OpenCL1.2betadriversLinux.tgz fglrx-8.96/amd-driver-installer-8.96-x86.x86_64.run||rm -f OpenCL1.2betadriversLinux.tgz fglrx-8.96/amd-driver-installer-8.96-x86.x86_64.run
 [ -f fglrx-8.96/amd-driver-installer-8.96-x86.x86_64.run ] && mv fglrx-8.96/amd-driver-installer-8.96-x86.x86_64.run .
 rmdir fglrx-8.96
fi

if [ ! -e $DRIVER -a "$VER" = 8.98 ]; then
 wget --referer amd.com -Nc http://www2.ati.com/drivers/hotfix/catalyst_12.6_hotfixes/amd-driver-installer-8.98-x86.x86_64.zip
 unzip -jo amd-driver-installer-8.98-x86.x86_64.zip "*.run"||rm -f amd-driver-installer-8.98-x86.x86_64.zip
fi

if [ ! -e $DRIVER -a "$VER" = 12.6-legacy ]; then
 wget --referer amd.com -Nc http://www2.ati.com/drivers/legacy/amd-driver-installer-12.6-legacy-x86.x86_64.zip
 unzip -jo amd-driver-installer-12.6-legacy-x86.x86_64.zip "*.run"||rm -f amd-driver-installer-12.6-legacy-x86.x86_64.zip
fi

if ! [ -e $DRIVER ]; then
 #wget --referer=ati.com -Nc http://www2.ati.com/drivers/linux/${BIT}${DRIVER}
 wget --referer=ati.com -Nc http://www2.ati.com/drivers/linux/${DRIVER} 
fi

if ! [ -e $(basename ${DRIVER} .run).zip ]; then
 #wget --referer=ati.com -Nc http://www2.ati.com/drivers/linux/${BIT}${DRIVER}
 wget --referer=ati.com -Nc http://www2.ati.com/drivers/linux/$(basename ${DRIVER} .run).zip
 VER=$(unzip -jo $(basename ${DRIVER} .run).zip "*.run"| awk '/inflating:/{print $2}' | sed 's/amd-driver-installer-//;s/-x86.x86_64.run//')
 [ -n "$VER" ] && DRIVER=$VENDOR-driver-installer-$VER-$CPU.run
fi

if ! [ -e $(basename ${DRIVER} .run).zip ]; then
 #wget --referer=ati.com -Nc http://www2.ati.com/drivers/linux/${BIT}${DRIVER}
 wget --referer=ati.com -Nc http://www2.ati.com/drivers/beta/$(basename ${DRIVER} .run).zip
 VER=$(unzip -jo $(basename ${DRIVER} .run).zip "*.run"| awk '/inflating:/{print $2}' | sed 's/amd-driver-installer-//;s/-x86.x86_64.run//')
 [ -n "$VER" ] && DRIVER=$VENDOR-driver-installer-$VER-$CPU.run
fi

if ! [ -e $(basename ${DRIVER} .run).zip ]; then
 #wget --referer=ati.com -Nc http://www2.ati.com/drivers/linux/${BIT}${DRIVER}
 wget --referer=ati.com -Nc http://www2.ati.com/drivers/legacy/$(basename ${DRIVER} .run).zip
 VER=$(unzip -jo $(basename ${DRIVER} .run).zip "*.run"| awk '/inflating:/{print $2}' | sed 's/amd-driver-installer-//;s/-x86.x86_64.run//')
 [ -n "$VER" ] && DRIVER=$VENDOR-driver-installer-$VER-$CPU.run
fi

GL=/usr/X11R6/lib/libGL.so.1.2

export FORCE_ATI_UNINSTALL=1
[ -x /usr/share/ati/fglrx-uninstall.sh ] && /usr/share/ati/fglrx-uninstall.sh

dpkg --purge fglrx${X86}-4-3-0 >/dev/null 2>&1
dpkg --purge fglrx${X86}-6-8-0 >/dev/null 2>&1
dpkg --purge fglrx-glc22 >/dev/null 2>&1
dpkg --purge fglrx >/dev/null 2>&1
for package in $(dpkg-divert --list|grep "diversion of $GL"|cut -f7 -d' '|grep -v -e fglrx-driver -e xorg-driver-fglrx); do 
 dpkg-divert --package $package --remove $GL
done
[ -f /var/lib/dpkg/info/xorg-driver-fglrx.postrm ] && sed -i 'sX> /dev/nullX||trueX' /var/lib/dpkg/info/xorg-driver-fglrx.postrm

if [ -e $GL.1st ]; then
 rm -f $GL
 mv $GL.1st $GL
fi

rm -rf /usr/share/ati

unset UP

# Ubuntu universe workaround
[ -r /etc/lsb-release ] && . /etc/lsb-release
if [ "$DISTRIB_ID" = "Ubuntu" ]; then
 if ! grep -Eq "^[[:space:]]*deb[[:space:]]+.*universe$" /etc/apt/sources.list; then
  grep -Eq "deb[[:space:]]+.*universe$" /etc/apt/sources.list && sed -i 's/^#\s*\(deb\s.*universe\)$/\1/' /etc/apt/sources.list
 fi
fi
# Ubuntu intrepid multiverse workaround
#if [ "$DISTRIB_ID" = "Ubuntu" -a "$DISTRIB_CODENAME" = "intrepid" ]; then
# if ! grep -Eq "^[[:space:]]*deb[[:space:]]+.*multiverse$" /etc/apt/sources.list; then
#  grep -Eq "deb[[:space:]]+.*multiverse$" /etc/apt/sources.list && sed -i 's/^#\s*\(deb\s.*multiverse\)$/\1/' /etc/apt/sources.list
#  unset UP
# fi
#fi

if ! [ -x /usr/bin/module-assistant ]; then
 apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes module-assistant
fi

if ! [ -d /usr/share/build-essential ]; then
 [ -z "$UP" ] && apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes build-essential
fi

if ! [ -x /usr/bin/fakeroot ]; then
 [ -z "$UP" ] && apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes fakeroot
fi

if ! [ -x /usr/bin/dh_testdir ]; then
 [ -z "$UP" ] && apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes debhelper
fi

if ! [ -x /bin/bzip2 ]; then
 [ -z "$UP" ] && apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes bzip2
fi

if ! [ -f /usr/lib/libstdc++.so.5 ]; then
 [ -z "$UP" ] && apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes libstdc++5
fi

if [ "$(uname -m)" = "x86_64" -a ! -d /usr/share/doc/ia32-libs ]; then
 [ -z "$UP" ] && apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes ia32-libs
fi

if [ "$(uname -m)" = "x86_64" ] && ! [ -f /emul/ia32-linux/usr/lib/libXcursor.so.1 -o -f /usr/lib32/libXcursor.so.1 ]; then
 [ -z "$UP" ] && apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes ia32-libs-gtk
fi

if [ "$(uname -m)" = "x86_64" -a ! -d /usr/share/doc/ia32-libs -a ! -d /usr/share/doc/lib32gcc1 ] ; then
 [ -z "$UP" ] && apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes lib32gcc1
fi

if ! [ -x /usr/bin/module-assistant ]; then
 echo "Error: module-assistant missing." >&2
 [ -r /etc/lsb-release ] && . /etc/lsb-release
 [ "$DISTRIB_ID" = "Ubuntu" ] && echo "Hint: Enable universe repository in /etc/apt/sources.list." >&2
 exit 1
fi

if ! [ -x /usr/sbin/dkms ]; then
 [ -z "$UP" ] && apt-get update && UP=1
 FROZEN=0
 [ -f /etc/frozen-rc.d ] && FROZEN=1
 [ -x /usr/sbin/unfreeze-rc.d ] && /usr/sbin/unfreeze-rc.d
 apt-get install --allow-unauthenticated --yes dkms
 [ "$FROZEN" = "1" -a -x /usr/sbin/freeze-rc.d ] && /usr/sbin/freeze-rc.d
fi

if ! [ -x /usr/sbin/dkms ]; then
 m-a -i prepare
 FROZEN=0
 [ -f /etc/frozen-rc.d ] && FROZEN=1
 [ -x /usr/sbin/unfreeze-rc.d ] && /usr/sbin/unfreeze-rc.d
 #DKMS_DEB=dkms_2.0.20.4-0ubuntu1_all.deb
 #wget -N http://linux.dell.com/dkms/$DKMS_DEB
 DKMS_DEB=dkms_2.0.20.4-0ubuntu3_all.deb
 wget -N http://kanotix.com/files/thorhammer/backports-ubuntu/dkms/$DKMS_DEB
 dpkg -i $DKMS_DEB
 [ "$FROZEN" = "1" -a -x /usr/sbin/freeze-rc.d ] && /usr/sbin/freeze-rc.d
fi

DKMS=0

if [ -x /usr/sbin/dkms -a ! -f /usr/share/cdbs/1/rules/debhelper.mk ]; then
 apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes cdbs
fi

[ -x /usr/sbin/dkms -a -f /usr/share/cdbs/1/rules/debhelper.mk ] && DKMS=1

if [ -f /etc/modutils/1alsa ]; then
 mv /lib/modules/extra/alsa /lib/modules/$(uname -r)/
 rm -f /etc/modutils/1alsa
 depmod -a
fi

rm -rf fglrx-install /tmp/fglrx*
rm -f fglrx* 2>/dev/null
rm -f /tmp/xorg-driver-fglrx* xorg-driver-fglrx*
rm -f /etc/fglrxrc /etc/fglrxprofiles.csv
rm -rf /etc/ati

# Ubuntu workaround
[ -f /etc/default/linux-restricted-modules-common ] && perl -pi -e 's/^(DISABLED_MODULES)=.*/\1="fglrx"/' /etc/default/linux-restricted-modules-common
[ -x /sbin/lrm-manager ] && /sbin/lrm-manager

DISTRIB_ID=Debian
DISTRIB_CODENAME=etch
X -version 2>&1|grep -q -e "X Window System Version 6.9" -e "X Window System Version 7.0" && DISTRIB_CODENAME=sid
if [ -d /usr/lib/xorg/modules ]; then
 DISTRIB_ID=Ubuntu
 DISTRIB_CODENAME=dapper
fi
X -version 2>&1|grep -q -e "X Window System Version 7.1" -e "X Window System Version 7.2" -e "X Window System Version 1.3" -e "X Server 1.4" && [ "$VER" != "8.27.10" ] && DISTRIB_CODENAME=edgy

# Debian (and Ubuntu)
[ -f /etc/debian_version -a ! -f /etc/kanotix-version ] && m-a -i prepare

# Kanotix fallback
[ -f /etc/kanotix-version -a "$(readlink -e /lib/modules/$(uname -r)/build)" = "" ] && m-a -i prepare

#LC_ALL= LC_CTYPE= LC_MESSAGES= LANG= sh $DRIVER --buildpkg $DISTRIB_ID/$DISTRIB_CODENAME || (
LC_ALL= LC_CTYPE= LC_MESSAGES= LANG= sh $DRIVER --extract fglrx-install || (
 rm -f $DRIVER
 echo $DRIVER could not build Debian packages and has been deleted. >&2
 echo Please restart the script to try again. >&2
 exit 2
) || exit

cd fglrx-install

if [ ! -d packages/Ubuntu/dists/edgy ]; then
 DISTRIB_ID=Debian
 DISTRIB_CODENAME=etch
fi

FORCE_XARCH=
if [ "$DKMS" = "1" -a -d packages/Ubuntu/dists/intrepid ]; then
 DISTRIB_ID=Ubuntu
 DISTRIB_CODENAME=intrepid
 if [ -d x740 -o -d x750 -o -d xpic ]; then
  X_VER=$(X -version 2>&1 | grep -E '(X Window System Version|X.Org X Server) [0-9]\.' | sed -e 's/^.*X Window System Version //;s/^.*X.Org X Server //' | cut -d' ' -f1)
  case $X_VER in
   1.5*|1.6*) ;;
   1.7*|1.8*) 
    [ -r /etc/lsb-release ] && . /etc/lsb-release || DISTRIB_ID=Debian 
    if [ "$DISTRIB_ID" = "Ubuntu" ]; then
     DISTRIB_CODENAME=lucid
    else
     DISTRIB_ID=Ubuntu
     DISTRIB_CODENAME=intrepid
     #DISTRIB_CODENAME=hardy
     [ -d x750 ] && FORCE_XARCH=x750
    fi;;
   1.9*) 
    [ -r /etc/lsb-release ] && . /etc/lsb-release || DISTRIB_ID=Debian 
    if [ "$DISTRIB_ID" = "Ubuntu" ]; then
     DISTRIB_CODENAME=maverick
    else
     DISTRIB_ID=Ubuntu
     DISTRIB_CODENAME=intrepid
     #DISTRIB_CODENAME=hardy
     [ -d x760 ] && FORCE_XARCH=x760
    fi;;
   1.1[0-9]*)
    [ -r /etc/lsb-release ] && . /etc/lsb-release || DISTRIB_ID=Debian
    if [ "$DISTRIB_ID" != "Ubuntu" ]; then
     DISTRIB_ID=Ubuntu
     DISTRIB_CODENAME=intrepid
    fi;;
   *) DISTRIB_CODENAME=hardy;;
  esac
 fi
elif [ "$DKMS" = "1" -a -d packages/Ubuntu/dists/hardy ]; then
 DISTRIB_ID=Ubuntu
 DISTRIB_CODENAME=hardy
else
 DKMS=0
fi

if [ "$DISTRIB_CODENAME" = "intrepid" -o "$DISTRIB_CODENAME" = "karmic" -o "$DISTRIB_CODENAME" = "lucid" -o "$DISTRIB_CODENAME" = "maverick" -o "$DISTRIB_CODENAME" = "natty" -o "$DISTRIB_CODENAME" = "oneiric" -o "$DISTRIB_CODENAME" = "precise" ] && ! [ -f /usr/lib/libQtCore.so.4 ]; then
 [ -z "$UP" ] && apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes libqtcore4
fi

if [ "$DISTRIB_CODENAME" = "intrepid" -o "$DISTRIB_CODENAME" = "karmic" -o "$DISTRIB_CODENAME" = "lucid" -o "$DISTRIB_CODENAME" = "maverick" -o "$DISTRIB_CODENAME" = "natty" -o "$DISTRIB_CODENAME" = "oneiric" -o "$DISTRIB_CODENAME" = "precise" ] && ! [ -f /usr/lib/libQtGui.so.4 ]; then
 [ -z "$UP" ] && apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes libqtgui4
fi

if [ "$DISTRIB_CODENAME" = "karmic" -o "$DISTRIB_CODENAME" = "lucid" -o "$DISTRIB_CODENAME" = "maverick" -o "$DISTRIB_CODENAME" = "natty" -o "$DISTRIB_CODENAME" = "oneiric" -o "$DISTRIB_CODENAME" = "precise" ] && ! [ -f /usr/sbin/execstack ]; then
 [ -z "$UP" ] && apt-get update && UP=1
 apt-get install --allow-unauthenticated --yes prelink
fi

if [ "$DISTRIB_CODENAME" = "natty" -o "$DISTRIB_CODENAME" = "oneiric" -o "$DISTRIB_CODENAME" = "precise" ] && ! [ -f /usr/bin/dh_modaliases ]; then
 [ -z "$UP" ] && apt-get update && UP=1
  apt-get install --allow-unauthenticated --yes dh-modaliases
fi


[ "$VER" = "8.22.5" -o "$VER" = "8.23.7" ] && perl -pi -e 's/(XVERSIONMAX := )(\$\(basename \$\(XVERSION\)\).99)/${1}1:${2}/' packages/Debian/debian/rules
[ "$KV" = "2.6" ] && [ "$VER" = "8.22.5" -o "$VER" = "8.23.7" -o "$VER" = "8.24.8" ] && if [ "$(uname -r|grep -E '2.6.16|2.6.17')" != "" ]; then
 patch common/lib/modules/fglrx/build_mod/firegl_public.c <<EOT
Index: firegl_public.c
@@ -361,13 +361,15 @@
 } firegl_drm_stub_info_t;
 static firegl_drm_stub_info_t firegl_stub_info;
 
-#if LINUX_VERSION_CODE < 0x020400
+#if LINUX_VERSION_CODE > 0x02060F
 struct firegl_drm_stub_info_t *firegl_stub_pointer = NULL;
 #define inter_module_put(x)
 #define inter_module_unregister(x)
 #define inter_module_get_request(x,y)   firegl_stub_pointer
 #define inter_module_register(x,y,z)    do { firegl_stub_pointer = z; } while (0)
+#endif
 /* This is a kludge for backward compatibility that is only useful in DRM(stub_open) */
+#if LINUX_VERSION_CODE < 0x020400
 #define fops_put(fops)      MOD_DEC_USE_COUNT
 #define fops_get(fops)      (fops); MOD_INC_USE_COUNT
 #endif // LINUX_VERSION_CODE < 0x020400
@@ -2353,7 +2353,7 @@
 
 int ATI_API_CALL __ke_no_iommu(void)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,1)
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,1) && LINUX_VERSION_CODE < KERNEL_VERSION(2,6,16)
 #ifdef CONFIG_GART_IOMMU
     return no_iommu;
 #else /* !CONFIG_GART_IOMMU */
EOT
 patch common/lib/modules/fglrx/build_mod/2.6.x/Makefile <<EOT
Index: Makefile
@@ -1,4 +1,4 @@
-GCC_VER_MAJ      = \$(shell \$(CC) --version | head -n 1 | sed -e 's/[^0-9. ]//g;s/^ *//;s/^\(.\)\..*\$\$/\1/')
+GCC_VER_MAJ      = \$(shell \$(CC) -dumpversion | cut -f1 -d.)
 
 obj-m           += fglrx.o
 fglrx-libs      += libfglrx_ip.a.GCC\$(GCC_VER_MAJ)
@@ -24,36 +24,18 @@
 # on first call from remote location we get into this path
 # whilst on second call all is managed by the embedding kernel makefile
 
-KVER            = \$(shell uname -r)
-# KVER            = 2.6.0-0.test1.1.26custom
-
-ifeq (1,1)
-KDIR            = /lib/modules/\$(KVER)/build
-else
-KDIR            = /usr/src/linux-\$(KVER)
-endif
-PWD             = \$(shell pwd)
 
 fglrx-cfiles    = \${fglrx-c-objs:.o=.c}
 
 # default:: kmod_build
 
 kmod_build:: \$(fglrx-libs) \$(fglrx-cfiles) \$(fglrx-hdrs) \$(drm-hdrs)
-	\$(MAKE) -C \$(KDIR) SUBDIRS=\$(PWD) modules
-
-%.c:
-	@ln -s ../\$@
-
-%.h:
-	@ln -s ../\$@
-
-%.GCC\$(GCC_VER_MAJ):
-	@ln -s ../\$@
+	\$(MAKE) -C \$(KDIR) SUBDIRS=\$(CURDIR) modules
 
 # distclean:: clean
 
 clean::
-	rm -f *.c *.h *.o *.ko *.GCC* .??*
+	rm -f *.o *.ko .*.cmd
 
 endif
 
EOT
fi
[ "$KV" = "2.6" ] && [ "$VER" = "8.27.10" -o "$VER" = "8.28.8" ] && if [ "$(uname -r|grep -E '2.6.18|2.6.19|2.6.20|2.6.21|2.6.22')" != "" ]; then
 patch common/lib/modules/fglrx/build_mod/firegl_public.c <<EOT
Index: firegl_public.c
@@ -23,6 +23,9 @@

 // ============================================================
 #include <linux/version.h>
+#ifndef UTS_RELEASE
+#include <linux/utsrelease.h>
+#endif
 #ifdef MODVERSIONS
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,71)
 #include <linux/modversions.h>
@@ -208,6 +211,10 @@ _syscall3( int, modify_ldt, int, func, v
 #define preempt_enable()
 #endif

+#ifndef VM_SHM
+#define VM_SHM (0)
+#endif
+
 // ============================================================
 /* globals */

EOT
fi
case $VER in 8.22.5|8.23.7|8.24.8|8.25.18|8.26.18|8.27.10|8.28.8|8.29.6|8.30.3|8.31.5|8.32.5|8.33.6)
 [ "$KV" = "2.6" ] && if [ "$(uname -r|grep -E '2.6.20|2.6.21|2.6.22')" != "" -a ! -f  packages/Fedora/ati-drivers-2.6.20.patch -a ! -f packages/Fedora/firegl_public.c.patch ]; then
 # http://mlau.at/fglrx-833-2620-fixes.patch
 patch common/lib/modules/fglrx/build_mod/firegl_public.c <<'EOT'
Index: firegl_public.c
@@ -194,6 +194,82 @@
 int errno;
 #endif // __ia64__
 
+#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,19)
+#if defined(__i386__)
+
+#define __syscall_return(type, res) \
+do { \
+	if ((unsigned long)(res) >= (unsigned long)(-MAX_ERRNO)) { \
+		errno = -(res); \
+		res = -1; \
+	} \
+	return (type) (res); \
+} while (0)
+
+#define _syscall2(type,name,type1,arg1,type2,arg2) \
+type name(type1 arg1,type2 arg2) \
+{ \
+long __res; \
+__asm__ volatile ("push %%ebx ; movl %2,%%ebx ; int $0x80 ; pop %%ebx" \
+	: "=a" (__res) \
+	: "0" (__NR_##name),"ri" ((long)(arg1)),"c" ((long)(arg2)) \
+	: "memory"); \
+__syscall_return(type,__res); \
+}
+
+#define _syscall3(type,name,type1,arg1,type2,arg2,type3,arg3) \
+type name(type1 arg1,type2 arg2,type3 arg3) \
+{ \
+long __res; \
+__asm__ volatile ("push %%ebx ; movl %2,%%ebx ; int $0x80 ; pop %%ebx" \
+	: "=a" (__res) \
+	: "0" (__NR_##name),"ri" ((long)(arg1)),"c" ((long)(arg2)), \
+		  "d" ((long)(arg3)) : "memory"); \
+__syscall_return(type,__res); \
+}
+
+#elif defined(__x86_64__)
+#define __syscall_clobber "r11","rcx","memory"
+
+#define __syscall_return(type, res) \
+do { \
+	if ((unsigned long)(res) >= (unsigned long)(-MAX_ERRNO)) { \
+		errno = -(res); \
+		res = -1; \
+	} \
+	return (type) (res); \
+} while (0)
+
+#define __syscall "syscall"
+
+#define _syscall2(type,name,type1,arg1,type2,arg2) \
+type name(type1 arg1,type2 arg2) \
+{ \
+long __res; \
+__asm__ volatile (__syscall \
+	: "=a" (__res) \
+	: "0" (__NR_##name),"D" ((long)(arg1)),"S" ((long)(arg2)) : __syscall_clobber ); \
+__syscall_return(type,__res); \
+}
+
+#define _syscall3(type,name,type1,arg1,type2,arg2,type3,arg3) \
+type name(type1 arg1,type2 arg2,type3 arg3) \
+{ \
+long __res; \
+__asm__ volatile (__syscall \
+	: "=a" (__res) \
+	: "0" (__NR_##name),"D" ((long)(arg1)),"S" ((long)(arg2)), \
+		  "d" ((long)(arg3)) : __syscall_clobber); \
+__syscall_return(type,__res); \
+}
+
+#else
+
+#error "please fix the fglrx syscall mess"
+
+#endif	/* __i386__ */
+#endif	/* 2.6.19 */
+
 // int mlock(const void *addr, size_t len);
 _syscall2(int, mlock, const void *, addr, size_t, len )
 // int munlock(const void *addr, size_t len);
@@ -2561,11 +2637,23 @@ void ATI_API_CALL __ke_free_irq(unsigned
 #else
 static void ATI_API_CALL (*irq_handler_func)(int, void*, void*); /* function pointer variable */
 
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
 static irqreturn_t ke_irq_handler_wrap(int irq, void *arg1, struct pt_regs *regs)
 {
     irq_handler_func(irq, arg1, regs);
     return IRQ_HANDLED;
 }
+#else
+static irqreturn_t ke_irq_handler_wrap(int irq, void *arg1)
+{
+    irq_handler_func(irq, arg1, get_irq_regs());
+    return IRQ_HANDLED;
+}
+#endif
+
+#ifndef SA_SHIRQ
+#define SA_SHIRQ IRQF_SHARED
+#endif
 
 int ATI_API_CALL __ke_request_irq(unsigned int irq, 
     void (*ATI_API_CALL handler)(int, void *, void *),
EOT
 fi
esac
[ "$KV" = "2.6" ] && if [ "$(uname -r|grep -E '2.6.20|2.6.21|2.6.22')" != "" -a -f packages/Fedora/ati-drivers-2.6.20.patch ]; then
 patch -p0 < packages/Fedora/ati-drivers-2.6.20.patch
fi
[ "$KV" = "2.6" ] && if [ "$(uname -r|grep -E '2.6.20|2.6.21|2.6.22')" != "" -a -f packages/Fedora/firegl_public.c.patch ]; then
 patch common/lib/modules/fglrx/build_mod/firegl_public.c packages/Fedora/firegl_public.c.patch
fi
case $VER in 8.22.5|8.23.7|8.24.8|8.25.18|8.26.18|8.27.10|8.28.8|8.29.6|8.30.3|8.31.5|8.32.5|8.33.6|8.34.8|8.35.5|8.36.5|8.37.6|8.38.6|8.38.7)
 [ "$KV" = "2.6" ] && if [ "$(uname -r|grep -E '2.6.22')" != "" -a "$(uname -m)" = "x86_64" ]; then
 patch common/lib/modules/fglrx/build_mod/firegl_public.c <<'EOT'
--- common/lib/modules/fglrx/build_mod/firegl_public.c	2007-02-20 13:23:07.000000000 -0500
+++ common/lib/modules/fglrx/build_mod/firegl_public.c	2007-05-15 16:55:34.000000000 -0400
@@ -145,11 +145,11 @@
 #endif
 
 #ifdef __x86_64__
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,12)
-#include "linux/ioctl32.h"
-#else
-#include "asm/ioctl32.h"
-#endif
+//#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,12)
+//#include "linux/ioctl32.h"
+//#else
+//#include "asm/ioctl32.h"
+//#endif
 
 #ifdef __x86_64__
 #include "asm/compat.h"
EOT
 fi
esac
case $VER in 
 8.22.5|8.23.7|8.24.8|8.25.18|8.26.18|8.27.10|8.28.8|8.29.6|8.30.3|8.31.5|8.32.5|8.33.6|8.34.8|8.35.5|8.36.5|8.37.6|8.38.6|8.38.7) ;;
 8.39.4) [ "$KV" = "2.6" ] && if [ "$(uname -r|grep -E '2.6.23|2.6.24')" != "" ]; then
   #http://mlau.at/files/fglrx-839-2624rc-fixes.patch
   patch common/lib/modules/fglrx/build_mod/firegl_public.c <<'EOT'
crude patch to get fglrx-8.39 to compile against 2.6.23/2.6.24-rc4/5.
Use at your own risk!	-- mlau

--- firegl_public.c.orig	2007-07-20 22:51:46.000000000 +0200
+++ firegl_public.c	2007-12-11 18:35:16.000000000 +0100
@@ -214,6 +214,56 @@
 #define preempt_enable()
 #endif
 
+#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,22)
+#if defined(__i386__)
+#define ptep_test_and_clear_dirty(vma, addr, ptep) ({                  \
+       int __ret = 0;                                                  \
+       if (pte_dirty(*(ptep)))                                         \
+               __ret = test_and_clear_bit(_PAGE_BIT_DIRTY,             \
+                                               &(ptep)->pte_low);      \
+       if (__ret)                                                      \
+               pte_update((vma)->vm_mm, addr, ptep);                   \
+       __ret;                                                          \
+})
+
+static inline int pte_read(pte_t pte)	{ return (pte).pte_low & _PAGE_USER; }
+static inline int pte_user(pte_t pte)	{ return (pte).pte_low & _PAGE_USER; }
+#ifdef CONFIG_X86_PAE
+/*
+ * Is the pte executable?
+ */
+static inline int pte_x(pte_t pte)
+{
+        return !(pte_val(pte) & _PAGE_NX);
+}
+ 
+/*
+ * All present user-pages with !NX bit are user-executable:
+ */
+static inline int pte_exec(pte_t pte)
+{
+        return pte_user(pte) && pte_x(pte);
+}
+#else
+static inline int pte_exec(pte_t pte)
+{
+        return pte_user(pte);
+}
+#endif	/* PAE */
+
+#elif defined(__x86_64__)
+static inline int ptep_test_and_clear_dirty(struct vm_area_struct *vma,
+					unsigned long addr, pte_t *ptep)
+{
+	if (!pte_dirty(*ptep))
+		return 0;
+	return test_and_clear_bit(_PAGE_BIT_DIRTY, &ptep->pte);
+}
+static inline int pte_read(pte_t pte)	{ return pte_val(pte) & _PAGE_USER; }
+static inline int pte_exec(pte_t pte)	{ return !(pte_val(pte) & _PAGE_NX); }
+#endif
+#endif
+
 // ============================================================
 /* globals */
 
@@ -1831,7 +1881,7 @@ int ATI_API_CALL __ke_check_pci(int busn
 {
     struct pci_dev* pci_dev;
 
-    pci_dev = pci_find_slot(busnum, PCI_DEVFN(devnum, funcnum));
+    pci_dev = pci_get_slot(busnum, PCI_DEVFN(devnum, funcnum));
     if (!pci_dev)
         return 0;
 
@@ -1860,7 +1910,7 @@ int ATI_API_CALL __ke_pci_get_irq(__ke_p
 
 __ke_pci_dev_t* ATI_API_CALL __ke_pci_find_device (unsigned int vendor, unsigned int dev, __ke_pci_dev_t* from)
 {
-	return (__ke_pci_dev_t*)pci_find_device( vendor, dev, (struct pci_dev *)(void *)from );
+	return (__ke_pci_dev_t*)pci_get_device( vendor, dev, (struct pci_dev *)(void *)from );
 }
 
 void* ATI_API_CALL __ke_malloc(__ke_size_t size)
@@ -2333,7 +2383,7 @@ void ATI_API_CALL __ke_put_vm_page_table
 #ifndef ptep_clear_flush_dirty
 #define ptep_clear_flush_dirty(__vma, __address, __ptep) \
 ({							 \
-    int __dirty = ptep_test_and_clear_dirty(__ptep);	 \
+    int __dirty = ptep_test_and_clear_dirty(__vma, __address, __ptep);	 \
     if (__dirty)					 \
         flush_tlb_page(__vma, __address);		 \
     __dirty;						 \
@@ -2693,7 +2743,7 @@ int ATI_API_CALL __ke_pci_write_config_d
 
 __ke_pci_dev_t* ATI_API_CALL __ke_pci_find_slot(__ke_u32 bus, __ke_u32 slot)
 {
-    return (__ke_pci_dev_t*)pci_find_slot(bus, slot);
+    return (__ke_pci_dev_t*)pci_get_slot(bus, slot);
 }
 
 __ke_u8 ATI_API_CALL __ke_pci_get_busnr(__ke_pci_dev_t* pcidev)
@@ -2773,6 +2823,10 @@ void ATI_API_CALL __ke_disable_irq(int i
     disable_irq( irq );
 }
 
+#ifndef SA_SHIRQ
+#define SA_SHIRQ IRQF_SHARED
+#endif
+
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,71)
 int ATI_API_CALL __ke_request_irq(unsigned int irq, 
     void (*ATI_API_CALL handler)(int, void *, void *),
@@ -5277,7 +5331,7 @@ unsigned int ATI_API_CALL KAS_Spinlock_R
 /** \brief Type definition of the structure describing Slab Cache object */
 typedef struct tag_kasSlabCache_t
 {
-    kmem_cache_t* cache;        /* OS slab cache object */
+    struct kmem_cache *cache;	/* OS slab cache object */
     spinlock_t lock;            /* OS spinlock object protecting the cache */
     unsigned int routine_type;  /* Type of routine the cache might be accessed from */
     char name[14];              /* Cache object name (kernel 2.4 restricts its length to 19 chars) */
@@ -5323,7 +5377,7 @@ unsigned int ATI_API_CALL KAS_SlabCache_
     DBG_TRACE("creating slab object '%s'", slabcache_obj->name);
 
     if ((slabcache_obj->cache =
-            kmem_cache_create(slabcache_obj->name, iEntrySize, 0, 0, NULL, NULL)))
+            kmem_cache_create(slabcache_obj->name, iEntrySize, 0, 0, NULL)))
     {
         ret = 1;
     }

EOT
  fi
  ;;
 8.40.4|8.41.7|8.42.3) [ "$KV" = "2.6" ] && if [ "$(uname -r|grep -E '2.6.23|2.6.24')" != "" ]; then
   #http://mlau.at/files/fglrx-842-2623.patch
   patch common/lib/modules/fglrx/build_mod/firegl_public.c <<'EOT'
crude patch to make 8.42 compile against 2.6.23+.
The x64 version probably doesn't work.

Better get the patch from the ati-drivers sabayon overlay ;-)

--- firegl_public.c.orig	2007-10-23 19:31:26.000000000 +0200
+++ firegl_public.c	2007-10-23 19:32:07.000000000 +0200
@@ -217,6 +217,56 @@
 #define preempt_enable()
 #endif
 
+#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,22)
+#if defined(__i386__)
+#define ptep_test_and_clear_dirty(vma, addr, ptep) ({                  \
+       int __ret = 0;                                                  \
+       if (pte_dirty(*(ptep)))                                         \
+               __ret = test_and_clear_bit(_PAGE_BIT_DIRTY,             \
+                                               &(ptep)->pte_low);      \
+       if (__ret)                                                      \
+               pte_update((vma)->vm_mm, addr, ptep);                   \
+       __ret;                                                          \
+})
+
+static inline int pte_read(pte_t pte)	{ return (pte).pte_low & _PAGE_USER; }
+static inline int pte_user(pte_t pte)	{ return (pte).pte_low & _PAGE_USER; }
+#ifdef CONFIG_X86_PAE
+/*
+ * Is the pte executable?
+ */
+static inline int pte_x(pte_t pte)
+{
+        return !(pte_val(pte) & _PAGE_NX);
+}
+ 
+/*
+ * All present user-pages with !NX bit are user-executable:
+ */
+static inline int pte_exec(pte_t pte)
+{
+        return pte_user(pte) && pte_x(pte);
+}
+#else
+static inline int pte_exec(pte_t pte)
+{
+        return pte_user(pte);
+}
+#endif	/* PAE */
+
+#elif defined(__x86_64__)
+static inline int ptep_test_and_clear_dirty(struct vm_area_struct *vma,
+					unsigned long addr, pte_t *ptep)
+{
+	if (!pte_dirty(*ptep))
+		return 0;
+	return test_and_clear_bit(_PAGE_BIT_DIRTY, &ptep->pte);
+}
+static inline int pte_read(pte_t pte)	{ return pte_val(pte) & _PAGE_USER; }
+static inline int pte_exec(pte_t pte)	{ return !(pte_val(pte) & _PAGE_NX); }
+#endif
+#endif
+
 // ============================================================
 /* globals */
 
@@ -2489,7 +2539,7 @@ void ATI_API_CALL __ke_put_vm_page_table
 #ifndef ptep_clear_flush_dirty
 #define ptep_clear_flush_dirty(__vma, __address, __ptep) \
 ({							 \
-    int __dirty = ptep_test_and_clear_dirty(__ptep);	 \
+    int __dirty = ptep_test_and_clear_dirty(__vma, __address, __ptep);	 \
     if (__dirty)					 \
         flush_tlb_page(__vma, __address);		 \
     __dirty;						 \
@@ -2936,7 +2986,7 @@ int ATI_API_CALL __ke_request_irq(unsign
 {
     return request_irq(irq,
         (void(*)(int, void *, struct pt_regs *))handler,
-        SA_SHIRQ, dev_name, dev_id);
+        IRQF_SHARED, dev_name, dev_id);
 }
 
 void ATI_API_CALL __ke_free_irq(unsigned int irq, void *dev_id)
@@ -2959,7 +3009,7 @@ int ATI_API_CALL __ke_request_irq(unsign
     irq_handler_func = handler;
     return request_irq(irq,
         ke_irq_handler_wrap,
-        SA_SHIRQ, dev_name, dev_id);
+        IRQF_SHARED, dev_name, dev_id);
 }
 
 void ATI_API_CALL __ke_free_irq(unsigned int irq, void *dev_id)
@@ -5436,7 +5486,7 @@ unsigned int ATI_API_CALL KAS_Spinlock_R
 /** \brief Type definition of the structure describing Slab Cache object */
 typedef struct tag_kasSlabCache_t
 {
-    kmem_cache_t* cache;        /* OS slab cache object */
+    struct kmem_cache *cache;	/* OS slab cache object */
     spinlock_t lock;            /* OS spinlock object protecting the cache */
     unsigned int routine_type;  /* Type of routine the cache might be accessed from */
     char name[14];              /* Cache object name (kernel 2.4 restricts its length to 19 chars) */
@@ -5482,7 +5532,7 @@ unsigned int ATI_API_CALL KAS_SlabCache_
     DBG_TRACE("creating slab object '%s'", slabcache_obj->name);
 
     if ((slabcache_obj->cache =
-            kmem_cache_create(slabcache_obj->name, iEntrySize, 0, 0, NULL, NULL)))
+            kmem_cache_create(slabcache_obj->name, iEntrySize, 0, 0, NULL)))
     {
         ret = 1;
     }

EOT
  fi
  ;;
esac

[ "$VER" = "8.42.3" ] && patch -p1 <<'EOT'
diff -Nru ati-8.42.3.orig/packages/Debian/ati-packager.sh ati-8.42.3/packages/Debian/ati-packager.sh
--- ati-8.42.3.orig/packages/Debian/ati-packager.sh	2007-10-22 18:30:02.000000000 +0200
+++ ati-8.42.3/packages/Debian/ati-packager.sh	2007-10-11 23:22:35.000000000 +0200
@@ -95,6 +95,11 @@
     cp -f -R ${InstallerRootDir}/arch/${ARCH_DIR}/* ${TmpDrvFilesDir}
     cp -f -R ${InstallerRootDir}/common/* ${TmpDrvFilesDir}
 
+    if [ "$ARCH" = "amd64" ]; then
+        cp -f -R ${InstallerRootDir}/arch/x86/usr/X11R6/lib \
+                ${TmpDrvFilesDir}/usr/X11R6/
+    fi
+
     # Merge package files from the appropriate directories
     chmod -R u+w ${AbsDistroDir}
 	cp -f -R ${AbsDistroDir}/dists/${X_NAME} ${TmpDrvFilesDir}/debian
diff -Nru ati-8.42.3.orig/packages/Ubuntu/ati-packager.sh ati-8.42.3/packages/Ubuntu/ati-packager.sh
--- ati-8.42.3.orig/packages/Ubuntu/ati-packager.sh	2007-10-22 18:30:02.000000000 +0200
+++ ati-8.42.3/packages/Ubuntu/ati-packager.sh	2007-10-11 23:22:35.000000000 +0200
@@ -69,7 +69,7 @@
         dapper|6.06) X_DIR=x690; X_NAME=dapper;;
         edgy|6.10)   X_DIR=x710; X_NAME=edgy;;
         feisty|7.04) X_DIR=x710; X_NAME=feisty;;
-        gutsy|7.10) X_DIR=x710; X_NAME=gutsy;;
+        gutsy|7.10)  X_DIR=x710; X_NAME=gutsy;;
         *) echo "Error: invalid package name passed to --buildpkg" ; exit 1 ;;
     esac
 
@@ -97,6 +97,11 @@
     cp -f -R ${InstallerRootDir}/arch/${ARCH_DIR}/* ${TmpDrvFilesDir}
     cp -f -R ${InstallerRootDir}/common/* ${TmpDrvFilesDir}
 
+    if [ "$ARCH" = "amd64" ]; then
+        cp -f -R ${InstallerRootDir}/arch/x86/usr/X11R6/lib \
+		${TmpDrvFilesDir}/usr/X11R6/
+    fi
+
     # Merge package files from the appropriate directories
 	chmod -R u+w ${AbsDistroDir}
 	cp -f -R ${AbsDistroDir}/dists/${X_NAME} ${TmpDrvFilesDir}/debian

EOT

if [ "$(uname -r|grep -E '2.6.25')" != "" -a "$VER" = "8-5" ]; then
 # http://sarah-a-happy.livejournal.com/90345.html
 patch -p0 <<'EOT'
--- common/lib/modules/fglrx/build_mod/firegl_public.c.orig     2008-04-06 01:20:21.000000000 -0300
+++ common/lib/modules/fglrx/build_mod/firegl_public.c  2008-04-06 01:17:58.000000000 -0300
@@ -1885,7 +1885,7 @@
  */
 KCL_TYPE_Cap ATI_API_CALL KCL_PosixSecurityCapGetEffectiveVector()
 {
-    return cap_t(current->cap_effective);
+    return (current->cap_effective).cap[0];
 }
 
 /** \brief Set vector of effective security caps for the current process
@@ -1893,7 +1893,7 @@
  */
 void ATI_API_CALL KCL_PosixSecurityCapSetEffectiveVector(KCL_TYPE_Cap cap)
 {
-    cap_t(current->cap_effective) = cap;
+    (current->cap_effective).cap[0] = cap;
 }
 
 /** \brief Get number of available RAM pages

--- common/lib/modules/fglrx/build_mod/firegl_public.c.orig     2008-04-06 02:10:13.000000000 -0300
+++ common/lib/modules/fglrx/build_mod/firegl_public.c  2008-04-06 02:23:05.000000000 -0300
@@ -120,6 +120,7 @@
 #include <asm/cpufeature.h>
 #ifdef CONFIG_MTRR
 #include <asm/mtrr.h>
+#include <asm/cacheflush.h>
 #endif
 #include <asm/delay.h>
 #include <linux/agp_backend.h>
@@ -1158,7 +1159,7 @@
 
 int ATI_API_CALL KCL_SetPageNoCache(void* virt, int pages)
 {
-    return change_page_attr(virt_to_page(virt), pages, PAGE_KERNEL_NOCACHE);
+    return set_pages_uc(virt_to_page(virt), pages);
 }
 
 /** /brief Call global kernel task/thread scheduler */

EOT
fi

if [ "$(uname -r|grep -E '2.6.26')" != "" ] && [ "$VER" = "8-5" -o "$VER" = "8-6" ]; then
 cd common/lib/modules/fglrx/build_mod
 # http://launchpadlibrarian.net/15305502/0001-Linux-2.6.25.x-kernels-support.patch
 patch -p1 <<'EOT'
From 0dd050cd65a7dfff6685f1b2066f49e7086a4520 Mon Sep 17 00:00:00 2001
From: =?utf-8?q?=C5=BDilvinas=20Valinskas?= <zilvinas@wilibox.com>
Date: Fri, 13 Jun 2008 23:55:15 +0300
Subject: [PATCH] Linux 2.6.25.x kernels support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Žilvinas Valinskas <zilvinas@wilibox.com>
---
 firegl_public.c |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/firegl_public.c b/firegl_public.c
index f2bea44..0916436 100644
--- a/firegl_public.c
+++ b/firegl_public.c
@@ -4956,8 +4956,9 @@ static unsigned long kasSetExecutionLevel(unsigned long level)
 {
     unsigned long orig_level;
 
-    orig_level = __get_cpu_var(kasExecutionLevel);
+    orig_level = get_cpu_var(kasExecutionLevel);
     __get_cpu_var(kasExecutionLevel) = level;
+    put_cpu_var(kasExecutionLevel);
 
     return orig_level;
 }
@@ -4969,7 +4970,12 @@ static unsigned long kasSetExecutionLevel(unsigned long level)
  */
 static unsigned long kas_GetExecutionLevel(void)
 {
-    return __get_cpu_var(kasExecutionLevel);
+    unsigned long orig_level;
+
+    orig_level = get_cpu_var(kasExecutionLevel);
+    put_cpu_var(kasExecutionLevel);
+
+    return orig_level;
 }
 
 /** \brief Type definition for kas_spin_lock() parameter */
-- 
1.5.6.rc2.45.gdc92c
EOT
 # http://launchpadlibrarian.net/15305506/0002-Trivial-error-and-two-warnings-fixed.patch
 [ "$VER" = "8-5" ] && patch -p1 <<'EOT'
From 681d2406888fb07f584ecb83a921aca4bfd469a8 Mon Sep 17 00:00:00 2001
From: =?utf-8?q?=C5=BDilvinas=20Valinskas?= <zilvinas@wilibox.com>
Date: Sat, 14 Jun 2008 02:07:38 +0300
Subject: [PATCH] Trivial error and two warnings fixed.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Žilvinas Valinskas <zilvinas@wilibox.com>
---
 firegl_public.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/firegl_public.c b/firegl_public.c
index 0916436..664b38c 100644
--- a/firegl_public.c
+++ b/firegl_public.c
@@ -885,7 +885,7 @@ static struct pci_driver fglrx_pci_driver =
  * \return  count  -- number of devices found that this kernel module will support
  *
  */
-int count_drm_devices()
+int count_drm_devices(void)
 {
     int count = 0;
     struct pci_dev *pdev = NULL;
@@ -1681,7 +1681,7 @@ int ATI_API_CALL KCL_pci_enable_device_bars( __ke_pci_dev_t *dev)
 {
     u16 cmd;
 
-    pci_read_config_word(dev, PCI_COMMAND, &cmd);
+    pci_read_config_word((void *)dev, PCI_COMMAND, &cmd);
 
     if (!(cmd & PCI_COMMAND_IO))
     {
@@ -1693,7 +1693,7 @@ int ATI_API_CALL KCL_pci_enable_device_bars( __ke_pci_dev_t *dev)
         cmd |= PCI_COMMAND_MEMORY;
     }
 
-    pci_write_config_word(dev, PCI_COMMAND, cmd);
+    pci_write_config_word((struct pci_dev*)(void *)dev, PCI_COMMAND, cmd);
     return 0;
 }
 
-- 
1.5.6.rc2.45.gdc92c
EOT
 # http://launchpadlibrarian.net/15305508/0003-GCC-complains-return-with-a-value-in-function-ret.patch
 patch -p1 <<'EOT'
From a94e42382fbf70d88d71c473b392a2e0656dcf0c Mon Sep 17 00:00:00 2001
From: =?utf-8?q?=C5=BDilvinas=20Valinskas?= <zilvinas@wilibox.com>
Date: Sat, 14 Jun 2008 02:10:00 +0300
Subject: [PATCH] GCC complains `return' with a value, in function returning void
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Žilvinas Valinskas <zilvinas@wilibox.com>
---
 firegl_public.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/firegl_public.c b/firegl_public.c
index 664b38c..d71700d 100644
--- a/firegl_public.c
+++ b/firegl_public.c
@@ -3190,7 +3190,7 @@ int ATI_API_CALL __ke_register_ioctl32_conversion(unsigned int cmd, int (*handle
 void ATI_API_CALL __ke_unregister_ioctl32_conversion(unsigned int cmd)
 {
 #ifdef FIREGL_IOCTL_COMPAT
-    return 0;
+    return;
 #else
     unregister_ioctl32_conversion(cmd);
 #endif
-- 
1.5.6.rc2.45.gdc92c
EOT
 # http://launchpadlibrarian.net/15305524/0004-Linux-2.6.26.x-kernels-support.patch
 [ "$VER" = "8-5" ] && patch -p1 <<'EOT'
From d6ef03ff417eb001653c51112c79e709ba8eaec9 Mon Sep 17 00:00:00 2001
From: =?utf-8?q?=C5=BDilvinas=20Valinskas?= <zilvinas@wilibox.com>
Date: Sat, 14 Jun 2008 03:54:38 +0300
Subject: [PATCH] Linux 2.6.26.x kernels support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

o trailing white spaces/tabs removed.
o VMA ->nopage() removed, go for ->fault()
o compiles with warnings ...
o most importantly ... WORKS on 2.6.26-rc6/amd64!

Signed-off-by: Žilvinas Valinskas <zilvinas@wilibox.com>
---
 firegl_public.c |  655 ++++++++++++++++++++++++-------------------------------
 firegl_public.h |    8 +-
 2 files changed, 288 insertions(+), 375 deletions(-)

diff --git a/firegl_public.c b/firegl_public.c
index d71700d..3c8e72a 100644
--- a/firegl_public.c
+++ b/firegl_public.c
@@ -24,13 +24,13 @@
 // ============================================================
 #include <linux/version.h>
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0) 
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
 #error Kernel versions older than 2.6.0 are no longer supported by this module.
-#endif 
+#endif
 
 #include <linux/autoconf.h>
 
-#if !defined(CONFIG_X86_PC) 
+#if !defined(CONFIG_X86_PC)
 #if !defined(CONFIG_X86_64)
 #if !defined(CONFIG_X86_VOYAGER)
 #if !defined(CONFIG_X86_NUMAQ)
@@ -62,10 +62,10 @@
  * distribution would even include such a kernel patch. */
 #ifdef CONFIG_MEM_MIRROR
 /* Prevent asm/mm_track.h from being included in subsequent
- * kernel headers as that would redefine CONFIG_MEM_MIRROR. */ 
+ * kernel headers as that would redefine CONFIG_MEM_MIRROR. */
 #ifndef CONFIG_X86_64
 #define __I386_MMTRACK_H__
-#define mm_track(ptep)                 
+#define mm_track(ptep)
 #else
 #define __X86_64_MMTRACK_H__
 #define mm_track_pte(ptep)
@@ -93,7 +93,7 @@
 #include <linux/kernel.h>
 #include <linux/fs.h>
 #include <linux/proc_fs.h>
-#include <linux/init.h>
+//#include <linux/init.h>
 #include <linux/file.h>
 #include <linux/pci.h>
 #include <linux/wait.h>
@@ -151,8 +151,8 @@
 #include "linux/freezer.h"
 #endif
 
-//  For 2.6.18 or higher, the UTS_RELEASE is defined in the linux/utsrelease.h. 
-#ifndef UTS_RELEASE 
+//  For 2.6.18 or higher, the UTS_RELEASE is defined in the linux/utsrelease.h.
+#ifndef UTS_RELEASE
 #include <linux/utsrelease.h>
 #endif
 
@@ -210,7 +210,7 @@ char* firegl = NULL;
 int __ke_debuglevel = 0;
 int __ke_moduleflags = 0;
 
-static struct pci_device_id fglrx_pci_table[] = 
+static struct pci_device_id fglrx_pci_table[] =
 {
 #define FGL_ASIC_ID(x)                      \
    {                           \
@@ -278,7 +278,7 @@ const unsigned long __ke_PAE_State = 1;
 
 static int firegl_pat_enabled = 0;
 static unsigned long KCL_pat[2];
-static unsigned long KCL_orig_pat[2]; 
+static unsigned long KCL_orig_pat[2];
 
 static int ATI_API_CALL KCL_enable_pat(void);
 static void ATI_API_CALL KCL_disable_pat(void);
@@ -305,7 +305,7 @@ long ip_firegl_compat_ioctl(struct file* filp, unsigned int cmd, unsigned long a
 #endif
 
 __ke_ssize_t ip_firegl_read( struct file *filp,
-                         char *buf, 
+                         char *buf,
                          __ke_size_t size,
                          __ke_loff_t *off_ptr)
 {
@@ -313,7 +313,7 @@ __ke_ssize_t ip_firegl_read( struct file *filp,
 }
 
 __ke_ssize_t ip_firegl_write( struct file *filp,
-                          const char *buf, 
+                          const char *buf,
                           __ke_size_t size,
                           __ke_loff_t *off_ptr)
 {
@@ -449,34 +449,34 @@ READ_PROC_WRAP(firegl_debug_info)
 READ_PROC_WRAP(firegl_bios_version)
 READ_PROC_WRAP(firegl_interrupt_info)
 
-static int 
+static int
 firegl_interrupt_open_wrap(
-        struct inode *inode, 
-        struct file *file) 
+        struct inode *inode,
+        struct file *file)
 {
     return firegl_interrupt_open(inode, file);
 }
 
-static int 
+static int
 firegl_interrupt_release_wrap(
-        struct inode *inode, 
-        struct file *file) 
+        struct inode *inode,
+        struct file *file)
 {
     return firegl_interrupt_release(inode, file);
 }
 
-static ssize_t 
+static ssize_t
 firegl_interrupt_read_wrap(
-        struct file *user_file, 
-        char __user *user_buf, 
-        size_t user_buf_size, 
+        struct file *user_file,
+        char __user *user_buf,
+        size_t user_buf_size,
         loff_t *user_file_pos)
 {
     return (ssize_t) firegl_interrupt_read(user_file, user_buf, user_buf_size, user_file_pos);
 }
 
-static unsigned int 
-firegl_interrupt_poll_wrap(struct file *user_file, poll_table *pt) 
+static unsigned int
+firegl_interrupt_poll_wrap(struct file *user_file, poll_table *pt)
 {
     if(firegl_interrupt_poll(user_file, (__ke_poll_table*)pt))
     {
@@ -488,11 +488,11 @@ firegl_interrupt_poll_wrap(struct file *user_file, poll_table *pt)
     }
 }
 
-static ssize_t 
+static ssize_t
 firegl_interrupt_write_wrap(
-        struct file *user_file, 
-        const char __user *user_buf, 
-        size_t user_buf_size, 
+        struct file *user_file,
+        const char __user *user_buf,
+        size_t user_buf_size,
         loff_t *user_file_pos)
 {
     return (ssize_t) firegl_interrupt_write(user_file, user_buf, user_buf_size, user_file_pos);
@@ -502,7 +502,7 @@ firegl_interrupt_write_wrap(
  *  \param func function to be wrapped
  *  \return None */
 
-static void 
+static void
 firegl_smp_func_parameter_wrap(
 void *func)
 {
@@ -517,7 +517,7 @@ static struct file_operations firegl_interrupt_file_ops = {
     .write      = firegl_interrupt_write_wrap
 };
 
-__ke_proc_list_t firegl_proc_list[] = 
+__ke_proc_list_t firegl_proc_list[] =
 {
     { "name",           drm_name_info_wrap,         NULL},
     { "mem",            drm_mem_info_wrap,          NULL},
@@ -586,11 +586,11 @@ static struct proc_dir_entry *firegl_proc_init( device_t *dev,
         {
 		    ent->proc_fops = (struct file_operations*)list->fops;
         }
-       
+
         {
             ent->data = (dev->pubdev.signature == FGL_DEVICE_SIGNATURE)? firegl_find_device(minor) : (dev);
         }
-        
+
         list++;
 	}
 
@@ -623,7 +623,7 @@ static int firegl_proc_cleanup( int minor,
     {
         remove_proc_entry("dri", NULL);
         __KE_DEBUG("remove proc dri. \n");
-    }    
+    }
     return 0;
 }
 
@@ -661,12 +661,12 @@ static int firegl_stub_getminor(const char *name, struct file_operations *fops,
 {
 	int i;
         int count = 0;
-        
+
         __KE_DEBUG("firegl_stub_getminor: name=\"%s\"\n", name);
 
-	for( i = 0; i < FIREGL_STUB_MAXCARDS; i++ ) 
+	for( i = 0; i < FIREGL_STUB_MAXCARDS; i++ )
         {
-	    if( !firegl_stub_list[i].fops ) 
+	    if( !firegl_stub_list[i].fops )
             {
 		firegl_stub_list[i].name = name;
 		firegl_stub_list[i].fops = fops;
@@ -693,16 +693,16 @@ static int firegl_stub_putminor(int minor)
     if (minor < 0 || minor >= FIREGL_STUB_MAXCARDS)
     {
         return -1;
-    }    
+    }
     firegl_proc_cleanup(minor, firegl_stub_root, firegl_stub_list[minor].dev_root, firegl_stub_list[minor].proclist);
     firegl_stub_list[minor].name = NULL;
     firegl_stub_list[minor].fops = NULL;
     firegl_stub_list[minor].proclist = NULL;
 
-    if( minor == (firegl_minors-1) ) 
+    if( minor == (firegl_minors-1) )
     {
         unregister_chrdev(DRM_MAJOR, "drm");
-    }   
+    }
     return 0;
 }
 
@@ -726,7 +726,7 @@ static int __init firegl_stub_register(const char *name, struct file_operations
         return -1;
     } else if(err == -EBUSY) {
 
-        // the registering of the module's device has failed 
+        // the registering of the module's device has failed
         // because there was already some other drm module loaded.
         __KE_DEBUG("register_chrdev() failed with -EBUSY\n");
 	return -1;
@@ -758,7 +758,7 @@ static int fglrx_pci_probe(struct pci_dev *dev, const struct pci_device_id *id_t
 /* Starting from 2.6.14, kernel has new struct defined for pm_message_t,
    we have to handle this case separately.
    2.6.11/12/13 kernels have pm_message_t defined as int and older kernels
-   don't have pm_message_t defined. 
+   don't have pm_message_t defined.
  */
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,14)
 static int fglrx_pci_suspend(struct pci_dev *pdev, pm_message_t pm_event)
@@ -794,9 +794,9 @@ static int fglrx_pci_suspend(struct pci_dev *pdev, u32 pm_event)
 
     if (!ret)
     {
-        
-    // since privdev->pcidev is acquired in X server, use pdev 
-    // directly here to allow suspend/resume without X server start. 
+
+    // since privdev->pcidev is acquired in X server, use pdev
+    // directly here to allow suspend/resume without X server start.
         firegl_pci_save_state((__ke_pci_dev_t*)pdev, privdev);
         pci_disable_device(pdev);
         PMSG_EVENT(pdev->dev.power.power_state) = state;
@@ -848,13 +848,13 @@ static int fglrx_pci_resume(struct pci_dev *pdev)
     // before pci_set_master!
     firegl_pci_restore_state((__ke_pci_dev_t*)pdev, privdev);
 
-    if (pci_enable_device(pdev)) 
+    if (pci_enable_device(pdev))
     {
         __KE_ERROR("Cannot enable PCI device.\n");
-    }    
+    }
 
     pci_set_master(pdev);
- 
+
     firegl_cail_powerup(privdev);
 
     if (PMSG_EVENT(pdev->dev.power.power_state) == PM_EVENT_SUSPEND)
@@ -865,7 +865,7 @@ static int fglrx_pci_resume(struct pci_dev *pdev)
     return 0;
 }
 
-static struct pci_driver fglrx_pci_driver = 
+static struct pci_driver fglrx_pci_driver =
 {
     .name           = "fglrx_pci",
     .id_table       = fglrx_pci_table,
@@ -921,10 +921,10 @@ static int firegl_init_devices(__ke_device_t *pubdev)
     {
         pid = (struct pci_device_id *) &fglrx_pci_table[i];
         pdev = NULL;
-        while (( pdev = pci_get_subsys(pid->vendor, 
-                                       pid->device, 
-                                       PCI_ANY_ID, 
-                                       PCI_ANY_ID, 
+        while (( pdev = pci_get_subsys(pid->vendor,
+                                       pid->device,
+                                       PCI_ANY_ID,
+                                       PCI_ANY_ID,
                                        pdev)) != NULL)
         {
             num_of_devices++;
@@ -934,7 +934,7 @@ static int firegl_init_devices(__ke_device_t *pubdev)
 
     if (firegl_init_device_heads(num_of_devices))
     {
-        return -ENOMEM;     
+        return -ENOMEM;
     }
 
     for (i=0; fglrx_pci_table[i].vendor != 0; i++)
@@ -942,15 +942,15 @@ static int firegl_init_devices(__ke_device_t *pubdev)
         pid = (struct pci_device_id *) &fglrx_pci_table[i];
 
         pdev = NULL;
-        while (( pdev = pci_get_subsys(pid->vendor, 
-                                       pid->device, 
-                                       PCI_ANY_ID, 
-                                       PCI_ANY_ID, 
+        while (( pdev = pci_get_subsys(pid->vendor,
+                                       pid->device,
+                                       PCI_ANY_ID,
+                                       PCI_ANY_ID,
                                        pdev)) != NULL)
         {
             if ((ret_code = firegl_get_dev(pubdev, pdev)))
             {
-                return ret_code; 
+                return ret_code;
             }
 
             j++;
@@ -983,7 +983,7 @@ static int __init firegl_init_module(void)
     // init global vars that are in fact constants
     __ke_HZ = HZ;
 
-#ifdef _KE_SERIAL_DEBUG  
+#ifdef _KE_SERIAL_DEBUG
     __ke_SetSerialPort();
 #endif
 
@@ -995,11 +995,11 @@ static int __init firegl_init_module(void)
         return retcode;
     }
 
-#ifdef FIREGL_CF_SUPPORT    
+#ifdef FIREGL_CF_SUPPORT
     adapter_chain_init();
     cf_object_init();
-#endif    
-     
+#endif
+
     // init DRM proc list
     drm_proclist = kmalloc((DRM_PROC_ENTRIES + 1) * sizeof(__ke_proc_list_t), GFP_KERNEL);
     if ( drm_proclist == NULL )
@@ -1087,7 +1087,7 @@ static int __init firegl_init_module(void)
 	        dev->pubdev.date,
 		    firegl_minors);
 
-    
+
 #ifdef FIREGL_POWER_MANAGEMENT
     if (pci_register_driver (&fglrx_pci_driver) < 0)
     {
@@ -1117,12 +1117,12 @@ static void __exit firegl_cleanup_module(void)
     {
        KCL_disable_pat();
        __KE_INFO("Disable PAT\n");
-    }   
+    }
 #endif // FIREGL_USWC_SUPPORT
 
     for (i = 0; i < count; i++)
     {
-        if ( firegl_stub_unregister(i) ) 
+        if ( firegl_stub_unregister(i) )
         {
             __KE_ERROR("Cannot unload module on minor: %d\n", i);
         }
@@ -1144,10 +1144,10 @@ static void __exit firegl_cleanup_module(void)
 	        dev->pubdev.patchlevel,
 	        dev->pubdev.date);
 
-#ifdef FIREGL_CF_SUPPORT    
+#ifdef FIREGL_CF_SUPPORT
     cf_object_cleanup();
-    adapter_chain_cleanup();    
-#endif // FIREGL_CF_SUPPORT   
+    adapter_chain_cleanup();
+#endif // FIREGL_CF_SUPPORT
 
     firegl_private_cleanup (&dev->pubdev);
 
@@ -1225,18 +1225,18 @@ void ATI_API_CALL __ke_add_wait_queue(__ke_wait_queue_head_t* queue_head, __ke_w
 void ATI_API_CALL __ke_remove_wait_queue(__ke_wait_queue_head_t* queue_head, __ke_wait_queue_t* entry)
 {
 //    current->state = TASK_RUNNING;
-    remove_wait_queue((wait_queue_head_t*)(void *)queue_head, 
+    remove_wait_queue((wait_queue_head_t*)(void *)queue_head,
 									(wait_queue_t*)(void *)entry);
 }
 
 void ATI_API_CALL __ke_init_waitqueue_head(__ke_wait_queue_head_t* queue_head)
 {
-    init_waitqueue_head((wait_queue_head_t*)(void *)queue_head); 
+    init_waitqueue_head((wait_queue_head_t*)(void *)queue_head);
 }
 
 void ATI_API_CALL __ke_wait_event_interruptible(__ke_wait_queue_head_t* queue_head, int condition)
 {
-    wait_event_interruptible(*((wait_queue_head_t*)(void *)queue_head), condition); 
+    wait_event_interruptible(*((wait_queue_head_t*)(void *)queue_head), condition);
 }
 
 void ATI_API_CALL __ke_poll_wait(struct file* filp, __ke_wait_queue_head_t* queue_head, __ke_poll_table* pt)
@@ -1247,13 +1247,13 @@ void ATI_API_CALL __ke_poll_wait(struct file* filp, __ke_wait_queue_head_t* queu
 void ATI_API_CALL *__ke_asyncio_alloc_sema()
 {
     int i;
-    
+
     for(i=0; i<FIREGL_ASYNCIO_MAX_SEMA; i++)
     {
         if(fireglAsyncioSemaphoreUsed[i] != 1)
         {
             fireglAsyncioSemaphoreUsed[i] = 1;
-            
+
             return &(fireglAsyncioSemaphore[i]);
         }
     }
@@ -1263,7 +1263,7 @@ void ATI_API_CALL *__ke_asyncio_alloc_sema()
 void ATI_API_CALL __ke_asyncio_free_sema(struct semaphore *pSema)
 {
     int i;
-    
+
     for(i=0; i<FIREGL_ASYNCIO_MAX_SEMA; i++)
     {
         if( &(fireglAsyncioSemaphore[i]) == pSema )
@@ -1277,15 +1277,15 @@ void ATI_API_CALL __ke_asyncio_free_sema(struct semaphore *pSema)
 void ATI_API_CALL __ke_asyncio_init_sema(void)
 {
     int i;
-    
+
     for(i=0; i<FIREGL_ASYNCIO_MAX_SEMA; i++)
     {
         fireglAsyncioSemaphoreUsed[i] = 0;
     }
-}    
+}
 
-int ATI_API_CALL __ke_fasync_helper( int fd, 
-                        struct file *filep, 
+int ATI_API_CALL __ke_fasync_helper( int fd,
+                        struct file *filep,
                         int mode,
                         struct fasync_struct **pasync_queue)
 {
@@ -1352,33 +1352,33 @@ unsigned int ATI_API_CALL KCL_ProcessIsTerminated(unsigned int pid)
 {
    struct task_struct *p;
    int process_terminated = 1;
-  
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
+
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
    rcu_read_lock();
-#else   
+#else
    read_lock(&tasklist_lock);
-#endif   
-   p = find_task_by_pid( pid );
-   if (p) 
+#endif
+   p = find_task_by_vpid( pid );
+   if (p)
    {
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,10)
-      if (p->exit_state != EXIT_ZOMBIE && p->exit_state != EXIT_DEAD) 
+      if (p->exit_state != EXIT_ZOMBIE && p->exit_state != EXIT_DEAD)
 #else
-      if (!(p->flags & PF_EXITING)) 
+      if (!(p->flags & PF_EXITING))
 #endif
       {
          process_terminated = 0;
       }
-   }   
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
+   }
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
    rcu_read_unlock();
-#else   
+#else
    read_unlock(&tasklist_lock);
-#endif   
+#endif
    return process_terminated;
 }
 
-/** /brief Call global OS kernel task/thread scheduler 
+/** /brief Call global OS kernel task/thread scheduler
  *  /return Nonzero if a system call was awakened by a signal
  */
 int ATI_API_CALL KCL_GetSignalStatus(void)
@@ -1432,15 +1432,15 @@ void ATI_API_CALL __ke_unblock_all_signals(void)
     unblock_all_signals();
 }
 
-#if defined(__i386__) 
+#if defined(__i386__)
 #ifndef __HAVE_ARCH_CMPXCHG
-static inline 
-unsigned long __fgl_cmpxchg(volatile void *ptr, unsigned long old,            
-                        unsigned long new, int size)                      
-{                                                                                       
-    unsigned long prev;                                                             
-    switch (size) {                                                                 
-    case 1:                                                                         
+static inline
+unsigned long __fgl_cmpxchg(volatile void *ptr, unsigned long old,
+                        unsigned long new, int size)
+{
+    unsigned long prev;
+    switch (size) {
+    case 1:
         __asm__ __volatile__(LOCK_PREFIX "cmpxchgb %b1,%2"
                              : "=a"(prev)
                              : "q"(new), "m"(*__xg(ptr)), "0"(old)
@@ -1551,7 +1551,7 @@ struct inode* ATI_API_CALL __ke_get_file_inode(struct file* filp)
  */
 KCL_TYPE_Pid ATI_API_CALL KCL_GetPid(void)
 {
-    return current->pid; 
+    return current->pid;
 }
 
 /** /brief Return the current Thread Group ID
@@ -1559,7 +1559,7 @@ KCL_TYPE_Pid ATI_API_CALL KCL_GetPid(void)
  */
 KCL_TYPE_Pid ATI_API_CALL KCL_GetTgid(void)
 {
-    return current->tgid; 
+    return current->tgid;
 }
 
 /** /brief Return the effective user ID
@@ -1655,7 +1655,7 @@ static int KCL_MAP_KernelConfigParam[] =
     1
 #else
     0
-#endif 
+#endif
 };
 
 /** /brief Check whether a kernel configuration parameter is defined
@@ -1718,13 +1718,13 @@ unsigned long ATI_API_CALL __ke_get_resource_start(__ke_pci_dev_t *dev, unsigned
 #if defined(__x86_64__) || defined(__ia64__)
 void* ATI_API_CALL __ke_pci_alloc_consistent(__ke_pci_dev_t* dev, int size, void *dma_handle)
 {
-	return (pci_alloc_consistent( (struct pci_dev*)(void *)dev, size, dma_handle)); 
+	return (pci_alloc_consistent( (struct pci_dev*)(void *)dev, size, dma_handle));
 }
 
 void ATI_API_CALL __ke_pci_free_consistent(__ke_pci_dev_t* dev, int size, unsigned long cpu_addr,
 						 unsigned int dma_handle)
 {
-	pci_free_consistent( (struct pci_dev*)(void *)dev, size, (void *)cpu_addr, 
+	pci_free_consistent( (struct pci_dev*)(void *)dev, size, (void *)cpu_addr,
 		(unsigned long)dma_handle);
 }
 #endif // __ia64__
@@ -1748,7 +1748,7 @@ static int KCL_MAP_ErrorCode[] =
 
 /** \brief This function maps OS independent error conditions to OS defined error codes
  *  \param errcode OS independent error condition code
- *  \return OS kernel defined error code corresponding to the requested error condition 
+ *  \return OS kernel defined error code corresponding to the requested error condition
  */
 int ATI_API_CALL KCL_GetErrorCode(KCL_ENUM_ErrorCode errcode)
 {
@@ -1766,7 +1766,7 @@ int ATI_API_CALL KCL_GetErrorCode(KCL_ENUM_ErrorCode errcode)
 int ATI_API_CALL firegl_get_user_ptr(u32 *src, void **dst)
 {
   unsigned long temp;
-  int err = get_user(temp, src); 
+  int err = get_user(temp, src);
   *dst = (void*) temp;
   return err;
 }
@@ -1906,7 +1906,7 @@ void ATI_API_CALL __ke_atomic_set(void* v, int val)
 
 int ATI_API_CALL __ke_atomic_dec_and_test(void* v)
 {
-    return atomic_dec_and_test((atomic_t*)v); 
+    return atomic_dec_and_test((atomic_t*)v);
 }
 
 /*****************************************************************************/
@@ -2006,19 +2006,19 @@ void ATI_API_CALL __ke_print_debug(const char* fmt, ...)
 #endif
 
 #ifdef _KE_SERIAL_DEBUG
-// To enable serial port debug message dumping,just define _KE_SERIAL_DEBUG in firegl_public.h file. 
-// Connect two PC with a null modern serial cable. run Hyper ternimal on the remote machine. 
-// It's useful to debug resume if network not works properly and serial port is not recovered 
+// To enable serial port debug message dumping,just define _KE_SERIAL_DEBUG in firegl_public.h file.
+// Connect two PC with a null modern serial cable. run Hyper ternimal on the remote machine.
+// It's useful to debug resume if network not works properly and serial port is not recovered
 // properly when fglrx resume hook is called...
- 
- 
+
+
 #define SER_DATA_PORT       0x3f8
 #define SER_INT_CTRL_PORT   SER_DATA_PORT + 1
 #define SER_INT_STAT_PORT   SER_DATA_PORT + 2
 #define SER_LINE_CTRL_PORT  SER_DATA_PORT + 3
 #define SER_MODEM_CTRL_PORT SER_DATA_PORT + 4
 #define SER_LINE_STAT_PORT  SER_DATA_PORT + 5
-    
+
 void ATI_API_CALL __ke_printc(char c)
 {
      while((inb(SER_LINE_STAT_PORT) & 0x20) == 0 ); //wait until Transmitter Holding Register Empty
@@ -2028,7 +2028,7 @@ void ATI_API_CALL __ke_printc(char c)
 void ATI_API_CALL __ke_printstr(const char *str)
 {
     int len = strlen(str);
-    while(len--)__ke_printc(*str++);  
+    while(len--)__ke_printc(*str++);
 }
 
 int ATI_API_CALL __ke_SerPrint(const char *format, ...)
@@ -2041,26 +2041,26 @@ int ATI_API_CALL __ke_SerPrint(const char *format, ...)
     vsprintf(buffer, format, ap);
 
     va_end(ap);
-    
+
     __ke_printstr(buffer);
-    
+
     return 0;
 }
 void ATI_API_CALL __ke_SetSerialPort()
 {
     DRM_INFO("setup serial port\n");
-    outb(0x00,  SER_INT_CTRL_PORT);   // Turn off interrupts 
-
-    outb(0x80,  SER_LINE_CTRL_PORT);  // SET DLAB ON 
-    outb(0x01,  SER_DATA_PORT);  // Set Baud rate - Divisor Latch Low Byte 
-                             // 0x01 = 115,200 ,0x02 =  57,600,  0x06 =  19,200 BPS, 0x0C =   9,600 BPS  
-    outb(0x00,  SER_DATA_PORT + 1);  // Set Baud rate - Divisor Latch High Byte 
-    outb(0x03,  SER_LINE_CTRL_PORT); // reset DLAB ,8 Bits, No Parity, 1 Stop Bit 
-    outb(0xC7,  SER_DATA_PORT + 2);  // FIFO Control Register 
+    outb(0x00,  SER_INT_CTRL_PORT);   // Turn off interrupts
+
+    outb(0x80,  SER_LINE_CTRL_PORT);  // SET DLAB ON
+    outb(0x01,  SER_DATA_PORT);  // Set Baud rate - Divisor Latch Low Byte
+                             // 0x01 = 115,200 ,0x02 =  57,600,  0x06 =  19,200 BPS, 0x0C =   9,600 BPS
+    outb(0x00,  SER_DATA_PORT + 1);  // Set Baud rate - Divisor Latch High Byte
+    outb(0x03,  SER_LINE_CTRL_PORT); // reset DLAB ,8 Bits, No Parity, 1 Stop Bit
+    outb(0xC7,  SER_DATA_PORT + 2);  // FIFO Control Register
     outb(0x0b,  SER_DATA_PORT + 4);  // Turn on DTR, RTS, and OUT2
-  
+
     __ke_printstr("serial port 0x3f8 is set ready for message print out \n");
-}  
+}
 #endif
 
 /** \brief Get number of available RAM pages
@@ -2241,7 +2241,7 @@ void *ATI_API_CALL __ke_vmalloc_to_addr(void *vmalloc_addr)
     struct page *page = NULL;
 
     page = vmalloc_to_page(vmalloc_addr);
-    if(page == NULL) 
+    if(page == NULL)
     {
         __KE_ERROR("__ke_vmalloc_to_addr: invalid page!");
         return NULL;
@@ -2283,7 +2283,7 @@ int ATI_API_CALL __ke_do_munmap(unsigned long addr, unsigned long len)
     retcode = do_munmap(current->mm,
                         addr,
                         len);
-#endif                        
+#endif
     up_write(&current->mm->mmap_sem);
     return retcode;
 }
@@ -2327,10 +2327,10 @@ long long ATI_API_CALL __divdi3(long long n, long long base)
        minus = !minus;
     }
     else
-    {   
+    {
        ubase = base;
     }
-    
+
     do_div(un, ubase);
     return (minus? -un : un);
 }
@@ -2360,7 +2360,7 @@ long long ATI_API_CALL __moddi3(long long n, long long base)
     else
     {
        ubase = base;
-    }   
+    }
 
     rem = do_div(un, ubase);
     return (minus? -rem : rem);
@@ -2391,7 +2391,7 @@ void* ATI_API_CALL __ke_vmap(unsigned long *pagelist, unsigned int count)
     vaddr = (void *) vmap(pages, count);
 #else
 #ifdef VM_MAP
-    vaddr = (void *) vmap(pages, count, VM_MAP, PAGE_KERNEL); 
+    vaddr = (void *) vmap(pages, count, VM_MAP, PAGE_KERNEL);
 #else
     vaddr = (void *) vmap(pages, count, 0, PAGE_KERNEL);
 #endif
@@ -2447,7 +2447,7 @@ void ATI_API_CALL __ke_vunmap(void* addr)
 }
 #endif  // defined(VM_MAP) || defined(vunmap)
 
-/** \brief Reserve a memory page 
+/** \brief Reserve a memory page
  *
  * \param pt Kernel logical address of the page
  *
@@ -2459,7 +2459,7 @@ void ATI_API_CALL KCL_ReserveMemPage(void* pt)
     SetPageReserved(virt_to_page((unsigned long)pt));
 }
 
-/** \brief Unreserve a memory page 
+/** \brief Unreserve a memory page
  *
  * \param pt Kernel logical address of the page
  *
@@ -2471,7 +2471,7 @@ void ATI_API_CALL KCL_UnreserveMemPage(void* pt)
     ClearPageReserved(virt_to_page((unsigned long)pt));
 }
 
-/** \brief Lock a memory page 
+/** \brief Lock a memory page
  *
  * \param pt Kernel logical address of the page
  *
@@ -2480,14 +2480,14 @@ void ATI_API_CALL KCL_UnreserveMemPage(void* pt)
  */
 void ATI_API_CALL KCL_LockMemPage(void* pt)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15) 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15)
     SetPageReserved(virt_to_page((unsigned long)pt));
 #else
     lock_page(virt_to_page((unsigned long)pt));
 #endif
 }
 
-/** \brief Unlock a memory page 
+/** \brief Unlock a memory page
  *
  * \param pt Kernel logical address of the page
  *
@@ -2496,7 +2496,7 @@ void ATI_API_CALL KCL_LockMemPage(void* pt)
  */
 void ATI_API_CALL KCL_UnlockMemPage(void* pt)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15) 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15)
     ClearPageReserved(virt_to_page((unsigned long)pt));
 #else
     unlock_page(virt_to_page((unsigned long)pt));
@@ -2521,7 +2521,7 @@ void* ATI_API_CALL __ke_get_vmptr( struct _agp_memory* memory )
 	return memory->vmptr;
 }
 #endif
-                              
+
 void* ATI_API_CALL __ke_ioremap(unsigned long offset, unsigned long size)
 {
     return ioremap(offset, size);
@@ -2592,7 +2592,7 @@ void ATI_API_CALL KCL_flush_tlb_onepage(struct vm_area_struct * vma, unsigned lo
 {
 /*Some kernel developer removed the export of symbol "flush_tlb_page" on 2.6.25 x86_64 SMP kernel.
   Define a simple version here.*/
-#if defined(__x86_64__) && defined(__SMP__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25)) 
+#if defined(__x86_64__) && defined(__SMP__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25))
     on_each_cpu(KCL_flush_tlb_one, &va, 1, 1);
 #else
     flush_tlb_page(vma, va);
@@ -2649,9 +2649,9 @@ void ATI_API_CALL __ke_put_vm_page_table(unsigned long page_addr)
 static inline int ptep_clear_flush_dirty(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
 {
     int ret = 0;
-    
+
     DBG_ENTER("0x%08X, 0x%08X, 0x%08X->0x%08X", vma, addr, ptep, *ptep);
-    
+
     if (pte_dirty(*ptep))
     {
 #ifdef __x86_64__
@@ -2666,19 +2666,19 @@ static inline int ptep_clear_flush_dirty(struct vm_area_struct *vma, unsigned lo
         {
             pte_update(vma->vm_mm, addr, ptep);
         }
-#endif        
+#endif
     }
 
     DBG_TRACE("0x%08X->0x%08X", ptep, *ptep);
-    
+
     // Flush Translation Lookaside Buffers
     if (ret)
     {
         KCL_flush_tlb_onepage(vma,addr);
     }
-    
+
     DBG_LEAVE("%d", ret);
-    
+
     return ret;
 }
 #endif
@@ -2705,7 +2705,7 @@ static inline int ptep_clear_flush_dirty(struct vm_area_struct *vma, unsigned lo
  * the virtual address
  *
  * \param mm Pointer to the memory descriptor structure
- * \param virtual_addr Virtual address 
+ * \param virtual_addr Virtual address
  *
  * \return Old value of the "dirty" flag on success or negative on error
  *
@@ -2961,7 +2961,7 @@ int ATI_API_CALL __ke_config_mtrr(void)
        return 0;
 #else
     return 1;
-#endif    
+#endif
 #else /* !CONFIG_MTRR */
     return 0;
 #endif /* !CONFIG_MTRR */
@@ -2987,7 +2987,7 @@ int ATI_API_CALL __ke_mtrr_del(int reg, unsigned long base, unsigned long size)
 
 int ATI_API_CALL __ke_has_vmap(void)
 {
-// We disable vmap for 2.4.x kernel to work around the big memory( > 4GB ) issue. 
+// We disable vmap for 2.4.x kernel to work around the big memory( > 4GB ) issue.
 #if defined(VM_MAP) || defined(vunmap)
     return 1;
 #else
@@ -3009,7 +3009,7 @@ int ATI_API_CALL __ke_no_iommu(void)
 {
     return 0;
 }
-#endif 
+#endif
 
 /*****************************************************************************/
 
@@ -3066,7 +3066,7 @@ unsigned int ATI_API_CALL __ke_pci_get_func(__ke_pci_dev_t* pcidev)
 {
     struct pci_dev* dev = (struct pci_dev*)pcidev;
     return PCI_FUNC(dev->devfn);
-}    
+}
 
 __ke_dma_addr_t ATI_API_CALL __ke_pci_map_single (__ke_pci_dev_t *pdev, void *buffer, __ke_size_t size, int direction)
 {
@@ -3153,7 +3153,7 @@ static irqreturn_t ke_irq_handler_wrap(int irq, void *arg1)
     return IRQ_HANDLED;
 }
 #endif
-            
+
 int ATI_API_CALL __ke_request_irq(unsigned int irq,
     void (*ATI_API_CALL handler)(int, void *, void *),
     const char *dev_name, void *dev_id)
@@ -3166,7 +3166,7 @@ int ATI_API_CALL __ke_request_irq(unsigned int irq,
         SA_SHIRQ,
 #else
         IRQF_SHARED,
-#endif                
+#endif
         dev_name,
         dev_id);
 }
@@ -3203,12 +3203,12 @@ int ATI_API_CALL __ke_agp_memory_get_page_count(struct _agp_memory* agpmem)
     return (int)(agpmem->page_count);
 }
 
-void ATI_API_CALL __ke_agp_memory_get_memory(struct _agp_memory* agpmem, 
+void ATI_API_CALL __ke_agp_memory_get_memory(struct _agp_memory* agpmem,
                                              unsigned long **memory_ptr)
 {
     __KE_DEBUG("[%s] agpmem=0x%016lx agpmem->memory=0x%016lx [0]=0x%016x",
-               __FUNCTION__, 
-               (unsigned long)agpmem, 
+               __FUNCTION__,
+               (unsigned long)agpmem,
                (unsigned long)agpmem->memory,
                (agpmem->memory)[0]);
 
@@ -3217,18 +3217,9 @@ void ATI_API_CALL __ke_agp_memory_get_memory(struct _agp_memory* agpmem,
 
 /*****************************************************************************/
 
-#ifndef NOPAGE_SIGBUS
-#define NOPAGE_SIGBUS 0
-#endif /* !NOPAGE_SIGBUS */
-
 typedef struct page mem_map_t;
 typedef mem_map_t *vm_nopage_ret_t;
 
-static __inline__ vm_nopage_ret_t do_vm_nopage(struct vm_area_struct* vma,
-                                                     unsigned long address)
-{
-    return 0;   /* Disallow mremap */
-}
 
 #ifdef __AGP__BUILTIN__
 #ifdef __ia64__
@@ -3253,19 +3244,20 @@ static __inline__ vm_nopage_ret_t do_vm_cant_nopage(struct vm_area_struct* vma,
 			return page;
 		}
 	}
-	return NOPAGE_SIGBUS;		/* Disallow mremap */
+	return VM_FAULT_SIGBUS;		/* Disallow mremap */
 }
 
 #endif /* __ia64__ */
 #endif /* __AGP__BUILTIN__ */
 
 
-static __inline__ vm_nopage_ret_t do_vm_shm_nopage(struct vm_area_struct* vma,
-                                                   unsigned long address)
+static __inline__ int do_vm_shm_nopage(struct vm_area_struct* vma,
+				       struct vm_fault *vmf)
 {
     pgd_t* pgd_p;
     pmd_t* pmd_p;
     pte_t  pte;
+    unsigned long address = (unsigned long)vmf->virtual_address;
     unsigned long vma_offset;
     unsigned long pte_linear;
     mem_map_t* pMmPage;
@@ -3294,7 +3286,7 @@ static __inline__ vm_nopage_ret_t do_vm_shm_nopage(struct vm_area_struct* vma,
             (unsigned long)__ke_vm_offset(vma));
 
     if (address > vma->vm_end)
-        return NOPAGE_SIGBUS; /* address is out of range */
+        return VM_FAULT_SIGBUS; /* address is out of range */
 
     /*  Calculate offset into VMA */
     vma_offset = address - vma->vm_start;
@@ -3306,7 +3298,7 @@ static __inline__ vm_nopage_ret_t do_vm_shm_nopage(struct vm_area_struct* vma,
     pte_linear = firegl_get_addr_from_vm(vma);
     if (!pte_linear)
     {
-        return NOPAGE_SIGBUS; /* bad address */
+        return VM_FAULT_SIGBUS; /* bad address */
     }
     pte_linear += vma_offset;
 
@@ -3334,7 +3326,9 @@ static __inline__ vm_nopage_ret_t do_vm_shm_nopage(struct vm_area_struct* vma,
 
     //  __KE_DEBUG3("vm-address 0x%08lx => kernel-page-address 0x%p\n",
     //    address, page_address(pMmPage));
-    return pMmPage;
+    vmf->page = pMmPage;
+
+    return 0;
 }
 
 /*
@@ -3343,8 +3337,10 @@ static __inline__ vm_nopage_ret_t do_vm_shm_nopage(struct vm_area_struct* vma,
       (which is one ore more pages in size)
 
 */
-static __inline__ vm_nopage_ret_t do_vm_dma_nopage(struct vm_area_struct* vma, unsigned long address)
+static __inline__ int do_vm_dma_nopage(struct vm_area_struct* vma,
+				       struct vm_fault *vmf)
 {
+    unsigned long address = (unsigned long) vmf->virtual_address;
     unsigned long kaddr;
     mem_map_t* pMmPage;
 
@@ -3360,7 +3356,7 @@ static __inline__ vm_nopage_ret_t do_vm_dma_nopage(struct vm_area_struct* vma, u
     kaddr = firegl_get_addr_from_vm(vma);
     if (!kaddr)
     {
-        return NOPAGE_SIGBUS; /* bad address */
+        return VM_FAULT_SIGBUS; /* bad address */
     }
     kaddr += (address - vma->vm_start);
 
@@ -3372,19 +3368,23 @@ static __inline__ vm_nopage_ret_t do_vm_dma_nopage(struct vm_area_struct* vma, u
     // with drm_alloc_pages, which marks all pages as reserved. Reserved
     // pages' usage count is not decremented by the kernel during unmap!!!
     //
-    // For kernel >= 2.6.15, We should reenable this, because the VM sub-system 
-    // will decrement the pages' usage count even for the pages marked as reserved 
+    // For kernel >= 2.6.15, We should reenable this, because the VM sub-system
+    // will decrement the pages' usage count even for the pages marked as reserved
     // 								- MC.
     get_page(pMmPage); /* inc usage count of page */
 #endif
 
     __KE_DEBUG3("vm-address 0x%08lx => kernel-page-address 0x%p\n",
         address, page_address(pMmPage));
-    return pMmPage;
+    vmf->page = pMmPage;
+
+    return 0;
 }
 
-static __inline__ vm_nopage_ret_t do_vm_kmap_nopage(struct vm_area_struct* vma, unsigned long address)
+static __inline__ int do_vm_kmap_nopage(struct vm_area_struct* vma,
+					struct vm_fault *vmf)
 {
+    unsigned long address = (unsigned long) vmf->virtual_address;
     unsigned long kaddr;
     mem_map_t* pMmPage;
 
@@ -3394,13 +3394,14 @@ static __inline__ vm_nopage_ret_t do_vm_kmap_nopage(struct vm_area_struct* vma,
     if ((pMmPage = (mem_map_t*) firegl_get_pagetable_page_from_vm(vma)))
     {
         get_page(pMmPage);
-        return pMmPage;
+	vmf->page = pMmPage;
+        return 0;
     }
 
     kaddr = firegl_get_addr_from_vm(vma);
     if (!kaddr)
     {
-        return NOPAGE_SIGBUS; /* bad address */
+        return VM_FAULT_SIGBUS; /* bad address */
     }
     kaddr += (address - vma->vm_start);
 
@@ -3413,50 +3414,52 @@ static __inline__ vm_nopage_ret_t do_vm_kmap_nopage(struct vm_area_struct* vma,
 
     __KE_DEBUG3("vm-address 0x%08lx => kernel-page-address 0x%p\n", address, page_address(pMmPage));
 
-    return pMmPage;
+    vmf->page = pMmPage;
+    return 0;
 }
 
-/** 
+/**
  **
- **  This routine is intented to locate the page table through the 
+ **  This routine is intented to locate the page table through the
  **  pagelist table created earlier in dev-> pcie
  **/
-static __inline__ vm_nopage_ret_t do_vm_pcie_nopage(struct vm_area_struct* vma,
-                                                         unsigned long address)
+static __inline__ int do_vm_pcie_nopage(struct vm_area_struct* vma,
+					struct vm_fault *vmf)
 {
 
+    unsigned long address = (unsigned long)vmf->virtual_address;
     unsigned long vma_offset;
-    unsigned long i; 
+    unsigned long i;
     mem_map_t* pMmPage;
     struct firegl_pcie_mem* pciemem;
     unsigned long* pagelist;
-    
+
     drm_device_t *dev = (drm_device_t *)firegl_get_dev_from_vm(vma);
     if (dev == NULL)
     {
         __KE_ERROR("dev is NULL\n");
-        return NOPAGE_SIGBUS;
+        return VM_FAULT_SIGBUS;
     }
 
     if (address > vma->vm_end)
     {
         __KE_ERROR("address out of range\n");
-        return NOPAGE_SIGBUS; /* address is out of range */
+        return VM_FAULT_SIGBUS; /* address is out of range */
     }
     pciemem = firegl_get_pciemem_from_addr ( vma, address);
     if (pciemem == NULL)
     {
         __KE_ERROR("No pciemem found! \n");
-        return NOPAGE_SIGBUS;
-    }    
+        return VM_FAULT_SIGBUS;
+    }
     pagelist = firegl_get_pagelist_from_vm(vma);
 
-    if (pagelist == NULL) 
+    if (pagelist == NULL)
     {
         __KE_ERROR("No pagelist! \n");
-        return NOPAGE_SIGBUS;
+        return VM_FAULT_SIGBUS;
     }
-     
+
     /** Find offset in  vma */
     vma_offset = address - vma->vm_start;
     /** Which entry in the pagelist */
@@ -3468,15 +3471,17 @@ static __inline__ vm_nopage_ret_t do_vm_pcie_nopage(struct vm_area_struct* vma,
     if (page_address(pMmPage) == 0x0)
     {
         __KE_ERROR("Invalid page address\n");
-        return NOPAGE_SIGBUS;
+        return VM_FAULT_SIGBUS;
     }
-    return pMmPage;
+
+    vmf->page = pMmPage;
+    return 0;
 }
 
-static __inline__ vm_nopage_ret_t do_vm_gart_nopage(struct vm_area_struct* vma,
-                                                    unsigned long address)
+static __inline__ int do_vm_gart_nopage(struct vm_area_struct* vma,
+					struct vm_fault *vmf)
 {
-
+    unsigned long address = (unsigned long) vmf->virtual_address;
     unsigned long page_addr;
     unsigned long offset;
     struct page *page;
@@ -3484,36 +3489,31 @@ static __inline__ vm_nopage_ret_t do_vm_gart_nopage(struct vm_area_struct* vma,
     if (address > vma->vm_end)
     {
         __KE_ERROR("Invalid virtual address\n");
-        return NOPAGE_SIGBUS;   /* Disallow mremap */
-    }          
+        return VM_FAULT_SIGBUS;   /* Disallow mremap */
+    }
 
     offset      = address - vma->vm_start;
-#ifdef FIREGL_CF_SUPPORT    
+#ifdef FIREGL_CF_SUPPORT
     page_addr   = mc_heap_get_page_addr(vma, offset);
 #else
     page_addr   = firegl_cmmqs_get_pageaddr_from_vm(vma, offset);
-#endif    
+#endif
     if( !page_addr)
     {
         __KE_ERROR("Invalid page address\n");
-        return NOPAGE_SIGBUS;   /* Disallow mremap */
+        return VM_FAULT_SIGBUS;   /* Disallow mremap */
     }
     page        = virt_to_page(page_addr);
     get_page(page);
 
-    return page;
+    vmf->page = page;
+    return 0;
 }
 
-
-
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,0)
-
-static vm_nopage_ret_t vm_nopage(struct vm_area_struct* vma,
-                                 unsigned long address,
-                                 int *type)
+static int vm_nopage(struct vm_area_struct* vma,
+		     struct vm_fault *vmf)
 {
-    if (type) *type = VM_FAULT_MINOR;
-        return do_vm_nopage(vma, address);
+	return VM_FAULT_SIGBUS;
 }
 
 #ifdef __AGP__BUILTIN__
@@ -3545,91 +3545,10 @@ static vm_nopage_ret_t vm_cant_nopage(struct vm_area_struct* vma,
     (which is one or more pages in size)
 
  */
-static vm_nopage_ret_t vm_shm_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int *type)
-{
-    if (type) *type = VM_FAULT_MINOR;
-        return do_vm_shm_nopage(vma, address);
-}
-
-/*
-
-    This routine is intended to remap addresses of a OpenGL context
-      (which is one ore more pages in size)
-
-*/
-static vm_nopage_ret_t vm_dma_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int *type)
-{
-    if (type) *type = VM_FAULT_MINOR;
-        return do_vm_dma_nopage(vma, address);
-}
-
-static vm_nopage_ret_t vm_kmap_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int *type)
-{
-    if (type) *type = VM_FAULT_MINOR;
-        return do_vm_kmap_nopage(vma, address);
-}
-
-static vm_nopage_ret_t vm_pcie_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int *type)
-{  
-       return do_vm_pcie_nopage(vma, address);
-}
-
-static vm_nopage_ret_t vm_gart_nopage(struct vm_area_struct* vma,
-                                      unsigned long address, 
-                                      int *type)
-{
-       return do_vm_gart_nopage(vma, address);
-}
-
-#else   /* LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,0) */
-
-static vm_nopage_ret_t vm_nopage(struct vm_area_struct* vma,
-                                 unsigned long address,
-                                 int write_access)
-{
-    return do_vm_nopage(vma, address);
-}
-
-#ifdef __AGP__BUILTIN__
-#ifdef __ia64__
-
-
-static vm_nopage_ret_t vm_cant_nopage(struct vm_area_struct* vma,
-                                 unsigned long address,
-                                 int write_access)
-{
-    return do_vm_cant_nopage(vma, address);
-}
-#endif /* __ia64__ */
-#endif /* __AGP__BUILTIN__ */
-
-/*
-
-    This function is called when a page of a mmap()'ed area is not currently
-    visible in the specified VMA.
-    Return value is the associated physical address for the requested page.
-    (If not implemented, then the kernel default routine would allocate a new,
-     zeroed page for servicing us)
-
-    Possible errors: SIGBUS, OutOfMem
-
-    This routine is intended to remap addresses of SHM SAREA
-    (which is one or more pages in size)
-
- */
-static vm_nopage_ret_t vm_shm_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int write_access)
+static int vm_shm_nopage(struct vm_area_struct* vma,
+			 struct vm_fault *vmf)
 {
-    return do_vm_shm_nopage(vma, address);
+        return do_vm_shm_nopage(vma, vmf);
 }
 
 /*
@@ -3638,37 +3557,30 @@ static vm_nopage_ret_t vm_shm_nopage(struct vm_area_struct* vma,
       (which is one ore more pages in size)
 
 */
-static vm_nopage_ret_t vm_dma_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int write_access)
+static int vm_dma_nopage(struct vm_area_struct* vma,
+			 struct vm_fault *vmf)
 {
-     return do_vm_dma_nopage(vma, address);
+        return do_vm_dma_nopage(vma, vmf);
 }
 
-static vm_nopage_ret_t vm_kmap_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int write_access)
+static int vm_kmap_nopage(struct vm_area_struct* vma,
+			  struct vm_fault *vmf)
 {
-     return do_vm_kmap_nopage(vma, address);
+        return do_vm_kmap_nopage(vma, vmf);
 }
 
-static vm_nopage_ret_t vm_pcie_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int write_access)
+static int vm_pcie_nopage(struct vm_area_struct* vma,
+			  struct vm_fault *vmf)
 {
-        return do_vm_pcie_nopage(vma, address);
+	return do_vm_pcie_nopage(vma, vmf);
 }
 
-static vm_nopage_ret_t vm_gart_nopage(struct vm_area_struct* vma,
-                                      unsigned long address, 
-                                      int *type)
+static int vm_gart_nopage(struct vm_area_struct* vma,
+			  struct vm_fault *vmf)
 {
-       return do_vm_gart_nopage(vma, address);
+       return do_vm_gart_nopage(vma, vmf);
 }
 
-
-#endif /* LINUX_VERSION_CODE > KERNEL_VERSION(2,6,0) */
-
 void* ATI_API_CALL __ke_vma_file_priv(struct vm_area_struct* vma)
 {
     return vma->vm_file->private_data;
@@ -3718,7 +3630,7 @@ char* ATI_API_CALL __ke_vm_page_prot_str(struct vm_area_struct* vma, char* buf)
     *(buf + i++) = pgprot & _PAGE_DIRTY    ? 'd' : '-';
     *(buf + i++) = pgprot & _PAGE_PSE      ? 'm' : 'k';
     *(buf + i++) = pgprot & _PAGE_GLOBAL   ? 'g' : 'l';
-#endif /* __i386__ */		
+#endif /* __i386__ */
     *(buf + i++) = 0;
 
     return buf;
@@ -3747,9 +3659,9 @@ char *__ke_pte_phys_addr_str(pte_t pte, char *buf, __ke_dma_addr_t* phys_address
     return buf;
 }
 
-char* ATI_API_CALL __ke_vm_phys_addr_str(struct vm_area_struct* vma, 
-                            char* buf, 
-                            unsigned long virtual_addr, 
+char* ATI_API_CALL __ke_vm_phys_addr_str(struct vm_area_struct* vma,
+                            char* buf,
+                            unsigned long virtual_addr,
                             __ke_dma_addr_t* phys_address)
 {
     pgd_t* pgd_p;
@@ -3773,7 +3685,7 @@ void ip_drm_vm_close(struct vm_area_struct* vma)
 
 static struct vm_operations_struct vm_ops =
 {
-    nopage:  vm_nopage,
+    fault:   vm_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
@@ -3791,42 +3703,42 @@ static struct vm_operations_struct vm_cant_ops =
 
 static struct vm_operations_struct vm_shm_ops =
 {
-    nopage:  vm_shm_nopage,
+    fault:   do_vm_shm_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
 
 static struct vm_operations_struct vm_pci_bq_ops =
 {
-    nopage:  vm_dma_nopage,
+    fault:   vm_dma_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
 
 static struct vm_operations_struct vm_ctx_ops =
 {
-    nopage:  vm_dma_nopage,
+    fault:   vm_dma_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
 
-static struct vm_operations_struct vm_pcie_ops = 
+static struct vm_operations_struct vm_pcie_ops =
 {
-    nopage:  vm_pcie_nopage,
+    fault:   vm_pcie_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
 
 static struct vm_operations_struct vm_kmap_ops =
 {
-    nopage:  vm_kmap_nopage,
+    fault:   vm_kmap_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
 
 static struct vm_operations_struct vm_gart_ops =
 {
-    nopage:  vm_gart_nopage,
+    fault:   vm_gart_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
@@ -3835,14 +3747,14 @@ static struct vm_operations_struct vm_gart_ops =
 #ifndef __ia64__
 static struct vm_operations_struct vm_agp_bq_ops =
 {
-    nopage:  vm_nopage,
+    fault:   vm_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
-#else		
+#else
 static struct vm_operations_struct vm_cant_agp_bq_ops =
 {
-    nopage:  vm_cant_nopage,
+    fault:   vm_cant_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
@@ -3877,19 +3789,19 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
 #ifdef __i386__
                 if (boot_cpu_data.x86 > 3)
                 {
-#ifdef FIREGL_USWC_SUPPORT                
+#ifdef FIREGL_USWC_SUPPORT
                     if (!firegl_pat_enabled)
-#endif                    
+#endif
                     {
                         pgprot_val(vma->vm_page_prot) |= _PAGE_PCD;
                         pgprot_val(vma->vm_page_prot) &= ~_PAGE_PWT;
                     }
-#ifdef FIREGL_USWC_SUPPORT                    
+#ifdef FIREGL_USWC_SUPPORT
                     else
                     {
                         vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-                    }    
-#endif                    
+                    }
+#endif
                 }
 #endif /* __i386__ */
 #ifdef __ia64__
@@ -3908,7 +3820,7 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
             }
 			break;
 
-#ifdef FIREGL_USWC_SUPPORT                
+#ifdef FIREGL_USWC_SUPPORT
         case __KE_ADPT_REG:
 			{
 #ifdef __ia64__
@@ -3928,7 +3840,7 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
                     }
                     else
                     {
-                        vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot); 
+                        vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
                     }
                 }
 #endif /* __i386__ */
@@ -3947,7 +3859,7 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
             vma->vm_ops = &vm_ops;
             }
 			break;
-#endif                    
+#endif
 
         case __KE_SHM:
             vma->vm_flags |= VM_SHM | VM_RESERVED; /* Don't swap */
@@ -3981,7 +3893,7 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
 
 #ifdef __AGP__BUILTIN__
         case __KE_AGP:
-            // if(dev->agp->cant_use_aperture == 1) 
+            // if(dev->agp->cant_use_aperture == 1)
 #ifdef __ia64__
             {
                 /*
@@ -4005,9 +3917,9 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
                     if( firegl_pat_enabled )
                     {
                         vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-                    }    
+                    }
                 }
-#endif                
+#endif
 
                 if (REMAP_PAGE_RANGE(vma,offset))
                 {
@@ -4024,8 +3936,8 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
 #endif
             break;
         case __KE_AGP_BQS:
-            // if(dev->agp->cant_use_aperture == 1) 
-#ifdef __ia64__			
+            // if(dev->agp->cant_use_aperture == 1)
+#ifdef __ia64__
             {
                 /*
                  * On some systems we can't talk to bus dma address from
@@ -4048,9 +3960,9 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
                     if( firegl_pat_enabled )
                     {
                        vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-                    }   
+                    }
                 }
-#endif                
+#endif
 
                 if (REMAP_PAGE_RANGE(vma,offset))
                 {
@@ -4079,15 +3991,15 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
             break;
 
          case __KE_GART_USWC:
-#ifdef FIREGL_USWC_SUPPORT         
+#ifdef FIREGL_USWC_SUPPORT
             if (boot_cpu_data.x86 > 3)
             {
                 if( firegl_pat_enabled )
                 {
                     vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-                }    
+                }
             }
-#endif            
+#endif
             // fall through
          case __KE_GART_CACHEABLE:
              vma->vm_flags |= VM_RESERVED;
@@ -4137,7 +4049,7 @@ extern struct _agp_memory *_X(agp_allocate_memory_phys_list)(size_t, u32, u64 *)
 #define FIREGL_agp_backend_release  _X(agp_backend_release)
 #define FIREGL_agp_memory           _X(agp_memory)
 
-unsigned int __ke_firegl_agpgart_inuse = AGPGART_INUSE_NONE;				
+unsigned int __ke_firegl_agpgart_inuse = AGPGART_INUSE_NONE;
 
 #if defined(CONFIG_AGP) || defined(CONFIG_AGP_MODULE)
 /*****************************************************************************/
@@ -4252,7 +4164,7 @@ static
 int ATI_API_CALL __ke_agpgart_available(__ke_pci_dev_t *pcidev, int use_internal)
 {
     drm_agp_module_stub = &drm_agp;
-    __ke_firegl_agpgart_inuse = KERNEL26_AGPGART_INUSE;	
+    __ke_firegl_agpgart_inuse = KERNEL26_AGPGART_INUSE;
     {
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,12)
         firegl_pci_device = (struct pci_dev*)(void*)pcidev;
@@ -4305,7 +4217,7 @@ int ATI_API_CALL __ke_agp_available(__ke_pci_dev_t *pcidev, int use_internal)
     } else {
          available = __ke_firegl_agpgart_available();
     }
-	
+
     return available;
 }
 
@@ -4410,7 +4322,7 @@ void ATI_API_CALL __ke_agp_copy_info(__ke_agp_kern_info_t* info)
 
     if (AGP_AVAILABLE(copy_info))
     {
-        struct agp_kern_info kern;    
+        struct agp_kern_info kern;
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,12)
         if (firegl_agp_bridge == NULL)
@@ -4508,7 +4420,7 @@ int ATI_API_CALL __ke_agp_enable(unsigned long mode)
 
 int ATI_API_CALL __ke_read_agp_caps_registers(__ke_pci_dev_t* dev, unsigned int *caps)
 {
-    return -EINVAL;	
+    return -EINVAL;
 }
 
 int ATI_API_CALL __ke_agp_acquire(__ke_pci_dev_t* dev)
@@ -4550,9 +4462,9 @@ int ATI_API_CALL __ke_smp_processor_id(void)
 
 /** \brief Runs a function on all other CPUs
  *  \param func_to_call function to be called on all other cpus
- *  \return None 
+ *  \return None
  */
-void ATI_API_CALL KCL_CallFuncOnOtherCpus(firegl_void_routine_t func_to_call) 
+void ATI_API_CALL KCL_CallFuncOnOtherCpus(firegl_void_routine_t func_to_call)
 {
 #ifdef CONFIG_SMP
 	smp_call_function( firegl_smp_func_parameter_wrap, (void*)func_to_call, 0, 1 );
@@ -4659,7 +4571,7 @@ int ATI_API_CALL __ke_has_PSE(void)
 
 int ATI_API_CALL KCL_is_pat_enabled(void)
 {
-   return firegl_pat_enabled; 
+   return firegl_pat_enabled;
 }
 
 static int ATI_API_CALL KCL_has_pat(void)
@@ -4675,7 +4587,7 @@ static void KCL_setup_pat(void *info)
 {
     unsigned long cr0=0, cr4=0;
     unsigned long flags;
-  
+
     local_irq_save(flags);
     cr0 = read_cr0() | 0x40000000;
     write_cr0(cr0);
@@ -4706,7 +4618,7 @@ static void  KCL_restore_pat(void *info)
 {
     unsigned long cr0 = 0, cr4 = 0;
     unsigned long flags;
-  
+
     local_irq_save(flags);
     cr0 = read_cr0() | 0x40000000;
     write_cr0(cr0);
@@ -4718,7 +4630,7 @@ static void  KCL_restore_pat(void *info)
        write_cr4(cr4 & ~X86_CR4_PGE);
     }
      __flush_tlb();
-  
+
     wrmsr(MSR_IA32_CR_PAT,  KCL_orig_pat[0], KCL_orig_pat[1]);
 
     cr0 = read_cr0();
@@ -4741,7 +4653,7 @@ static int ATI_API_CALL KCL_enable_pat(void)
          __KE_INFO("USWC is disabled in module parameters\n");
          return 0;
      }
-     
+
      if (!KCL_has_pat())
      {
         return 0;
@@ -4751,13 +4663,13 @@ static int ATI_API_CALL KCL_enable_pat(void)
 
      for ( i = 0; i < 2; i++ )
      {
-        for (j = 0; j < 4; j ++)    
+        for (j = 0; j < 4; j ++)
         {
             if (((KCL_orig_pat[i] >> (j * 8)) & 0xFF) == 1)
-            { 
+            {
                __KE_ERROR("Pat entry %d is already configured\n", (i+1)*(j+1));
                return 0;
-            } 
+            }
         }
     }
 
@@ -4829,7 +4741,7 @@ typedef struct tag_kasContext_t
 } kasContext_t;
 
 /** \brief KAS context */
-static kasContext_t kasContext; 
+static kasContext_t kasContext;
 
 /** \brief Kernel support required to enable KAS */
 #if defined(cmpxchg)                        && \
@@ -5137,7 +5049,7 @@ unsigned int ATI_API_CALL KAS_Ih_Execute(KAS_IhRoutine_t ih_routine,
     DBG_TRACE("Interrupt handler returned 0x%08X", ret);
 
     kasSetExecutionLevel(orig_level);
-    spin_unlock(&kasContext.lock_ih); 
+    spin_unlock(&kasContext.lock_ih);
 
     DBG_LEAVE("%d", ret);
     return ret;
@@ -5412,7 +5324,7 @@ typedef struct tag_kasSlabCache_t
 #endif
     spinlock_t lock;            /* OS spinlock object protecting the cache */
     unsigned int routine_type;  /* Type of routine the cache might be accessed from */
-    char name[14];              /* Cache object name (kernel 2.4 restricts its length to 19 chars) */
+    char name[24];              /* Cache object name (kernel 2.4 restricts its length to 19 chars) */
 } kasSlabCache_t;
 
 /** \brief Return Slab Cache object size
@@ -5450,7 +5362,8 @@ unsigned int ATI_API_CALL KAS_SlabCache_Initialize(void* hSlabCache,
 
     slabcache_obj->routine_type = access_type;
     spin_lock_init(&(slabcache_obj->lock));
-    sprintf(slabcache_obj->name, "kas(%08X)", (unsigned int)slabcache_obj);
+    snprintf(slabcache_obj->name, sizeof(slabcache_obj->name),
+		"kas(%p)", slabcache_obj);
 
     DBG_TRACE("creating slab object '%s'", slabcache_obj->name);
 
@@ -6366,7 +6279,7 @@ unsigned int ATI_API_CALL KAS_AtomicAddInt(
 
     kas_xadd(puiDestination, iAdd, ret, "l");
 
-    return ret + iAdd; 
+    return ret + iAdd;
 #else
     return 0xDEADC0DE; /* To make compiler happy */
 #endif
@@ -6449,7 +6362,7 @@ long ATI_API_CALL KAS_ScheduleTimeout(long n_jiffies)
 #ifdef FIREGL_CF_SUPPORT
 
 void *ATI_API_CALL KCL_lock_init()
-{   
+{
     spinlock_t *lock;
 
     lock = kmalloc(sizeof(*lock), GFP_KERNEL);
@@ -6461,7 +6374,7 @@ void *ATI_API_CALL KCL_lock_init()
 }
 
 void ATI_API_CALL KCL_lock_deinit(void *plock)
-{   
+{
     if (plock == NULL)
     {
         __KE_ERROR("plock is NULL\n");
diff --git a/firegl_public.h b/firegl_public.h
index fc49d6e..8cc18ed 100644
--- a/firegl_public.h
+++ b/firegl_public.h
@@ -78,7 +78,7 @@ do { \
     if (!pgd_present(*(pgd_p)))	\
     { \
         __KE_ERROR("FATAL ERROR: User queue buffer not present! (pgd)\n"); \
-        return (unsigned long)NOPAGE_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
+        return VM_FAULT_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
         /* alternatively we could generate a NOPAGE_OOM "out of memory" */ \
     } \
 } while(0)
@@ -91,7 +91,7 @@ do { \
     if (!pud_present(*(pud_p)))	\
     { \
         __KE_ERROR("FATAL ERROR: User queue buffer not present! (pud)\n"); \
-        return (unsigned long)NOPAGE_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
+        return VM_FAULT_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
         /* alternatively we could generate a NOPAGE_OOM "out of memory" */ \
     } \
     pmd_p = pmd_offset(pud_p, pte_linear); \
@@ -111,7 +111,7 @@ do { \
     if (!pmd_present(*(pmd_p)))	\
     { \
         __KE_ERROR("FATAL ERROR: User queue buffer not present! (pmd)\n"); \
-        return (unsigned long)NOPAGE_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
+        return VM_FAULT_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
         /* alternatively we could generate a NOPAGE_OOM "out of memory" */ \
     } \
 } while(0)
@@ -157,7 +157,7 @@ do { \
     if (!pte_present(pte)) \
     { \
         __KE_ERROR("FATAL ERROR: User queue buffer not present! (pte)\n"); \
-        return (unsigned long)NOPAGE_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
+        return VM_FAULT_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
         /* alternatively we could generate a NOPAGE_OOM "out of memory" */ \
     } \
 } while(0)
-- 
1.5.6.rc2.45.gdc92c
EOT
 # http://launchpadlibrarian.net/15305524/0004-Linux-2.6.26.x-kernels-support.patch
 [ "$VER" = "8-6" ] && patch -p1 <<'EOT'
From d6ef03ff417eb001653c51112c79e709ba8eaec9 Mon Sep 17 00:00:00 2001
From: =?utf-8?q?=C5=BDilvinas=20Valinskas?= <zilvinas@wilibox.com>
Date: Sat, 14 Jun 2008 03:54:38 +0300
Subject: [PATCH] Linux 2.6.26.x kernels support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

o trailing white spaces/tabs removed.
o VMA ->nopage() removed, go for ->fault()
o compiles with warnings ...
o most importantly ... WORKS on 2.6.26-rc6/amd64!

Signed-off-by: Žilvinas Valinskas <zilvinas@wilibox.com>
---
 firegl_public.c |  655 ++++++++++++++++++++++++-------------------------------
 firegl_public.h |    8 +-
 2 files changed, 288 insertions(+), 375 deletions(-)

diff --git a/firegl_public.c b/firegl_public.c
index d71700d..3c8e72a 100644
--- a/firegl_public.c
+++ b/firegl_public.c
@@ -24,13 +24,13 @@
 // ============================================================
 #include <linux/version.h>
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0) 
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
 #error Kernel versions older than 2.6.0 are no longer supported by this module.
-#endif 
+#endif
 
 #include <linux/autoconf.h>
 
-#if !defined(CONFIG_X86_PC) 
+#if !defined(CONFIG_X86_PC)
 #if !defined(CONFIG_X86_64)
 #if !defined(CONFIG_X86_VOYAGER)
 #if !defined(CONFIG_X86_NUMAQ)
@@ -62,10 +62,10 @@
  * distribution would even include such a kernel patch. */
 #ifdef CONFIG_MEM_MIRROR
 /* Prevent asm/mm_track.h from being included in subsequent
- * kernel headers as that would redefine CONFIG_MEM_MIRROR. */ 
+ * kernel headers as that would redefine CONFIG_MEM_MIRROR. */
 #ifndef CONFIG_X86_64
 #define __I386_MMTRACK_H__
-#define mm_track(ptep)                 
+#define mm_track(ptep)
 #else
 #define __X86_64_MMTRACK_H__
 #define mm_track_pte(ptep)
@@ -93,7 +93,7 @@
 #include <linux/kernel.h>
 #include <linux/fs.h>
 #include <linux/proc_fs.h>
-#include <linux/init.h>
+//#include <linux/init.h>
 #include <linux/file.h>
 #include <linux/pci.h>
 #include <linux/wait.h>
@@ -151,8 +151,8 @@
 #include "linux/freezer.h"
 #endif
 
-//  For 2.6.18 or higher, the UTS_RELEASE is defined in the linux/utsrelease.h. 
-#ifndef UTS_RELEASE 
+//  For 2.6.18 or higher, the UTS_RELEASE is defined in the linux/utsrelease.h.
+#ifndef UTS_RELEASE
 #include <linux/utsrelease.h>
 #endif
 
@@ -210,7 +210,7 @@ char* firegl = NULL;
 int __ke_debuglevel = 0;
 int __ke_moduleflags = 0;
 
-static struct pci_device_id fglrx_pci_table[] = 
+static struct pci_device_id fglrx_pci_table[] =
 {
 #define FGL_ASIC_ID(x)                      \
    {                           \
@@ -278,7 +278,7 @@ const unsigned long __ke_PAE_State = 1;
 
 static int firegl_pat_enabled = 0;
 static unsigned long KCL_pat[2];
-static unsigned long KCL_orig_pat[2]; 
+static unsigned long KCL_orig_pat[2];
 
 static int ATI_API_CALL KCL_enable_pat(void);
 static void ATI_API_CALL KCL_disable_pat(void);
@@ -305,7 +305,7 @@ long ip_firegl_compat_ioctl(struct file* filp, unsigned int cmd, unsigned long a
 #endif
 
 __ke_ssize_t ip_firegl_read( struct file *filp,
-                         char *buf, 
+                         char *buf,
                          __ke_size_t size,
                          __ke_loff_t *off_ptr)
 {
@@ -313,7 +313,7 @@ __ke_ssize_t ip_firegl_read( struct file *filp,
 }
 
 __ke_ssize_t ip_firegl_write( struct file *filp,
-                          const char *buf, 
+                          const char *buf,
                           __ke_size_t size,
                           __ke_loff_t *off_ptr)
 {
@@ -449,34 +449,34 @@ READ_PROC_WRAP(firegl_debug_info)
 READ_PROC_WRAP(firegl_bios_version)
 READ_PROC_WRAP(firegl_interrupt_info)
 
-static int 
+static int
 firegl_interrupt_open_wrap(
-        struct inode *inode, 
-        struct file *file) 
+        struct inode *inode,
+        struct file *file)
 {
     return firegl_interrupt_open(inode, file);
 }
 
-static int 
+static int
 firegl_interrupt_release_wrap(
-        struct inode *inode, 
-        struct file *file) 
+        struct inode *inode,
+        struct file *file)
 {
     return firegl_interrupt_release(inode, file);
 }
 
-static ssize_t 
+static ssize_t
 firegl_interrupt_read_wrap(
-        struct file *user_file, 
-        char __user *user_buf, 
-        size_t user_buf_size, 
+        struct file *user_file,
+        char __user *user_buf,
+        size_t user_buf_size,
         loff_t *user_file_pos)
 {
     return (ssize_t) firegl_interrupt_read(user_file, user_buf, user_buf_size, user_file_pos);
 }
 
-static unsigned int 
-firegl_interrupt_poll_wrap(struct file *user_file, poll_table *pt) 
+static unsigned int
+firegl_interrupt_poll_wrap(struct file *user_file, poll_table *pt)
 {
     if(firegl_interrupt_poll(user_file, (__ke_poll_table*)pt))
     {
@@ -488,11 +488,11 @@ firegl_interrupt_poll_wrap(struct file *user_file, poll_table *pt)
     }
 }
 
-static ssize_t 
+static ssize_t
 firegl_interrupt_write_wrap(
-        struct file *user_file, 
-        const char __user *user_buf, 
-        size_t user_buf_size, 
+        struct file *user_file,
+        const char __user *user_buf,
+        size_t user_buf_size,
         loff_t *user_file_pos)
 {
     return (ssize_t) firegl_interrupt_write(user_file, user_buf, user_buf_size, user_file_pos);
@@ -502,7 +502,7 @@ firegl_interrupt_write_wrap(
  *  \param func function to be wrapped
  *  \return None */
 
-static void 
+static void
 firegl_smp_func_parameter_wrap(
 void *func)
 {
@@ -517,7 +517,7 @@ static struct file_operations firegl_interrupt_file_ops = {
     .write      = firegl_interrupt_write_wrap
 };
 
-__ke_proc_list_t firegl_proc_list[] = 
+__ke_proc_list_t firegl_proc_list[] =
 {
     { "name",           drm_name_info_wrap,         NULL},
     { "mem",            drm_mem_info_wrap,          NULL},
@@ -586,11 +586,11 @@ static struct proc_dir_entry *firegl_proc_init( device_t *dev,
         {
 		    ent->proc_fops = (struct file_operations*)list->fops;
         }
-       
+
         {
             ent->data = (dev->pubdev.signature == FGL_DEVICE_SIGNATURE)? firegl_find_device(minor) : (dev);
         }
-        
+
         list++;
 	}
 
@@ -623,7 +623,7 @@ static int firegl_proc_cleanup( int minor,
     {
         remove_proc_entry("dri", NULL);
         __KE_DEBUG("remove proc dri. \n");
-    }    
+    }
     return 0;
 }
 
@@ -661,12 +661,12 @@ static int firegl_stub_getminor(const char *name, struct file_operations *fops,
 {
 	int i;
         int count = 0;
-        
+
         __KE_DEBUG("firegl_stub_getminor: name=\"%s\"\n", name);
 
-	for( i = 0; i < FIREGL_STUB_MAXCARDS; i++ ) 
+	for( i = 0; i < FIREGL_STUB_MAXCARDS; i++ )
         {
-	    if( !firegl_stub_list[i].fops ) 
+	    if( !firegl_stub_list[i].fops )
             {
 		firegl_stub_list[i].name = name;
 		firegl_stub_list[i].fops = fops;
@@ -693,16 +693,16 @@ static int firegl_stub_putminor(int minor)
     if (minor < 0 || minor >= FIREGL_STUB_MAXCARDS)
     {
         return -1;
-    }    
+    }
     firegl_proc_cleanup(minor, firegl_stub_root, firegl_stub_list[minor].dev_root, firegl_stub_list[minor].proclist);
     firegl_stub_list[minor].name = NULL;
     firegl_stub_list[minor].fops = NULL;
     firegl_stub_list[minor].proclist = NULL;
 
-    if( minor == (firegl_minors-1) ) 
+    if( minor == (firegl_minors-1) )
     {
         unregister_chrdev(DRM_MAJOR, "drm");
-    }   
+    }
     return 0;
 }
 
@@ -726,7 +726,7 @@ static int __init firegl_stub_register(const char *name, struct file_operations
         return -1;
     } else if(err == -EBUSY) {
 
-        // the registering of the module's device has failed 
+        // the registering of the module's device has failed
         // because there was already some other drm module loaded.
         __KE_DEBUG("register_chrdev() failed with -EBUSY\n");
 	return -1;
@@ -758,7 +758,7 @@ static int fglrx_pci_probe(struct pci_dev *dev, const struct pci_device_id *id_t
 /* Starting from 2.6.14, kernel has new struct defined for pm_message_t,
    we have to handle this case separately.
    2.6.11/12/13 kernels have pm_message_t defined as int and older kernels
-   don't have pm_message_t defined. 
+   don't have pm_message_t defined.
  */
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,14)
 static int fglrx_pci_suspend(struct pci_dev *pdev, pm_message_t pm_event)
@@ -794,9 +794,9 @@ static int fglrx_pci_suspend(struct pci_dev *pdev, u32 pm_event)
 
     if (!ret)
     {
-        
-    // since privdev->pcidev is acquired in X server, use pdev 
-    // directly here to allow suspend/resume without X server start. 
+
+    // since privdev->pcidev is acquired in X server, use pdev
+    // directly here to allow suspend/resume without X server start.
         firegl_pci_save_state((__ke_pci_dev_t*)pdev, privdev);
         pci_disable_device(pdev);
         PMSG_EVENT(pdev->dev.power.power_state) = state;
@@ -848,13 +848,13 @@ static int fglrx_pci_resume(struct pci_dev *pdev)
     // before pci_set_master!
     firegl_pci_restore_state((__ke_pci_dev_t*)pdev, privdev);
 
-    if (pci_enable_device(pdev)) 
+    if (pci_enable_device(pdev))
     {
         __KE_ERROR("Cannot enable PCI device.\n");
-    }    
+    }
 
     pci_set_master(pdev);
- 
+
     firegl_cail_powerup(privdev);
 
     if (PMSG_EVENT(pdev->dev.power.power_state) == PM_EVENT_SUSPEND)
@@ -865,7 +865,7 @@ static int fglrx_pci_resume(struct pci_dev *pdev)
     return 0;
 }
 
-static struct pci_driver fglrx_pci_driver = 
+static struct pci_driver fglrx_pci_driver =
 {
     .name           = "fglrx_pci",
     .id_table       = fglrx_pci_table,
@@ -921,10 +921,10 @@ static int firegl_init_devices(__ke_device_t *pubdev)
     {
         pid = (struct pci_device_id *) &fglrx_pci_table[i];
         pdev = NULL;
-        while (( pdev = pci_get_subsys(pid->vendor, 
-                                       pid->device, 
-                                       PCI_ANY_ID, 
-                                       PCI_ANY_ID, 
+        while (( pdev = pci_get_subsys(pid->vendor,
+                                       pid->device,
+                                       PCI_ANY_ID,
+                                       PCI_ANY_ID,
                                        pdev)) != NULL)
         {
             num_of_devices++;
@@ -934,7 +934,7 @@ static int firegl_init_devices(__ke_device_t *pubdev)
 
     if (firegl_init_device_heads(num_of_devices))
     {
-        return -ENOMEM;     
+        return -ENOMEM;
     }
 
     for (i=0; fglrx_pci_table[i].vendor != 0; i++)
@@ -942,15 +942,15 @@ static int firegl_init_devices(__ke_device_t *pubdev)
         pid = (struct pci_device_id *) &fglrx_pci_table[i];
 
         pdev = NULL;
-        while (( pdev = pci_get_subsys(pid->vendor, 
-                                       pid->device, 
-                                       PCI_ANY_ID, 
-                                       PCI_ANY_ID, 
+        while (( pdev = pci_get_subsys(pid->vendor,
+                                       pid->device,
+                                       PCI_ANY_ID,
+                                       PCI_ANY_ID,
                                        pdev)) != NULL)
         {
             if ((ret_code = firegl_get_dev(pubdev, pdev)))
             {
-                return ret_code; 
+                return ret_code;
             }
 
             j++;
@@ -983,7 +983,7 @@ static int __init firegl_init_module(void)
     // init global vars that are in fact constants
     __ke_HZ = HZ;
 
-#ifdef _KE_SERIAL_DEBUG  
+#ifdef _KE_SERIAL_DEBUG
     __ke_SetSerialPort();
 #endif
 
@@ -995,11 +995,11 @@ static int __init firegl_init_module(void)
         return retcode;
     }
 
-#ifdef FIREGL_CF_SUPPORT    
+#ifdef FIREGL_CF_SUPPORT
     adapter_chain_init();
     cf_object_init();
-#endif    
-     
+#endif
+
     // init DRM proc list
     drm_proclist = kmalloc((DRM_PROC_ENTRIES + 1) * sizeof(__ke_proc_list_t), GFP_KERNEL);
     if ( drm_proclist == NULL )
@@ -1087,7 +1087,7 @@ static int __init firegl_init_module(void)
 	        dev->pubdev.date,
 		    firegl_minors);
 
-    
+
 #ifdef FIREGL_POWER_MANAGEMENT
     if (pci_register_driver (&fglrx_pci_driver) < 0)
     {
@@ -1117,12 +1117,12 @@ static void __exit firegl_cleanup_module(void)
     {
        KCL_disable_pat();
        __KE_INFO("Disable PAT\n");
-    }   
+    }
 #endif // FIREGL_USWC_SUPPORT
 
     for (i = 0; i < count; i++)
     {
-        if ( firegl_stub_unregister(i) ) 
+        if ( firegl_stub_unregister(i) )
         {
             __KE_ERROR("Cannot unload module on minor: %d\n", i);
         }
@@ -1144,10 +1144,10 @@ static void __exit firegl_cleanup_module(void)
 	        dev->pubdev.patchlevel,
 	        dev->pubdev.date);
 
-#ifdef FIREGL_CF_SUPPORT    
+#ifdef FIREGL_CF_SUPPORT
     cf_object_cleanup();
-    adapter_chain_cleanup();    
-#endif // FIREGL_CF_SUPPORT   
+    adapter_chain_cleanup();
+#endif // FIREGL_CF_SUPPORT
 
     firegl_private_cleanup (&dev->pubdev);
 
@@ -1225,18 +1225,18 @@ void ATI_API_CALL __ke_add_wait_queue(__ke_wait_queue_head_t* queue_head, __ke_w
 void ATI_API_CALL __ke_remove_wait_queue(__ke_wait_queue_head_t* queue_head, __ke_wait_queue_t* entry)
 {
 //    current->state = TASK_RUNNING;
-    remove_wait_queue((wait_queue_head_t*)(void *)queue_head, 
+    remove_wait_queue((wait_queue_head_t*)(void *)queue_head,
 									(wait_queue_t*)(void *)entry);
 }
 
 void ATI_API_CALL __ke_init_waitqueue_head(__ke_wait_queue_head_t* queue_head)
 {
-    init_waitqueue_head((wait_queue_head_t*)(void *)queue_head); 
+    init_waitqueue_head((wait_queue_head_t*)(void *)queue_head);
 }
 
 void ATI_API_CALL __ke_wait_event_interruptible(__ke_wait_queue_head_t* queue_head, int condition)
 {
-    wait_event_interruptible(*((wait_queue_head_t*)(void *)queue_head), condition); 
+    wait_event_interruptible(*((wait_queue_head_t*)(void *)queue_head), condition);
 }
 
 void ATI_API_CALL __ke_poll_wait(struct file* filp, __ke_wait_queue_head_t* queue_head, __ke_poll_table* pt)
@@ -1247,13 +1247,13 @@ void ATI_API_CALL __ke_poll_wait(struct file* filp, __ke_wait_queue_head_t* queu
 void ATI_API_CALL *__ke_asyncio_alloc_sema()
 {
     int i;
-    
+
     for(i=0; i<FIREGL_ASYNCIO_MAX_SEMA; i++)
     {
         if(fireglAsyncioSemaphoreUsed[i] != 1)
         {
             fireglAsyncioSemaphoreUsed[i] = 1;
-            
+
             return &(fireglAsyncioSemaphore[i]);
         }
     }
@@ -1263,7 +1263,7 @@ void ATI_API_CALL *__ke_asyncio_alloc_sema()
 void ATI_API_CALL __ke_asyncio_free_sema(struct semaphore *pSema)
 {
     int i;
-    
+
     for(i=0; i<FIREGL_ASYNCIO_MAX_SEMA; i++)
     {
         if( &(fireglAsyncioSemaphore[i]) == pSema )
@@ -1277,15 +1277,15 @@ void ATI_API_CALL __ke_asyncio_free_sema(struct semaphore *pSema)
 void ATI_API_CALL __ke_asyncio_init_sema(void)
 {
     int i;
-    
+
     for(i=0; i<FIREGL_ASYNCIO_MAX_SEMA; i++)
     {
         fireglAsyncioSemaphoreUsed[i] = 0;
     }
-}    
+}
 
-int ATI_API_CALL __ke_fasync_helper( int fd, 
-                        struct file *filep, 
+int ATI_API_CALL __ke_fasync_helper( int fd,
+                        struct file *filep,
                         int mode,
                         struct fasync_struct **pasync_queue)
 {
@@ -1352,33 +1352,33 @@ unsigned int ATI_API_CALL KCL_ProcessIsTerminated(unsigned int pid)
 {
    struct task_struct *p;
    int process_terminated = 1;
-  
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
+
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
    rcu_read_lock();
-#else   
+#else
    read_lock(&tasklist_lock);
-#endif   
-   p = find_task_by_pid( pid );
-   if (p) 
+#endif
+   p = find_task_by_vpid( pid );
+   if (p)
    {
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,10)
-      if (p->exit_state != EXIT_ZOMBIE && p->exit_state != EXIT_DEAD) 
+      if (p->exit_state != EXIT_ZOMBIE && p->exit_state != EXIT_DEAD)
 #else
-      if (!(p->flags & PF_EXITING)) 
+      if (!(p->flags & PF_EXITING))
 #endif
       {
          process_terminated = 0;
       }
-   }   
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
+   }
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
    rcu_read_unlock();
-#else   
+#else
    read_unlock(&tasklist_lock);
-#endif   
+#endif
    return process_terminated;
 }
 
-/** /brief Call global OS kernel task/thread scheduler 
+/** /brief Call global OS kernel task/thread scheduler
  *  /return Nonzero if a system call was awakened by a signal
  */
 int ATI_API_CALL KCL_GetSignalStatus(void)
@@ -1432,15 +1432,15 @@ void ATI_API_CALL __ke_unblock_all_signals(void)
     unblock_all_signals();
 }
 
-#if defined(__i386__) 
+#if defined(__i386__)
 #ifndef __HAVE_ARCH_CMPXCHG
-static inline 
-unsigned long __fgl_cmpxchg(volatile void *ptr, unsigned long old,            
-                        unsigned long new, int size)                      
-{                                                                                       
-    unsigned long prev;                                                             
-    switch (size) {                                                                 
-    case 1:                                                                         
+static inline
+unsigned long __fgl_cmpxchg(volatile void *ptr, unsigned long old,
+                        unsigned long new, int size)
+{
+    unsigned long prev;
+    switch (size) {
+    case 1:
         __asm__ __volatile__(LOCK_PREFIX "cmpxchgb %b1,%2"
                              : "=a"(prev)
                              : "q"(new), "m"(*__xg(ptr)), "0"(old)
@@ -1551,7 +1551,7 @@ struct inode* ATI_API_CALL __ke_get_file_inode(struct file* filp)
  */
 KCL_TYPE_Pid ATI_API_CALL KCL_GetPid(void)
 {
-    return current->pid; 
+    return current->pid;
 }
 
 /** /brief Return the current Thread Group ID
@@ -1559,7 +1559,7 @@ KCL_TYPE_Pid ATI_API_CALL KCL_GetPid(void)
  */
 KCL_TYPE_Pid ATI_API_CALL KCL_GetTgid(void)
 {
-    return current->tgid; 
+    return current->tgid;
 }
 
 /** /brief Return the effective user ID
@@ -1655,7 +1655,7 @@ static int KCL_MAP_KernelConfigParam[] =
     1
 #else
     0
-#endif 
+#endif
 };
 
 /** /brief Check whether a kernel configuration parameter is defined
@@ -1718,13 +1718,13 @@ unsigned long ATI_API_CALL __ke_get_resource_start(__ke_pci_dev_t *dev, unsigned
 #if defined(__x86_64__) || defined(__ia64__)
 void* ATI_API_CALL __ke_pci_alloc_consistent(__ke_pci_dev_t* dev, int size, void *dma_handle)
 {
-	return (pci_alloc_consistent( (struct pci_dev*)(void *)dev, size, dma_handle)); 
+	return (pci_alloc_consistent( (struct pci_dev*)(void *)dev, size, dma_handle));
 }
 
 void ATI_API_CALL __ke_pci_free_consistent(__ke_pci_dev_t* dev, int size, unsigned long cpu_addr,
 						 unsigned int dma_handle)
 {
-	pci_free_consistent( (struct pci_dev*)(void *)dev, size, (void *)cpu_addr, 
+	pci_free_consistent( (struct pci_dev*)(void *)dev, size, (void *)cpu_addr,
 		(unsigned long)dma_handle);
 }
 #endif // __ia64__
@@ -1748,7 +1748,7 @@ static int KCL_MAP_ErrorCode[] =
 
 /** \brief This function maps OS independent error conditions to OS defined error codes
  *  \param errcode OS independent error condition code
- *  \return OS kernel defined error code corresponding to the requested error condition 
+ *  \return OS kernel defined error code corresponding to the requested error condition
  */
 int ATI_API_CALL KCL_GetErrorCode(KCL_ENUM_ErrorCode errcode)
 {
@@ -1766,7 +1766,7 @@ int ATI_API_CALL KCL_GetErrorCode(KCL_ENUM_ErrorCode errcode)
 int ATI_API_CALL firegl_get_user_ptr(u32 *src, void **dst)
 {
   unsigned long temp;
-  int err = get_user(temp, src); 
+  int err = get_user(temp, src);
   *dst = (void*) temp;
   return err;
 }
@@ -1906,7 +1906,7 @@ void ATI_API_CALL __ke_atomic_set(void* v, int val)
 
 int ATI_API_CALL __ke_atomic_dec_and_test(void* v)
 {
-    return atomic_dec_and_test((atomic_t*)v); 
+    return atomic_dec_and_test((atomic_t*)v);
 }
 
 /*****************************************************************************/
@@ -2006,19 +2006,19 @@ void ATI_API_CALL __ke_print_debug(const char* fmt, ...)
 #endif
 
 #ifdef _KE_SERIAL_DEBUG
-// To enable serial port debug message dumping,just define _KE_SERIAL_DEBUG in firegl_public.h file. 
-// Connect two PC with a null modern serial cable. run Hyper ternimal on the remote machine. 
-// It's useful to debug resume if network not works properly and serial port is not recovered 
+// To enable serial port debug message dumping,just define _KE_SERIAL_DEBUG in firegl_public.h file.
+// Connect two PC with a null modern serial cable. run Hyper ternimal on the remote machine.
+// It's useful to debug resume if network not works properly and serial port is not recovered
 // properly when fglrx resume hook is called...
- 
- 
+
+
 #define SER_DATA_PORT       0x3f8
 #define SER_INT_CTRL_PORT   SER_DATA_PORT + 1
 #define SER_INT_STAT_PORT   SER_DATA_PORT + 2
 #define SER_LINE_CTRL_PORT  SER_DATA_PORT + 3
 #define SER_MODEM_CTRL_PORT SER_DATA_PORT + 4
 #define SER_LINE_STAT_PORT  SER_DATA_PORT + 5
-    
+
 void ATI_API_CALL __ke_printc(char c)
 {
      while((inb(SER_LINE_STAT_PORT) & 0x20) == 0 ); //wait until Transmitter Holding Register Empty
@@ -2028,7 +2028,7 @@ void ATI_API_CALL __ke_printc(char c)
 void ATI_API_CALL __ke_printstr(const char *str)
 {
     int len = strlen(str);
-    while(len--)__ke_printc(*str++);  
+    while(len--)__ke_printc(*str++);
 }
 
 int ATI_API_CALL __ke_SerPrint(const char *format, ...)
@@ -2041,26 +2041,26 @@ int ATI_API_CALL __ke_SerPrint(const char *format, ...)
     vsprintf(buffer, format, ap);
 
     va_end(ap);
-    
+
     __ke_printstr(buffer);
-    
+
     return 0;
 }
 void ATI_API_CALL __ke_SetSerialPort()
 {
     DRM_INFO("setup serial port\n");
-    outb(0x00,  SER_INT_CTRL_PORT);   // Turn off interrupts 
-
-    outb(0x80,  SER_LINE_CTRL_PORT);  // SET DLAB ON 
-    outb(0x01,  SER_DATA_PORT);  // Set Baud rate - Divisor Latch Low Byte 
-                             // 0x01 = 115,200 ,0x02 =  57,600,  0x06 =  19,200 BPS, 0x0C =   9,600 BPS  
-    outb(0x00,  SER_DATA_PORT + 1);  // Set Baud rate - Divisor Latch High Byte 
-    outb(0x03,  SER_LINE_CTRL_PORT); // reset DLAB ,8 Bits, No Parity, 1 Stop Bit 
-    outb(0xC7,  SER_DATA_PORT + 2);  // FIFO Control Register 
+    outb(0x00,  SER_INT_CTRL_PORT);   // Turn off interrupts
+
+    outb(0x80,  SER_LINE_CTRL_PORT);  // SET DLAB ON
+    outb(0x01,  SER_DATA_PORT);  // Set Baud rate - Divisor Latch Low Byte
+                             // 0x01 = 115,200 ,0x02 =  57,600,  0x06 =  19,200 BPS, 0x0C =   9,600 BPS
+    outb(0x00,  SER_DATA_PORT + 1);  // Set Baud rate - Divisor Latch High Byte
+    outb(0x03,  SER_LINE_CTRL_PORT); // reset DLAB ,8 Bits, No Parity, 1 Stop Bit
+    outb(0xC7,  SER_DATA_PORT + 2);  // FIFO Control Register
     outb(0x0b,  SER_DATA_PORT + 4);  // Turn on DTR, RTS, and OUT2
-  
+
     __ke_printstr("serial port 0x3f8 is set ready for message print out \n");
-}  
+}
 #endif
 
 /** \brief Get number of available RAM pages
@@ -2241,7 +2241,7 @@ void *ATI_API_CALL __ke_vmalloc_to_addr(void *vmalloc_addr)
     struct page *page = NULL;
 
     page = vmalloc_to_page(vmalloc_addr);
-    if(page == NULL) 
+    if(page == NULL)
     {
         __KE_ERROR("__ke_vmalloc_to_addr: invalid page!");
         return NULL;
@@ -2283,7 +2283,7 @@ int ATI_API_CALL __ke_do_munmap(unsigned long addr, unsigned long len)
     retcode = do_munmap(current->mm,
                         addr,
                         len);
-#endif                        
+#endif
     up_write(&current->mm->mmap_sem);
     return retcode;
 }
@@ -2327,10 +2327,10 @@ long long ATI_API_CALL __divdi3(long long n, long long base)
        minus = !minus;
     }
     else
-    {   
+    {
        ubase = base;
     }
-    
+
     do_div(un, ubase);
     return (minus? -un : un);
 }
@@ -2360,7 +2360,7 @@ long long ATI_API_CALL __moddi3(long long n, long long base)
     else
     {
        ubase = base;
-    }   
+    }
 
     rem = do_div(un, ubase);
     return (minus? -rem : rem);
@@ -2391,7 +2391,7 @@ void* ATI_API_CALL __ke_vmap(unsigned long *pagelist, unsigned int count)
     vaddr = (void *) vmap(pages, count);
 #else
 #ifdef VM_MAP
-    vaddr = (void *) vmap(pages, count, VM_MAP, PAGE_KERNEL); 
+    vaddr = (void *) vmap(pages, count, VM_MAP, PAGE_KERNEL);
 #else
     vaddr = (void *) vmap(pages, count, 0, PAGE_KERNEL);
 #endif
@@ -2447,7 +2447,7 @@ void ATI_API_CALL __ke_vunmap(void* addr)
 }
 #endif  // defined(VM_MAP) || defined(vunmap)
 
-/** \brief Reserve a memory page 
+/** \brief Reserve a memory page
  *
  * \param pt Kernel logical address of the page
  *
@@ -2459,7 +2459,7 @@ void ATI_API_CALL KCL_ReserveMemPage(void* pt)
     SetPageReserved(virt_to_page((unsigned long)pt));
 }
 
-/** \brief Unreserve a memory page 
+/** \brief Unreserve a memory page
  *
  * \param pt Kernel logical address of the page
  *
@@ -2471,7 +2471,7 @@ void ATI_API_CALL KCL_UnreserveMemPage(void* pt)
     ClearPageReserved(virt_to_page((unsigned long)pt));
 }
 
-/** \brief Lock a memory page 
+/** \brief Lock a memory page
  *
  * \param pt Kernel logical address of the page
  *
@@ -2480,14 +2480,14 @@ void ATI_API_CALL KCL_UnreserveMemPage(void* pt)
  */
 void ATI_API_CALL KCL_LockMemPage(void* pt)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15) 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15)
     SetPageReserved(virt_to_page((unsigned long)pt));
 #else
     lock_page(virt_to_page((unsigned long)pt));
 #endif
 }
 
-/** \brief Unlock a memory page 
+/** \brief Unlock a memory page
  *
  * \param pt Kernel logical address of the page
  *
@@ -2496,7 +2496,7 @@ void ATI_API_CALL KCL_LockMemPage(void* pt)
  */
 void ATI_API_CALL KCL_UnlockMemPage(void* pt)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15) 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15)
     ClearPageReserved(virt_to_page((unsigned long)pt));
 #else
     unlock_page(virt_to_page((unsigned long)pt));
@@ -2521,7 +2521,7 @@ void* ATI_API_CALL __ke_get_vmptr( struct _agp_memory* memory )
 	return memory->vmptr;
 }
 #endif
-                              
+
 void* ATI_API_CALL __ke_ioremap(unsigned long offset, unsigned long size)
 {
     return ioremap(offset, size);
@@ -2592,7 +2592,7 @@ void ATI_API_CALL KCL_flush_tlb_onepage(struct vm_area_struct * vma, unsigned lo
 {
 /*Some kernel developer removed the export of symbol "flush_tlb_page" on 2.6.25 x86_64 SMP kernel.
   Define a simple version here.*/
-#if defined(__x86_64__) && defined(__SMP__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25)) 
+#if defined(__x86_64__) && defined(__SMP__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25))
     on_each_cpu(KCL_flush_tlb_one, &va, 1, 1);
 #else
     flush_tlb_page(vma, va);
@@ -2649,9 +2649,9 @@ void ATI_API_CALL __ke_put_vm_page_table(unsigned long page_addr)
 static inline int ptep_clear_flush_dirty(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
 {
     int ret = 0;
-    
+
     DBG_ENTER("0x%08X, 0x%08X, 0x%08X->0x%08X", vma, addr, ptep, *ptep);
-    
+
     if (pte_dirty(*ptep))
     {
 #ifdef __x86_64__
@@ -2666,19 +2666,19 @@ static inline int ptep_clear_flush_dirty(struct vm_area_struct *vma, unsigned lo
         {
             pte_update(vma->vm_mm, addr, ptep);
         }
-#endif        
+#endif
     }
 
     DBG_TRACE("0x%08X->0x%08X", ptep, *ptep);
-    
+
     // Flush Translation Lookaside Buffers
     if (ret)
     {
         KCL_flush_tlb_onepage(vma,addr);
     }
-    
+
     DBG_LEAVE("%d", ret);
-    
+
     return ret;
 }
 #endif
@@ -2705,7 +2705,7 @@ static inline int ptep_clear_flush_dirty(struct vm_area_struct *vma, unsigned lo
  * the virtual address
  *
  * \param mm Pointer to the memory descriptor structure
- * \param virtual_addr Virtual address 
+ * \param virtual_addr Virtual address
  *
  * \return Old value of the "dirty" flag on success or negative on error
  *
@@ -2961,7 +2961,7 @@ int ATI_API_CALL __ke_config_mtrr(void)
        return 0;
 #else
     return 1;
-#endif    
+#endif
 #else /* !CONFIG_MTRR */
     return 0;
 #endif /* !CONFIG_MTRR */
@@ -2987,7 +2987,7 @@ int ATI_API_CALL __ke_mtrr_del(int reg, unsigned long base, unsigned long size)
 
 int ATI_API_CALL __ke_has_vmap(void)
 {
-// We disable vmap for 2.4.x kernel to work around the big memory( > 4GB ) issue. 
+// We disable vmap for 2.4.x kernel to work around the big memory( > 4GB ) issue.
 #if defined(VM_MAP) || defined(vunmap)
     return 1;
 #else
@@ -3009,7 +3009,7 @@ int ATI_API_CALL __ke_no_iommu(void)
 {
     return 0;
 }
-#endif 
+#endif
 
 /*****************************************************************************/
 
@@ -3066,7 +3066,7 @@ unsigned int ATI_API_CALL __ke_pci_get_func(__ke_pci_dev_t* pcidev)
 {
     struct pci_dev* dev = (struct pci_dev*)pcidev;
     return PCI_FUNC(dev->devfn);
-}    
+}
 
 __ke_dma_addr_t ATI_API_CALL __ke_pci_map_single (__ke_pci_dev_t *pdev, void *buffer, __ke_size_t size, int direction)
 {
@@ -3153,7 +3153,7 @@ static irqreturn_t ke_irq_handler_wrap(int irq, void *arg1)
     return IRQ_HANDLED;
 }
 #endif
-            
+
 int ATI_API_CALL __ke_request_irq(unsigned int irq,
     void (*ATI_API_CALL handler)(int, void *, void *),
     const char *dev_name, void *dev_id)
@@ -3166,7 +3166,7 @@ int ATI_API_CALL __ke_request_irq(unsigned int irq,
         SA_SHIRQ,
 #else
         IRQF_SHARED,
-#endif                
+#endif
         dev_name,
         dev_id);
 }
@@ -3203,12 +3203,12 @@ int ATI_API_CALL __ke_agp_memory_get_page_count(struct _agp_memory* agpmem)
     return (int)(agpmem->page_count);
 }
 
-void ATI_API_CALL __ke_agp_memory_get_memory(struct _agp_memory* agpmem, 
+void ATI_API_CALL __ke_agp_memory_get_memory(struct _agp_memory* agpmem,
                                              unsigned long **memory_ptr)
 {
     __KE_DEBUG("[%s] agpmem=0x%016lx agpmem->memory=0x%016lx [0]=0x%016x",
-               __FUNCTION__, 
-               (unsigned long)agpmem, 
+               __FUNCTION__,
+               (unsigned long)agpmem,
                (unsigned long)agpmem->memory,
                (agpmem->memory)[0]);
 
@@ -3217,18 +3217,9 @@ void ATI_API_CALL __ke_agp_memory_get_memory(struct _agp_memory* agpmem,
 
 /*****************************************************************************/
 
-#ifndef NOPAGE_SIGBUS
-#define NOPAGE_SIGBUS 0
-#endif /* !NOPAGE_SIGBUS */
-
 typedef struct page mem_map_t;
 typedef mem_map_t *vm_nopage_ret_t;
 
-static __inline__ vm_nopage_ret_t do_vm_nopage(struct vm_area_struct* vma,
-                                                     unsigned long address)
-{
-    return 0;   /* Disallow mremap */
-}
 
 #ifdef __AGP__BUILTIN__
 #ifdef __ia64__
@@ -3253,19 +3244,20 @@ static __inline__ vm_nopage_ret_t do_vm_cant_nopage(struct vm_area_struct* vma,
 			return page;
 		}
 	}
-	return NOPAGE_SIGBUS;		/* Disallow mremap */
+	return VM_FAULT_SIGBUS;		/* Disallow mremap */
 }
 
 #endif /* __ia64__ */
 #endif /* __AGP__BUILTIN__ */
 
 
-static __inline__ vm_nopage_ret_t do_vm_shm_nopage(struct vm_area_struct* vma,
-                                                   unsigned long address)
+static __inline__ int do_vm_shm_nopage(struct vm_area_struct* vma,
+				       struct vm_fault *vmf)
 {
     pgd_t* pgd_p;
     pmd_t* pmd_p;
     pte_t  pte;
+    unsigned long address = (unsigned long)vmf->virtual_address;
     unsigned long vma_offset;
     unsigned long pte_linear;
     mem_map_t* pMmPage;
@@ -3294,7 +3286,7 @@ static __inline__ vm_nopage_ret_t do_vm_shm_nopage(struct vm_area_struct* vma,
             (unsigned long)__ke_vm_offset(vma));
 
     if (address > vma->vm_end)
-        return NOPAGE_SIGBUS; /* address is out of range */
+        return VM_FAULT_SIGBUS; /* address is out of range */
 
     /*  Calculate offset into VMA */
     vma_offset = address - vma->vm_start;
@@ -3306,7 +3298,7 @@ static __inline__ vm_nopage_ret_t do_vm_shm_nopage(struct vm_area_struct* vma,
     pte_linear = firegl_get_addr_from_vm(vma);
     if (!pte_linear)
     {
-        return NOPAGE_SIGBUS; /* bad address */
+        return VM_FAULT_SIGBUS; /* bad address */
     }
     pte_linear += vma_offset;
 
@@ -3334,7 +3326,9 @@ static __inline__ vm_nopage_ret_t do_vm_shm_nopage(struct vm_area_struct* vma,
 
     //  __KE_DEBUG3("vm-address 0x%08lx => kernel-page-address 0x%p\n",
     //    address, page_address(pMmPage));
-    return pMmPage;
+    vmf->page = pMmPage;
+
+    return 0;
 }
 
 /*
@@ -3343,8 +3337,10 @@ static __inline__ vm_nopage_ret_t do_vm_shm_nopage(struct vm_area_struct* vma,
       (which is one ore more pages in size)
 
 */
-static __inline__ vm_nopage_ret_t do_vm_dma_nopage(struct vm_area_struct* vma, unsigned long address)
+static __inline__ int do_vm_dma_nopage(struct vm_area_struct* vma,
+				       struct vm_fault *vmf)
 {
+    unsigned long address = (unsigned long) vmf->virtual_address;
     unsigned long kaddr;
     mem_map_t* pMmPage;
 
@@ -3360,7 +3356,7 @@ static __inline__ vm_nopage_ret_t do_vm_dma_nopage(struct vm_area_struct* vma, u
     kaddr = firegl_get_addr_from_vm(vma);
     if (!kaddr)
     {
-        return NOPAGE_SIGBUS; /* bad address */
+        return VM_FAULT_SIGBUS; /* bad address */
     }
     kaddr += (address - vma->vm_start);
 
@@ -3372,19 +3368,23 @@ static __inline__ vm_nopage_ret_t do_vm_dma_nopage(struct vm_area_struct* vma, u
     // with drm_alloc_pages, which marks all pages as reserved. Reserved
     // pages' usage count is not decremented by the kernel during unmap!!!
     //
-    // For kernel >= 2.6.15, We should reenable this, because the VM sub-system 
-    // will decrement the pages' usage count even for the pages marked as reserved 
+    // For kernel >= 2.6.15, We should reenable this, because the VM sub-system
+    // will decrement the pages' usage count even for the pages marked as reserved
     // 								- MC.
     get_page(pMmPage); /* inc usage count of page */
 #endif
 
     __KE_DEBUG3("vm-address 0x%08lx => kernel-page-address 0x%p\n",
         address, page_address(pMmPage));
-    return pMmPage;
+    vmf->page = pMmPage;
+
+    return 0;
 }
 
-static __inline__ vm_nopage_ret_t do_vm_kmap_nopage(struct vm_area_struct* vma, unsigned long address)
+static __inline__ int do_vm_kmap_nopage(struct vm_area_struct* vma,
+					struct vm_fault *vmf)
 {
+    unsigned long address = (unsigned long) vmf->virtual_address;
     unsigned long kaddr;
     mem_map_t* pMmPage;
 
@@ -3394,13 +3394,14 @@ static __inline__ vm_nopage_ret_t do_vm_kmap_nopage(struct vm_area_struct* vma,
     if ((pMmPage = (mem_map_t*) firegl_get_pagetable_page_from_vm(vma)))
     {
         get_page(pMmPage);
-        return pMmPage;
+	vmf->page = pMmPage;
+        return 0;
     }
 
     kaddr = firegl_get_addr_from_vm(vma);
     if (!kaddr)
     {
-        return NOPAGE_SIGBUS; /* bad address */
+        return VM_FAULT_SIGBUS; /* bad address */
     }
     kaddr += (address - vma->vm_start);
 
@@ -3413,50 +3414,52 @@ static __inline__ vm_nopage_ret_t do_vm_kmap_nopage(struct vm_area_struct* vma,
 
     __KE_DEBUG3("vm-address 0x%08lx => kernel-page-address 0x%p\n", address, page_address(pMmPage));
 
-    return pMmPage;
+    vmf->page = pMmPage;
+    return 0;
 }
 
-/** 
+/**
  **
- **  This routine is intented to locate the page table through the 
+ **  This routine is intented to locate the page table through the
  **  pagelist table created earlier in dev-> pcie
  **/
-static __inline__ vm_nopage_ret_t do_vm_pcie_nopage(struct vm_area_struct* vma,
-                                                         unsigned long address)
+static __inline__ int do_vm_pcie_nopage(struct vm_area_struct* vma,
+					struct vm_fault *vmf)
 {
 
+    unsigned long address = (unsigned long)vmf->virtual_address;
     unsigned long vma_offset;
-    unsigned long i; 
+    unsigned long i;
     mem_map_t* pMmPage;
     struct firegl_pcie_mem* pciemem;
     unsigned long* pagelist;
-    
+
     drm_device_t *dev = (drm_device_t *)firegl_get_dev_from_vm(vma);
     if (dev == NULL)
     {
         __KE_ERROR("dev is NULL\n");
-        return NOPAGE_SIGBUS;
+        return VM_FAULT_SIGBUS;
     }
 
     if (address > vma->vm_end)
     {
         __KE_ERROR("address out of range\n");
-        return NOPAGE_SIGBUS; /* address is out of range */
+        return VM_FAULT_SIGBUS; /* address is out of range */
     }
     pciemem = firegl_get_pciemem_from_addr ( vma, address);
     if (pciemem == NULL)
     {
         __KE_ERROR("No pciemem found! \n");
-        return NOPAGE_SIGBUS;
-    }    
+        return VM_FAULT_SIGBUS;
+    }
     pagelist = firegl_get_pagelist_from_vm(vma);
 
-    if (pagelist == NULL) 
+    if (pagelist == NULL)
     {
         __KE_ERROR("No pagelist! \n");
-        return NOPAGE_SIGBUS;
+        return VM_FAULT_SIGBUS;
     }
-     
+
     /** Find offset in  vma */
     vma_offset = address - vma->vm_start;
     /** Which entry in the pagelist */
@@ -3468,15 +3471,17 @@ static __inline__ vm_nopage_ret_t do_vm_pcie_nopage(struct vm_area_struct* vma,
     if (page_address(pMmPage) == 0x0)
     {
         __KE_ERROR("Invalid page address\n");
-        return NOPAGE_SIGBUS;
+        return VM_FAULT_SIGBUS;
     }
-    return pMmPage;
+
+    vmf->page = pMmPage;
+    return 0;
 }
 
-static __inline__ vm_nopage_ret_t do_vm_gart_nopage(struct vm_area_struct* vma,
-                                                    unsigned long address)
+static __inline__ int do_vm_gart_nopage(struct vm_area_struct* vma,
+					struct vm_fault *vmf)
 {
-
+    unsigned long address = (unsigned long) vmf->virtual_address;
     unsigned long page_addr;
     unsigned long offset;
     struct page *page;
@@ -3484,36 +3489,31 @@ static __inline__ vm_nopage_ret_t do_vm_gart_nopage(struct vm_area_struct* vma,
     if (address > vma->vm_end)
     {
         __KE_ERROR("Invalid virtual address\n");
-        return NOPAGE_SIGBUS;   /* Disallow mremap */
-    }          
+        return VM_FAULT_SIGBUS;   /* Disallow mremap */
+    }
 
     offset      = address - vma->vm_start;
-#ifdef FIREGL_CF_SUPPORT    
+#ifdef FIREGL_CF_SUPPORT
     page_addr   = mc_heap_get_page_addr(vma, offset);
 #else
     page_addr   = firegl_cmmqs_get_pageaddr_from_vm(vma, offset);
-#endif    
+#endif
     if( !page_addr)
     {
         __KE_ERROR("Invalid page address\n");
-        return NOPAGE_SIGBUS;   /* Disallow mremap */
+        return VM_FAULT_SIGBUS;   /* Disallow mremap */
     }
     page        = virt_to_page(page_addr);
     get_page(page);
 
-    return page;
+    vmf->page = page;
+    return 0;
 }
 
-
-
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,0)
-
-static vm_nopage_ret_t vm_nopage(struct vm_area_struct* vma,
-                                 unsigned long address,
-                                 int *type)
+static int vm_nopage(struct vm_area_struct* vma,
+		     struct vm_fault *vmf)
 {
-    if (type) *type = VM_FAULT_MINOR;
-        return do_vm_nopage(vma, address);
+	return VM_FAULT_SIGBUS;
 }
 
 #ifdef __AGP__BUILTIN__
@@ -3545,91 +3545,10 @@ static vm_nopage_ret_t vm_cant_nopage(struct vm_area_struct* vma,
     (which is one or more pages in size)
 
  */
-static vm_nopage_ret_t vm_shm_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int *type)
-{
-    if (type) *type = VM_FAULT_MINOR;
-        return do_vm_shm_nopage(vma, address);
-}
-
-/*
-
-    This routine is intended to remap addresses of a OpenGL context
-      (which is one ore more pages in size)
-
-*/
-static vm_nopage_ret_t vm_dma_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int *type)
-{
-    if (type) *type = VM_FAULT_MINOR;
-        return do_vm_dma_nopage(vma, address);
-}
-
-static vm_nopage_ret_t vm_kmap_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int *type)
-{
-    if (type) *type = VM_FAULT_MINOR;
-        return do_vm_kmap_nopage(vma, address);
-}
-
-static vm_nopage_ret_t vm_pcie_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int *type)
-{  
-       return do_vm_pcie_nopage(vma, address);
-}
-
-static vm_nopage_ret_t vm_gart_nopage(struct vm_area_struct* vma,
-                                      unsigned long address, 
-                                      int *type)
-{
-       return do_vm_gart_nopage(vma, address);
-}
-
-#else   /* LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,0) */
-
-static vm_nopage_ret_t vm_nopage(struct vm_area_struct* vma,
-                                 unsigned long address,
-                                 int write_access)
-{
-    return do_vm_nopage(vma, address);
-}
-
-#ifdef __AGP__BUILTIN__
-#ifdef __ia64__
-
-
-static vm_nopage_ret_t vm_cant_nopage(struct vm_area_struct* vma,
-                                 unsigned long address,
-                                 int write_access)
-{
-    return do_vm_cant_nopage(vma, address);
-}
-#endif /* __ia64__ */
-#endif /* __AGP__BUILTIN__ */
-
-/*
-
-    This function is called when a page of a mmap()'ed area is not currently
-    visible in the specified VMA.
-    Return value is the associated physical address for the requested page.
-    (If not implemented, then the kernel default routine would allocate a new,
-     zeroed page for servicing us)
-
-    Possible errors: SIGBUS, OutOfMem
-
-    This routine is intended to remap addresses of SHM SAREA
-    (which is one or more pages in size)
-
- */
-static vm_nopage_ret_t vm_shm_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int write_access)
+static int vm_shm_nopage(struct vm_area_struct* vma,
+			 struct vm_fault *vmf)
 {
-    return do_vm_shm_nopage(vma, address);
+        return do_vm_shm_nopage(vma, vmf);
 }
 
 /*
@@ -3638,37 +3557,30 @@ static vm_nopage_ret_t vm_shm_nopage(struct vm_area_struct* vma,
       (which is one ore more pages in size)
 
 */
-static vm_nopage_ret_t vm_dma_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int write_access)
+static int vm_dma_nopage(struct vm_area_struct* vma,
+			 struct vm_fault *vmf)
 {
-     return do_vm_dma_nopage(vma, address);
+        return do_vm_dma_nopage(vma, vmf);
 }
 
-static vm_nopage_ret_t vm_kmap_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int write_access)
+static int vm_kmap_nopage(struct vm_area_struct* vma,
+			  struct vm_fault *vmf)
 {
-     return do_vm_kmap_nopage(vma, address);
+        return do_vm_kmap_nopage(vma, vmf);
 }
 
-static vm_nopage_ret_t vm_pcie_nopage(struct vm_area_struct* vma,
-                                     unsigned long address,
-                                     int write_access)
+static int vm_pcie_nopage(struct vm_area_struct* vma,
+			  struct vm_fault *vmf)
 {
-        return do_vm_pcie_nopage(vma, address);
+	return do_vm_pcie_nopage(vma, vmf);
 }
 
-static vm_nopage_ret_t vm_gart_nopage(struct vm_area_struct* vma,
-                                      unsigned long address, 
-                                      int *type)
+static int vm_gart_nopage(struct vm_area_struct* vma,
+			  struct vm_fault *vmf)
 {
-       return do_vm_gart_nopage(vma, address);
+       return do_vm_gart_nopage(vma, vmf);
 }
 
-
-#endif /* LINUX_VERSION_CODE > KERNEL_VERSION(2,6,0) */
-
 void* ATI_API_CALL __ke_vma_file_priv(struct vm_area_struct* vma)
 {
     return vma->vm_file->private_data;
@@ -3718,7 +3630,7 @@ char* ATI_API_CALL __ke_vm_page_prot_str(struct vm_area_struct* vma, char* buf)
     *(buf + i++) = pgprot & _PAGE_DIRTY    ? 'd' : '-';
     *(buf + i++) = pgprot & _PAGE_PSE      ? 'm' : 'k';
     *(buf + i++) = pgprot & _PAGE_GLOBAL   ? 'g' : 'l';
-#endif /* __i386__ */		
+#endif /* __i386__ */
     *(buf + i++) = 0;
 
     return buf;
@@ -3747,9 +3659,9 @@ char *__ke_pte_phys_addr_str(pte_t pte, char *buf, __ke_dma_addr_t* phys_address
     return buf;
 }
 
-char* ATI_API_CALL __ke_vm_phys_addr_str(struct vm_area_struct* vma, 
-                            char* buf, 
-                            unsigned long virtual_addr, 
+char* ATI_API_CALL __ke_vm_phys_addr_str(struct vm_area_struct* vma,
+                            char* buf,
+                            unsigned long virtual_addr,
                             __ke_dma_addr_t* phys_address)
 {
     pgd_t* pgd_p;
@@ -3773,7 +3685,7 @@ void ip_drm_vm_close(struct vm_area_struct* vma)
 
 static struct vm_operations_struct vm_ops =
 {
-    nopage:  vm_nopage,
+    fault:   vm_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
@@ -3791,42 +3703,42 @@ static struct vm_operations_struct vm_cant_ops =
 
 static struct vm_operations_struct vm_shm_ops =
 {
-    nopage:  vm_shm_nopage,
+    fault:   do_vm_shm_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
 
 static struct vm_operations_struct vm_pci_bq_ops =
 {
-    nopage:  vm_dma_nopage,
+    fault:   vm_dma_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
 
 static struct vm_operations_struct vm_ctx_ops =
 {
-    nopage:  vm_dma_nopage,
+    fault:   vm_dma_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
 
-static struct vm_operations_struct vm_pcie_ops = 
+static struct vm_operations_struct vm_pcie_ops =
 {
-    nopage:  vm_pcie_nopage,
+    fault:   vm_pcie_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
 
 static struct vm_operations_struct vm_kmap_ops =
 {
-    nopage:  vm_kmap_nopage,
+    fault:   vm_kmap_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
 
 static struct vm_operations_struct vm_gart_ops =
 {
-    nopage:  vm_gart_nopage,
+    fault:   vm_gart_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
@@ -3835,14 +3747,14 @@ static struct vm_operations_struct vm_gart_ops =
 #ifndef __ia64__
 static struct vm_operations_struct vm_agp_bq_ops =
 {
-    nopage:  vm_nopage,
+    fault:   vm_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
-#else		
+#else
 static struct vm_operations_struct vm_cant_agp_bq_ops =
 {
-    nopage:  vm_cant_nopage,
+    fault:   vm_cant_nopage,
     open:    ip_drm_vm_open,
     close:   ip_drm_vm_close,
 };
@@ -3877,19 +3789,19 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
 #ifdef __i386__
                 if (boot_cpu_data.x86 > 3)
                 {
-#ifdef FIREGL_USWC_SUPPORT                
+#ifdef FIREGL_USWC_SUPPORT
                     if (!firegl_pat_enabled)
-#endif                    
+#endif
                     {
                         pgprot_val(vma->vm_page_prot) |= _PAGE_PCD;
                         pgprot_val(vma->vm_page_prot) &= ~_PAGE_PWT;
                     }
-#ifdef FIREGL_USWC_SUPPORT                    
+#ifdef FIREGL_USWC_SUPPORT
                     else
                     {
                         vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-                    }    
-#endif                    
+                    }
+#endif
                 }
 #endif /* __i386__ */
 #ifdef __ia64__
@@ -3908,7 +3820,7 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
             }
 			break;
 
-#ifdef FIREGL_USWC_SUPPORT                
+#ifdef FIREGL_USWC_SUPPORT
         case __KE_ADPT_REG:
 			{
 #ifdef __ia64__
@@ -3928,7 +3840,7 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
                     }
                     else
                     {
-                        vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot); 
+                        vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
                     }
                 }
 #endif /* __i386__ */
@@ -3947,7 +3859,7 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
             vma->vm_ops = &vm_ops;
             }
 			break;
-#endif                    
+#endif
 
         case __KE_SHM:
             vma->vm_flags |= VM_SHM | VM_RESERVED; /* Don't swap */
@@ -3981,7 +3893,7 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
 
 #ifdef __AGP__BUILTIN__
         case __KE_AGP:
-            // if(dev->agp->cant_use_aperture == 1) 
+            // if(dev->agp->cant_use_aperture == 1)
 #ifdef __ia64__
             {
                 /*
@@ -4005,9 +3917,9 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
                     if( firegl_pat_enabled )
                     {
                         vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-                    }    
+                    }
                 }
-#endif                
+#endif
 
                 if (REMAP_PAGE_RANGE(vma,offset))
                 {
@@ -4024,8 +3936,8 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
 #endif
             break;
         case __KE_AGP_BQS:
-            // if(dev->agp->cant_use_aperture == 1) 
-#ifdef __ia64__			
+            // if(dev->agp->cant_use_aperture == 1)
+#ifdef __ia64__
             {
                 /*
                  * On some systems we can't talk to bus dma address from
@@ -4048,9 +3960,9 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
                     if( firegl_pat_enabled )
                     {
                        vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-                    }   
+                    }
                 }
-#endif                
+#endif
 
                 if (REMAP_PAGE_RANGE(vma,offset))
                 {
@@ -4079,15 +3991,15 @@ int ATI_API_CALL __ke_vm_map(struct file* filp,
             break;
 
          case __KE_GART_USWC:
-#ifdef FIREGL_USWC_SUPPORT         
+#ifdef FIREGL_USWC_SUPPORT
             if (boot_cpu_data.x86 > 3)
             {
                 if( firegl_pat_enabled )
                 {
                     vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-                }    
+                }
             }
-#endif            
+#endif
             // fall through
          case __KE_GART_CACHEABLE:
              vma->vm_flags |= VM_RESERVED;
@@ -4137,7 +4049,7 @@ extern struct _agp_memory *_X(agp_allocate_memory_phys_list)(size_t, u32, u64 *)
 #define FIREGL_agp_backend_release  _X(agp_backend_release)
 #define FIREGL_agp_memory           _X(agp_memory)
 
-unsigned int __ke_firegl_agpgart_inuse = AGPGART_INUSE_NONE;				
+unsigned int __ke_firegl_agpgart_inuse = AGPGART_INUSE_NONE;
 
 #if defined(CONFIG_AGP) || defined(CONFIG_AGP_MODULE)
 /*****************************************************************************/
@@ -4252,7 +4164,7 @@ static
 int ATI_API_CALL __ke_agpgart_available(__ke_pci_dev_t *pcidev, int use_internal)
 {
     drm_agp_module_stub = &drm_agp;
-    __ke_firegl_agpgart_inuse = KERNEL26_AGPGART_INUSE;	
+    __ke_firegl_agpgart_inuse = KERNEL26_AGPGART_INUSE;
     {
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,12)
         firegl_pci_device = (struct pci_dev*)(void*)pcidev;
@@ -4305,7 +4217,7 @@ int ATI_API_CALL __ke_agp_available(__ke_pci_dev_t *pcidev, int use_internal)
     } else {
          available = __ke_firegl_agpgart_available();
     }
-	
+
     return available;
 }
 
@@ -4410,7 +4322,7 @@ void ATI_API_CALL __ke_agp_copy_info(__ke_agp_kern_info_t* info)
 
     if (AGP_AVAILABLE(copy_info))
     {
-        struct agp_kern_info kern;    
+        struct agp_kern_info kern;
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,12)
         if (firegl_agp_bridge == NULL)
@@ -4508,7 +4420,7 @@ int ATI_API_CALL __ke_agp_enable(unsigned long mode)
 
 int ATI_API_CALL __ke_read_agp_caps_registers(__ke_pci_dev_t* dev, unsigned int *caps)
 {
-    return -EINVAL;	
+    return -EINVAL;
 }
 
 int ATI_API_CALL __ke_agp_acquire(__ke_pci_dev_t* dev)
@@ -4550,9 +4462,9 @@ int ATI_API_CALL __ke_smp_processor_id(void)
 
 /** \brief Runs a function on all other CPUs
  *  \param func_to_call function to be called on all other cpus
- *  \return None 
+ *  \return None
  */
-void ATI_API_CALL KCL_CallFuncOnOtherCpus(firegl_void_routine_t func_to_call) 
+void ATI_API_CALL KCL_CallFuncOnOtherCpus(firegl_void_routine_t func_to_call)
 {
 #ifdef CONFIG_SMP
 	smp_call_function( firegl_smp_func_parameter_wrap, (void*)func_to_call, 0, 1 );
@@ -4659,7 +4571,7 @@ int ATI_API_CALL __ke_has_PSE(void)
 
 int ATI_API_CALL KCL_is_pat_enabled(void)
 {
-   return firegl_pat_enabled; 
+   return firegl_pat_enabled;
 }
 
 static int ATI_API_CALL KCL_has_pat(void)
@@ -4675,7 +4587,7 @@ static void KCL_setup_pat(void *info)
 {
     unsigned long cr0=0, cr4=0;
     unsigned long flags;
-  
+
     local_irq_save(flags);
     cr0 = read_cr0() | 0x40000000;
     write_cr0(cr0);
@@ -4706,7 +4618,7 @@ static void  KCL_restore_pat(void *info)
 {
     unsigned long cr0 = 0, cr4 = 0;
     unsigned long flags;
-  
+
     local_irq_save(flags);
     cr0 = read_cr0() | 0x40000000;
     write_cr0(cr0);
@@ -4718,7 +4630,7 @@ static void  KCL_restore_pat(void *info)
        write_cr4(cr4 & ~X86_CR4_PGE);
     }
      __flush_tlb();
-  
+
     wrmsr(MSR_IA32_CR_PAT,  KCL_orig_pat[0], KCL_orig_pat[1]);
 
     cr0 = read_cr0();
@@ -4741,7 +4653,7 @@ static int ATI_API_CALL KCL_enable_pat(void)
          __KE_INFO("USWC is disabled in module parameters\n");
          return 0;
      }
-     
+
      if (!KCL_has_pat())
      {
         return 0;
@@ -4751,13 +4663,13 @@ static int ATI_API_CALL KCL_enable_pat(void)
 
      for ( i = 0; i < 2; i++ )
      {
-        for (j = 0; j < 4; j ++)    
+        for (j = 0; j < 4; j ++)
         {
             if (((KCL_orig_pat[i] >> (j * 8)) & 0xFF) == 1)
-            { 
+            {
                __KE_ERROR("Pat entry %d is already configured\n", (i+1)*(j+1));
                return 0;
-            } 
+            }
         }
     }
 
@@ -4829,7 +4741,7 @@ typedef struct tag_kasContext_t
 } kasContext_t;
 
 /** \brief KAS context */
-static kasContext_t kasContext; 
+static kasContext_t kasContext;
 
 /** \brief Kernel support required to enable KAS */
 #if defined(cmpxchg)                        && \
@@ -5137,7 +5049,7 @@ unsigned int ATI_API_CALL KAS_Ih_Execute(KAS_IhRoutine_t ih_routine,
     DBG_TRACE("Interrupt handler returned 0x%08X", ret);
 
     kasSetExecutionLevel(orig_level);
-    spin_unlock(&kasContext.lock_ih); 
+    spin_unlock(&kasContext.lock_ih);
 
     DBG_LEAVE("%d", ret);
     return ret;
@@ -5412,7 +5324,7 @@ typedef struct tag_kasSlabCache_t
 #endif
     spinlock_t lock;            /* OS spinlock object protecting the cache */
     unsigned int routine_type;  /* Type of routine the cache might be accessed from */
-    char name[14];              /* Cache object name (kernel 2.4 restricts its length to 19 chars) */
+    char name[24];              /* Cache object name (kernel 2.4 restricts its length to 19 chars) */
 } kasSlabCache_t;
 
 /** \brief Return Slab Cache object size
@@ -5450,7 +5362,8 @@ unsigned int ATI_API_CALL KAS_SlabCache_Initialize(void* hSlabCache,
 
     slabcache_obj->routine_type = access_type;
     spin_lock_init(&(slabcache_obj->lock));
-    sprintf(slabcache_obj->name, "kas(%08lX)",(unsigned long)slabcache_obj);
+    snprintf(slabcache_obj->name, sizeof(slabcache_obj->name),
+		"kas(%p)", slabcache_obj);
 
     DBG_TRACE("creating slab object '%s'", slabcache_obj->name);
 
@@ -6366,7 +6279,7 @@ unsigned int ATI_API_CALL KAS_AtomicAddInt(
 
     kas_xadd(puiDestination, iAdd, ret, "l");
 
-    return ret + iAdd; 
+    return ret + iAdd;
 #else
     return 0xDEADC0DE; /* To make compiler happy */
 #endif
@@ -6449,7 +6362,7 @@ long ATI_API_CALL KAS_ScheduleTimeout(long n_jiffies)
 #ifdef FIREGL_CF_SUPPORT
 
 void *ATI_API_CALL KCL_lock_init()
-{   
+{
     spinlock_t *lock;
 
     lock = kmalloc(sizeof(*lock), GFP_KERNEL);
@@ -6461,7 +6374,7 @@ void *ATI_API_CALL KCL_lock_init()
 }
 
 void ATI_API_CALL KCL_lock_deinit(void *plock)
-{   
+{
     if (plock == NULL)
     {
         __KE_ERROR("plock is NULL\n");
diff --git a/firegl_public.h b/firegl_public.h
index fc49d6e..8cc18ed 100644
--- a/firegl_public.h
+++ b/firegl_public.h
@@ -78,7 +78,7 @@ do { \
     if (!pgd_present(*(pgd_p)))	\
     { \
         __KE_ERROR("FATAL ERROR: User queue buffer not present! (pgd)\n"); \
-        return (unsigned long)NOPAGE_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
+        return VM_FAULT_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
         /* alternatively we could generate a NOPAGE_OOM "out of memory" */ \
     } \
 } while(0)
@@ -91,7 +91,7 @@ do { \
     if (!pud_present(*(pud_p)))	\
     { \
         __KE_ERROR("FATAL ERROR: User queue buffer not present! (pud)\n"); \
-        return (unsigned long)NOPAGE_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
+        return VM_FAULT_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
         /* alternatively we could generate a NOPAGE_OOM "out of memory" */ \
     } \
     pmd_p = pmd_offset(pud_p, pte_linear); \
@@ -111,7 +111,7 @@ do { \
     if (!pmd_present(*(pmd_p)))	\
     { \
         __KE_ERROR("FATAL ERROR: User queue buffer not present! (pmd)\n"); \
-        return (unsigned long)NOPAGE_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
+        return VM_FAULT_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
         /* alternatively we could generate a NOPAGE_OOM "out of memory" */ \
     } \
 } while(0)
@@ -157,7 +157,7 @@ do { \
     if (!pte_present(pte)) \
     { \
         __KE_ERROR("FATAL ERROR: User queue buffer not present! (pte)\n"); \
-        return (unsigned long)NOPAGE_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
+        return VM_FAULT_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
         /* alternatively we could generate a NOPAGE_OOM "out of memory" */ \
     } \
 } while(0)
-- 
1.5.6.rc2.45.gdc92c
EOT
cd -
fi

[ "$VER" = "8-7" ] && patch -p1 <<'EOT'
diff -Nru 8-7/packages/Ubuntu/dists/intrepid/dkms.conf.in 8-7.hotfix/packages/Ubuntu/dists/intrepid/dkms.conf.in
--- 8-7/packages/Ubuntu/dists/intrepid/dkms.conf.in	2008-07-16 21:10:32.000000000 +0200
+++ 8-7.hotfix/packages/Ubuntu/dists/intrepid/dkms.conf.in	2008-08-18 23:29:24.000000000 +0200
@@ -5,3 +5,9 @@
 MAKE[0]="pushd ${dkms_tree}/fglrx/#CVERSION#/build; sh make.sh --nohints --uname_r=$kernelver; popd"
 DEST_MODULE_LOCATION[0]="/kernel/drivers/char/drm"
 AUTOINSTALL="yes"
+PATCH[0]="2.6.26_support.patch"
+PATCH_MATCH[0]="^2.6.2[6-9]"
+PATCH[1]="2.6.27_support.patch"
+PATCH_MATCH[1]="^2.6.2[7-9]"
+PATCH[2]="2.6.27_sysrq_key_disable.patch"
+PATCH_MATCH[2]="^2.6.2[7-9]"
diff -Nru 8-7/packages/Ubuntu/dists/intrepid/fglrx-kernel-source.install.in 8-7.hotfix/packages/Ubuntu/dists/intrepid/fglrx-kernel-source.install.in
--- 8-7/packages/Ubuntu/dists/intrepid/fglrx-kernel-source.install.in	2008-07-16 21:10:32.000000000 +0200
+++ 8-7.hotfix/packages/Ubuntu/dists/intrepid/fglrx-kernel-source.install.in	2008-08-18 23:28:18.000000000 +0200
@@ -9,3 +9,4 @@
 debian/replacements/*				usr/src/fglrx-#CVERSION#
 arch/#ARCH#/lib/modules/fglrx/build_mod/lib*    usr/src/fglrx-#CVERSION#
 debian/dkms.conf                                usr/src/fglrx-#CVERSION#
+debian/patches					usr/src/fglrx-#CVERSION#
diff -Nru 8-7/packages/Ubuntu/dists/intrepid/patches/2.6.26_support.patch 8-7.hotfix/packages/Ubuntu/dists/intrepid/patches/2.6.26_support.patch
--- 8-7/packages/Ubuntu/dists/intrepid/patches/2.6.26_support.patch	1970-01-01 01:00:00.000000000 +0100
+++ 8-7.hotfix/packages/Ubuntu/dists/intrepid/patches/2.6.26_support.patch	2008-08-18 23:28:18.000000000 +0200
@@ -0,0 +1,1632 @@
+#This patch enables 2.6.26 support until AMD officially supports it.
+#It is originally by   Zilvina Valinskas <zilvinas@ilibox.com>
+#and adapted for AMD's 8-6 driver by Mario Limonciello <Mario_Limonciello@Dell.com>
+
+diff -Nur -x '*.orig' -x '*~' fglrx-installer-8.512/lib/modules/fglrx/build_mod/firegl_public.c fglrx-installer-8.512.new/lib/modules/fglrx/build_mod/firegl_public.c
+--- build_mod/firegl_public.c	2008-07-21 14:32:08.000000000 -0400
++++ fglrx-installer-8.512.new/lib/modules/fglrx/build_mod/firegl_public.c	2008-07-21 14:31:48.000000000 -0400
+@@ -24,13 +24,13 @@
+ // ============================================================
+ #include <linux/version.h>
+ 
+-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0) 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
+ #error Kernel versions older than 2.6.0 are no longer supported by this module.
+-#endif 
++#endif
+ 
+ #include <linux/autoconf.h>
+ 
+-#if !defined(CONFIG_X86_PC) 
++#if !defined(CONFIG_X86_PC)
+ #if !defined(CONFIG_X86_64)
+ #if !defined(CONFIG_X86_VOYAGER)
+ #if !defined(CONFIG_X86_NUMAQ)
+@@ -62,10 +62,10 @@
+  * distribution would even include such a kernel patch. */
+ #ifdef CONFIG_MEM_MIRROR
+ /* Prevent asm/mm_track.h from being included in subsequent
+- * kernel headers as that would redefine CONFIG_MEM_MIRROR. */ 
++ * kernel headers as that would redefine CONFIG_MEM_MIRROR. */
+ #ifndef CONFIG_X86_64
+ #define __I386_MMTRACK_H__
+-#define mm_track(ptep)                 
++#define mm_track(ptep)
+ #else
+ #define __X86_64_MMTRACK_H__
+ #define mm_track_pte(ptep)
+@@ -93,7 +93,7 @@
+ #include <linux/kernel.h>
+ #include <linux/fs.h>
+ #include <linux/proc_fs.h>
+-#include <linux/init.h>
++//#include <linux/init.h>
+ #include <linux/file.h>
+ #include <linux/pci.h>
+ #include <linux/wait.h>
+@@ -151,8 +151,8 @@
+ #include "linux/freezer.h"
+ #endif
+ 
+-//  For 2.6.18 or higher, the UTS_RELEASE is defined in the linux/utsrelease.h. 
+-#ifndef UTS_RELEASE 
++//  For 2.6.18 or higher, the UTS_RELEASE is defined in the linux/utsrelease.h.
++#ifndef UTS_RELEASE
+ #include <linux/utsrelease.h>
+ #endif
+ 
+@@ -215,7 +215,7 @@
+ 
+ static void ATI_API_CALL __ke_printstr(const char *str);
+ 
+-static struct pci_device_id fglrx_pci_table[] = 
++static struct pci_device_id fglrx_pci_table[] =
+ {
+ #define FGL_ASIC_ID(x)                      \
+    {                           \
+@@ -283,7 +283,7 @@
+ 
+ static int firegl_pat_enabled = 0;
+ static unsigned long KCL_pat[2];
+-static unsigned long KCL_orig_pat[2]; 
++static unsigned long KCL_orig_pat[2];
+ 
+ static int ATI_API_CALL KCL_enable_pat(void);
+ static void ATI_API_CALL KCL_disable_pat(void);
+@@ -322,7 +322,7 @@
+ #endif
+ 
+ __ke_ssize_t ip_firegl_read( struct file *filp,
+-                         char *buf, 
++                         char *buf,
+                          __ke_size_t size,
+                          __ke_loff_t *off_ptr)
+ {
+@@ -334,7 +334,7 @@
+ }
+ 
+ __ke_ssize_t ip_firegl_write( struct file *filp,
+-                          const char *buf, 
++                          const char *buf,
+                           __ke_size_t size,
+                           __ke_loff_t *off_ptr)
+ {
+@@ -477,34 +477,34 @@
+     return firegl_debug_proc_write(file, buffer, count, data);     
+ }
+ 
+-static int 
++static int
+ firegl_interrupt_open_wrap(
+-        struct inode *inode, 
+-        struct file *file) 
++        struct inode *inode,
++        struct file *file)
+ {
+     return firegl_interrupt_open(inode, file);
+ }
+ 
+-static int 
++static int
+ firegl_interrupt_release_wrap(
+-        struct inode *inode, 
+-        struct file *file) 
++        struct inode *inode,
++        struct file *file)
+ {
+     return firegl_interrupt_release(inode, file);
+ }
+ 
+-static ssize_t 
++static ssize_t
+ firegl_interrupt_read_wrap(
+-        struct file *user_file, 
+-        char __user *user_buf, 
+-        size_t user_buf_size, 
++        struct file *user_file,
++        char __user *user_buf,
++        size_t user_buf_size,
+         loff_t *user_file_pos)
+ {
+     return (ssize_t) firegl_interrupt_read(user_file, user_buf, user_buf_size, user_file_pos);
+ }
+ 
+-static unsigned int 
+-firegl_interrupt_poll_wrap(struct file *user_file, poll_table *pt) 
++static unsigned int
++firegl_interrupt_poll_wrap(struct file *user_file, poll_table *pt)
+ {
+     if(firegl_interrupt_poll(user_file, (__ke_poll_table*)pt))
+     {
+@@ -516,11 +516,11 @@
+     }
+ }
+ 
+-static ssize_t 
++static ssize_t
+ firegl_interrupt_write_wrap(
+-        struct file *user_file, 
+-        const char __user *user_buf, 
+-        size_t user_buf_size, 
++        struct file *user_file,
++        const char __user *user_buf,
++        size_t user_buf_size,
+         loff_t *user_file_pos)
+ {
+     return (ssize_t) firegl_interrupt_write(user_file, user_buf, user_buf_size, user_file_pos);
+@@ -530,7 +530,7 @@
+  *  \param func function to be wrapped
+  *  \return None */
+ 
+-static void 
++static void
+ firegl_smp_func_parameter_wrap(
+ void *func)
+ {
+@@ -545,7 +545,7 @@
+     .write      = firegl_interrupt_write_wrap
+ };
+ 
+-__ke_proc_list_t firegl_proc_list[] = 
++__ke_proc_list_t firegl_proc_list[] =
+ {
+     { "name",           drm_name_info_wrap,         NULL},
+     { "mem",            drm_mem_info_wrap,          NULL},
+@@ -613,11 +613,11 @@
+         {
+ 		    ent->proc_fops = (struct file_operations*)list->fops;
+         }
+-       
++
+         {
+             ent->data = (dev->pubdev.signature == FGL_DEVICE_SIGNATURE)? firegl_find_device(minor) : (dev);
+         }
+-        
++
+         list++;
+ 	}
+ 
+@@ -663,7 +663,7 @@
+     {
+         remove_proc_entry("dri", NULL);
+         __KE_DEBUG("remove proc dri. \n");
+-    }    
++    }
+     return 0;
+ }
+ 
+@@ -701,12 +701,12 @@
+ {
+ 	int i;
+         int count = 0;
+-        
++
+         __KE_DEBUG("firegl_stub_getminor: name=\"%s\"\n", name);
+ 
+-	for( i = 0; i < FIREGL_STUB_MAXCARDS; i++ ) 
++	for( i = 0; i < FIREGL_STUB_MAXCARDS; i++ )
+         {
+-	    if( !firegl_stub_list[i].fops ) 
++	    if( !firegl_stub_list[i].fops )
+             {
+ 		firegl_stub_list[i].name = name;
+ 		firegl_stub_list[i].fops = fops;
+@@ -733,16 +733,16 @@
+     if (minor < 0 || minor >= FIREGL_STUB_MAXCARDS)
+     {
+         return -1;
+-    }    
++    }
+     firegl_proc_cleanup(minor, firegl_stub_root, firegl_stub_list[minor].dev_root, firegl_stub_list[minor].proclist);
+     firegl_stub_list[minor].name = NULL;
+     firegl_stub_list[minor].fops = NULL;
+     firegl_stub_list[minor].proclist = NULL;
+ 
+-    if( minor == (firegl_minors-1) ) 
++    if( minor == (firegl_minors-1) )
+     {
+         unregister_chrdev(DRM_MAJOR, "drm");
+-    }   
++    }
+     return 0;
+ }
+ 
+@@ -766,7 +766,7 @@
+         return -1;
+     } else if(err == -EBUSY) {
+ 
+-        // the registering of the module's device has failed 
++        // the registering of the module's device has failed
+         // because there was already some other drm module loaded.
+         __KE_DEBUG("register_chrdev() failed with -EBUSY\n");
+ 	return -1;
+@@ -798,7 +798,7 @@
+ /* Starting from 2.6.14, kernel has new struct defined for pm_message_t,
+    we have to handle this case separately.
+    2.6.11/12/13 kernels have pm_message_t defined as int and older kernels
+-   don't have pm_message_t defined. 
++   don't have pm_message_t defined.
+  */
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,14)
+ static int fglrx_pci_suspend(struct pci_dev *pdev, pm_message_t pm_event)
+@@ -834,9 +834,9 @@
+ 
+     if (!ret)
+     {
+-        
+-    // since privdev->pcidev is acquired in X server, use pdev 
+-    // directly here to allow suspend/resume without X server start. 
++
++    // since privdev->pcidev is acquired in X server, use pdev
++    // directly here to allow suspend/resume without X server start.
+         firegl_pci_save_state((__ke_pci_dev_t*)pdev, privdev);
+         pci_disable_device(pdev);
+         PMSG_EVENT(pdev->dev.power.power_state) = state;
+@@ -888,13 +888,13 @@
+     // before pci_set_master!
+     firegl_pci_restore_state((__ke_pci_dev_t*)pdev, privdev);
+ 
+-    if (pci_enable_device(pdev)) 
++    if (pci_enable_device(pdev))
+     {
+         __KE_ERROR("Cannot enable PCI device.\n");
+-    }    
++    }
+ 
+     pci_set_master(pdev);
+- 
++
+     firegl_cail_powerup(privdev);
+ 
+     if (PMSG_EVENT(pdev->dev.power.power_state) == PM_EVENT_SUSPEND)
+@@ -905,7 +905,7 @@
+     return 0;
+ }
+ 
+-static struct pci_driver fglrx_pci_driver = 
++static struct pci_driver fglrx_pci_driver =
+ {
+     .name           = "fglrx_pci",
+     .id_table       = fglrx_pci_table,
+@@ -961,10 +961,10 @@
+     {
+         pid = (struct pci_device_id *) &fglrx_pci_table[i];
+         pdev = NULL;
+-        while (( pdev = pci_get_subsys(pid->vendor, 
+-                                       pid->device, 
+-                                       PCI_ANY_ID, 
+-                                       PCI_ANY_ID, 
++        while (( pdev = pci_get_subsys(pid->vendor,
++                                       pid->device,
++                                       PCI_ANY_ID,
++                                       PCI_ANY_ID,
+                                        pdev)) != NULL)
+         {
+             num_of_devices++;
+@@ -974,7 +974,7 @@
+ 
+     if (firegl_init_device_heads(num_of_devices))
+     {
+-        return -ENOMEM;     
++        return -ENOMEM;
+     }
+ 
+     for (i=0; fglrx_pci_table[i].vendor != 0; i++)
+@@ -982,15 +982,15 @@
+         pid = (struct pci_device_id *) &fglrx_pci_table[i];
+ 
+         pdev = NULL;
+-        while (( pdev = pci_get_subsys(pid->vendor, 
+-                                       pid->device, 
+-                                       PCI_ANY_ID, 
+-                                       PCI_ANY_ID, 
++        while (( pdev = pci_get_subsys(pid->vendor,
++                                       pid->device,
++                                       PCI_ANY_ID,
++                                       PCI_ANY_ID,
+                                        pdev)) != NULL)
+         {
+             if ((ret_code = firegl_get_dev(pubdev, pdev)))
+             {
+-                return ret_code; 
++                return ret_code;
+             }
+ 
+             j++;
+@@ -1023,7 +1023,7 @@
+     // init global vars that are in fact constants
+     __ke_HZ = HZ;
+ 
+-#ifdef _KE_SERIAL_DEBUG  
++#ifdef _KE_SERIAL_DEBUG
+     __ke_SetSerialPort();
+ #endif
+ 
+@@ -1035,11 +1035,11 @@
+         return retcode;
+     }
+ 
+-#ifdef FIREGL_CF_SUPPORT    
++#ifdef FIREGL_CF_SUPPORT
+     adapter_chain_init();
+     cf_object_init();
+-#endif    
+-     
++#endif
++
+     // init DRM proc list
+     drm_proclist = kmalloc((DRM_PROC_ENTRIES + 1) * sizeof(__ke_proc_list_t), GFP_KERNEL);
+     if ( drm_proclist == NULL )
+@@ -1127,7 +1127,7 @@
+ 	        dev->pubdev.date,
+ 		    firegl_minors);
+ 
+-    
++
+ #ifdef FIREGL_POWER_MANAGEMENT
+     if (pci_register_driver (&fglrx_pci_driver) < 0)
+     {
+@@ -1157,12 +1157,12 @@
+     {
+        KCL_disable_pat();
+        __KE_INFO("Disable PAT\n");
+-    }   
++    }
+ #endif // FIREGL_USWC_SUPPORT
+ 
+     for (i = 0; i < count; i++)
+     {
+-        if ( firegl_stub_unregister(i) ) 
++        if ( firegl_stub_unregister(i) )
+         {
+             __KE_ERROR("Cannot unload module on minor: %d\n", i);
+         }
+@@ -1184,10 +1184,10 @@
+ 	        dev->pubdev.patchlevel,
+ 	        dev->pubdev.date);
+ 
+-#ifdef FIREGL_CF_SUPPORT    
++#ifdef FIREGL_CF_SUPPORT
+     cf_object_cleanup();
+-    adapter_chain_cleanup();    
+-#endif // FIREGL_CF_SUPPORT   
++    adapter_chain_cleanup();
++#endif // FIREGL_CF_SUPPORT
+ 
+     firegl_private_cleanup (&dev->pubdev);
+ 
+@@ -1265,18 +1265,18 @@
+ void ATI_API_CALL __ke_remove_wait_queue(__ke_wait_queue_head_t* queue_head, __ke_wait_queue_t* entry)
+ {
+ //    current->state = TASK_RUNNING;
+-    remove_wait_queue((wait_queue_head_t*)(void *)queue_head, 
++    remove_wait_queue((wait_queue_head_t*)(void *)queue_head,
+ 									(wait_queue_t*)(void *)entry);
+ }
+ 
+ void ATI_API_CALL __ke_init_waitqueue_head(__ke_wait_queue_head_t* queue_head)
+ {
+-    init_waitqueue_head((wait_queue_head_t*)(void *)queue_head); 
++    init_waitqueue_head((wait_queue_head_t*)(void *)queue_head);
+ }
+ 
+ void ATI_API_CALL __ke_wait_event_interruptible(__ke_wait_queue_head_t* queue_head, int condition)
+ {
+-    wait_event_interruptible(*((wait_queue_head_t*)(void *)queue_head), condition); 
++    wait_event_interruptible(*((wait_queue_head_t*)(void *)queue_head), condition);
+ }
+ 
+ void ATI_API_CALL __ke_poll_wait(struct file* filp, __ke_wait_queue_head_t* queue_head, __ke_poll_table* pt)
+@@ -1287,13 +1287,13 @@
+ void ATI_API_CALL *__ke_asyncio_alloc_sema()
+ {
+     int i;
+-    
++
+     for(i=0; i<FIREGL_ASYNCIO_MAX_SEMA; i++)
+     {
+         if(fireglAsyncioSemaphoreUsed[i] != 1)
+         {
+             fireglAsyncioSemaphoreUsed[i] = 1;
+-            
++
+             return &(fireglAsyncioSemaphore[i]);
+         }
+     }
+@@ -1303,7 +1303,7 @@
+ void ATI_API_CALL __ke_asyncio_free_sema(struct semaphore *pSema)
+ {
+     int i;
+-    
++
+     for(i=0; i<FIREGL_ASYNCIO_MAX_SEMA; i++)
+     {
+         if( &(fireglAsyncioSemaphore[i]) == pSema )
+@@ -1317,15 +1317,15 @@
+ void ATI_API_CALL __ke_asyncio_init_sema(void)
+ {
+     int i;
+-    
++
+     for(i=0; i<FIREGL_ASYNCIO_MAX_SEMA; i++)
+     {
+         fireglAsyncioSemaphoreUsed[i] = 0;
+     }
+-}    
++}
+ 
+-int ATI_API_CALL __ke_fasync_helper( int fd, 
+-                        struct file *filep, 
++int ATI_API_CALL __ke_fasync_helper( int fd,
++                        struct file *filep,
+                         int mode,
+                         struct fasync_struct **pasync_queue)
+ {
+@@ -1403,33 +1403,33 @@
+ {
+    struct task_struct *p;
+    int process_terminated = 1;
+-  
+-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
+    rcu_read_lock();
+-#else   
++#else
+    read_lock(&tasklist_lock);
+-#endif   
+-   p = find_task_by_pid( pid );
+-   if (p) 
++#endif
++   p = find_task_by_vpid( pid );
++   if (p)
+    {
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,10)
+-      if (p->exit_state != EXIT_ZOMBIE && p->exit_state != EXIT_DEAD) 
++      if (p->exit_state != EXIT_ZOMBIE && p->exit_state != EXIT_DEAD)
+ #else
+-      if (!(p->flags & PF_EXITING)) 
++      if (!(p->flags & PF_EXITING))
+ #endif
+       {
+          process_terminated = 0;
+       }
+-   }   
+-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
++   }
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
+    rcu_read_unlock();
+-#else   
++#else
+    read_unlock(&tasklist_lock);
+-#endif   
++#endif
+    return process_terminated;
+ }
+ 
+-/** /brief Call global OS kernel task/thread scheduler 
++/** /brief Call global OS kernel task/thread scheduler
+  *  /return Nonzero if a system call was awakened by a signal
+  */
+ int ATI_API_CALL KCL_GetSignalStatus(void)
+@@ -1483,15 +1483,15 @@
+     unblock_all_signals();
+ }
+ 
+-#if defined(__i386__) 
++#if defined(__i386__)
+ #ifndef __HAVE_ARCH_CMPXCHG
+-static inline 
+-unsigned long __fgl_cmpxchg(volatile void *ptr, unsigned long old,            
+-                        unsigned long new, int size)                      
+-{                                                                                       
+-    unsigned long prev;                                                             
+-    switch (size) {                                                                 
+-    case 1:                                                                         
++static inline
++unsigned long __fgl_cmpxchg(volatile void *ptr, unsigned long old,
++                        unsigned long new, int size)
++{
++    unsigned long prev;
++    switch (size) {
++    case 1:
+         __asm__ __volatile__(LOCK_PREFIX "cmpxchgb %b1,%2"
+                              : "=a"(prev)
+                              : "q"(new), "m"(*__xg(ptr)), "0"(old)
+@@ -1602,7 +1602,7 @@
+  */
+ KCL_TYPE_Pid ATI_API_CALL KCL_GetPid(void)
+ {
+-    return current->pid; 
++    return current->pid;
+ }
+ 
+ /** /brief Return the current Thread Group ID
+@@ -1610,7 +1610,7 @@
+  */
+ KCL_TYPE_Pid ATI_API_CALL KCL_GetTgid(void)
+ {
+-    return current->tgid; 
++    return current->tgid;
+ }
+ 
+ /** /brief Return the effective user ID
+@@ -1706,7 +1706,7 @@
+     1
+ #else
+     0
+-#endif 
++#endif
+ };
+ 
+ /** /brief Check whether a kernel configuration parameter is defined
+@@ -1792,13 +1792,13 @@
+ #if defined(__x86_64__) || defined(__ia64__)
+ void* ATI_API_CALL __ke_pci_alloc_consistent(__ke_pci_dev_t* dev, int size, void *dma_handle)
+ {
+-	return (pci_alloc_consistent( (struct pci_dev*)(void *)dev, size, dma_handle)); 
++	return (pci_alloc_consistent( (struct pci_dev*)(void *)dev, size, dma_handle));
+ }
+ 
+ void ATI_API_CALL __ke_pci_free_consistent(__ke_pci_dev_t* dev, int size, unsigned long cpu_addr,
+ 						 unsigned int dma_handle)
+ {
+-	pci_free_consistent( (struct pci_dev*)(void *)dev, size, (void *)cpu_addr, 
++	pci_free_consistent( (struct pci_dev*)(void *)dev, size, (void *)cpu_addr,
+ 		(unsigned long)dma_handle);
+ }
+ #endif // __ia64__
+@@ -1822,7 +1822,7 @@
+ 
+ /** \brief This function maps OS independent error conditions to OS defined error codes
+  *  \param errcode OS independent error condition code
+- *  \return OS kernel defined error code corresponding to the requested error condition 
++ *  \return OS kernel defined error code corresponding to the requested error condition
+  */
+ int ATI_API_CALL KCL_GetErrorCode(KCL_ENUM_ErrorCode errcode)
+ {
+@@ -1840,7 +1840,7 @@
+ int ATI_API_CALL firegl_get_user_ptr(u32 *src, void **dst)
+ {
+   unsigned long temp;
+-  int err = get_user(temp, src); 
++  int err = get_user(temp, src);
+   *dst = (void*) temp;
+   return err;
+ }
+@@ -2019,7 +2019,7 @@
+  */
+ int ATI_API_CALL KCL_AtomicDecAndTest(KCL_TYPE_Atomic* v)
+ {
+-    return atomic_dec_and_test((atomic_t*)v); 
++    return atomic_dec_and_test((atomic_t*)v);
+ }
+ 
+ /*****************************************************************************/
+@@ -2394,7 +2394,7 @@
+     struct page *page = NULL;
+ 
+     page = vmalloc_to_page(vmalloc_addr);
+-    if(page == NULL) 
++    if(page == NULL)
+     {
+         __KE_ERROR("__ke_vmalloc_to_addr: invalid page!");
+         return NULL;
+@@ -2436,7 +2436,7 @@
+     retcode = do_munmap(current->mm,
+                         addr,
+                         len);
+-#endif                        
++#endif
+     up_write(&current->mm->mmap_sem);
+     return retcode;
+ }
+@@ -2480,10 +2480,10 @@
+        minus = !minus;
+     }
+     else
+-    {   
++    {
+        ubase = base;
+     }
+-    
++
+     do_div(un, ubase);
+     return (minus? -un : un);
+ }
+@@ -2513,7 +2513,7 @@
+     else
+     {
+        ubase = base;
+-    }   
++    }
+ 
+     rem = do_div(un, ubase);
+     return (minus? -rem : rem);
+@@ -2544,7 +2544,7 @@
+     vaddr = (void *) vmap(pages, count);
+ #else
+ #ifdef VM_MAP
+-    vaddr = (void *) vmap(pages, count, VM_MAP, PAGE_KERNEL); 
++    vaddr = (void *) vmap(pages, count, VM_MAP, PAGE_KERNEL);
+ #else
+     vaddr = (void *) vmap(pages, count, 0, PAGE_KERNEL);
+ #endif
+@@ -2600,7 +2600,7 @@
+ }
+ #endif  // defined(VM_MAP) || defined(vunmap)
+ 
+-/** \brief Reserve a memory page 
++/** \brief Reserve a memory page
+  *
+  * \param pt Kernel logical address of the page
+  *
+@@ -2612,7 +2612,7 @@
+     SetPageReserved(virt_to_page((unsigned long)pt));
+ }
+ 
+-/** \brief Unreserve a memory page 
++/** \brief Unreserve a memory page
+  *
+  * \param pt Kernel logical address of the page
+  *
+@@ -2624,7 +2624,7 @@
+     ClearPageReserved(virt_to_page((unsigned long)pt));
+ }
+ 
+-/** \brief Lock a memory page 
++/** \brief Lock a memory page
+  *
+  * \param pt Kernel logical address of the page
+  *
+@@ -2633,14 +2633,14 @@
+  */
+ void ATI_API_CALL KCL_LockMemPage(void* pt)
+ {
+-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15) 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15)
+     SetPageReserved(virt_to_page((unsigned long)pt));
+ #else
+     lock_page(virt_to_page((unsigned long)pt));
+ #endif
+ }
+ 
+-/** \brief Unlock a memory page 
++/** \brief Unlock a memory page
+  *
+  * \param pt Kernel logical address of the page
+  *
+@@ -2649,7 +2649,7 @@
+  */
+ void ATI_API_CALL KCL_UnlockMemPage(void* pt)
+ {
+-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15) 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15)
+     ClearPageReserved(virt_to_page((unsigned long)pt));
+ #else
+     unlock_page(virt_to_page((unsigned long)pt));
+@@ -2674,7 +2674,7 @@
+ 	return memory->vmptr;
+ }
+ #endif
+-                              
++
+ void* ATI_API_CALL __ke_ioremap(unsigned long offset, unsigned long size)
+ {
+     return ioremap(offset, size);
+@@ -2724,7 +2724,7 @@
+ {
+ /*Some kernel developer removed the export of symbol "flush_tlb_page" on 2.6.25 x86_64 SMP kernel.
+   Define a simple version here.*/
+-#if defined(__x86_64__) && defined(__SMP__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25)) 
++#if defined(__x86_64__) && defined(__SMP__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25))
+     on_each_cpu(KCL_flush_tlb_one, &va, 1, 1);
+ #else
+     flush_tlb_page(vma, va);
+@@ -2884,9 +2884,9 @@
+ static inline int ptep_clear_flush_dirty(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
+ {
+     int ret = 0;
+-    
++
+     DBG_ENTER("0x%08X, 0x%08X, 0x%08X->0x%08X", vma, addr, ptep, *ptep);
+-    
++
+     if (pte_dirty(*ptep))
+     {
+ #ifdef __x86_64__
+@@ -2901,19 +2901,19 @@
+         {
+             pte_update(vma->vm_mm, addr, ptep);
+         }
+-#endif        
++#endif
+     }
+ 
+     DBG_TRACE("0x%08X->0x%08X", ptep, *ptep);
+-    
++
+     // Flush Translation Lookaside Buffers
+     if (ret)
+     {
+         KCL_flush_tlb_onepage(vma,addr);
+     }
+-    
++
+     DBG_LEAVE("%d", ret);
+-    
++
+     return ret;
+ }
+ #endif
+@@ -3279,7 +3279,7 @@
+        return 0;
+ #else
+     return 1;
+-#endif    
++#endif
+ #else /* !CONFIG_MTRR */
+     return 0;
+ #endif /* !CONFIG_MTRR */
+@@ -3305,7 +3305,7 @@
+ 
+ int ATI_API_CALL __ke_has_vmap(void)
+ {
+-// We disable vmap for 2.4.x kernel to work around the big memory( > 4GB ) issue. 
++// We disable vmap for 2.4.x kernel to work around the big memory( > 4GB ) issue.
+ #if defined(VM_MAP) || defined(vunmap)
+     return 1;
+ #else
+@@ -3372,7 +3372,7 @@
+ {
+     struct pci_dev* dev = (struct pci_dev*)pcidev;
+     return PCI_FUNC(dev->devfn);
+-}    
++}
+ 
+ __ke_dma_addr_t ATI_API_CALL __ke_pci_map_single (__ke_pci_dev_t *pdev, void *buffer, __ke_size_t size, int direction)
+ {
+@@ -3525,12 +3525,12 @@
+     return (int)(agpmem->page_count);
+ }
+ 
+-void ATI_API_CALL __ke_agp_memory_get_memory(struct _agp_memory* agpmem, 
++void ATI_API_CALL __ke_agp_memory_get_memory(struct _agp_memory* agpmem,
+                                              unsigned long **memory_ptr)
+ {
+     __KE_DEBUG("[%s] agpmem=0x%016lx agpmem->memory=0x%016lx [0]=0x%016x",
+-               __FUNCTION__, 
+-               (unsigned long)agpmem, 
++               __FUNCTION__,
++               (unsigned long)agpmem,
+                (unsigned long)agpmem->memory,
+                (agpmem->memory)[0]);
+ 
+@@ -3539,18 +3539,9 @@
+ 
+ /*****************************************************************************/
+ 
+-#ifndef NOPAGE_SIGBUS
+-#define NOPAGE_SIGBUS 0
+-#endif /* !NOPAGE_SIGBUS */
+-
+ typedef struct page mem_map_t;
+ typedef mem_map_t *vm_nopage_ret_t;
+ 
+-static __inline__ vm_nopage_ret_t do_vm_nopage(struct vm_area_struct* vma,
+-                                                     unsigned long address)
+-{
+-    return 0;   /* Disallow mremap */
+-}
+ 
+ #ifdef __AGP__BUILTIN__
+ #ifdef __ia64__
+@@ -3575,19 +3566,20 @@
+ 			return page;
+ 		}
+ 	}
+-	return NOPAGE_SIGBUS;		/* Disallow mremap */
++	return VM_FAULT_SIGBUS;		/* Disallow mremap */
+ }
+ 
+ #endif /* __ia64__ */
+ #endif /* __AGP__BUILTIN__ */
+ 
+ 
+-static __inline__ vm_nopage_ret_t do_vm_shm_nopage(struct vm_area_struct* vma,
+-                                                   unsigned long address)
++static __inline__ int do_vm_shm_nopage(struct vm_area_struct* vma,
++				       struct vm_fault *vmf)
+ {
+     pgd_t* pgd_p;
+     pmd_t* pmd_p;
+     pte_t  pte;
++    unsigned long address = (unsigned long)vmf->virtual_address;
+     unsigned long vma_offset;
+     unsigned long pte_linear;
+     mem_map_t* pMmPage;
+@@ -3616,7 +3608,7 @@
+             (unsigned long)__ke_vm_offset(vma));
+ 
+     if (address > vma->vm_end)
+-        return NOPAGE_SIGBUS; /* address is out of range */
++        return VM_FAULT_SIGBUS; /* address is out of range */
+ 
+     /*  Calculate offset into VMA */
+     vma_offset = address - vma->vm_start;
+@@ -3628,7 +3620,7 @@
+     pte_linear = firegl_get_addr_from_vm(vma);
+     if (!pte_linear)
+     {
+-        return NOPAGE_SIGBUS; /* bad address */
++        return VM_FAULT_SIGBUS; /* bad address */
+     }
+     pte_linear += vma_offset;
+ 
+@@ -3656,7 +3648,9 @@
+ 
+     //  __KE_DEBUG3("vm-address 0x%08lx => kernel-page-address 0x%p\n",
+     //    address, page_address(pMmPage));
+-    return pMmPage;
++    vmf->page = pMmPage;
++
++    return 0;
+ }
+ 
+ /*
+@@ -3665,8 +3659,10 @@
+       (which is one ore more pages in size)
+ 
+ */
+-static __inline__ vm_nopage_ret_t do_vm_dma_nopage(struct vm_area_struct* vma, unsigned long address)
++static __inline__ int do_vm_dma_nopage(struct vm_area_struct* vma,
++				       struct vm_fault *vmf)
+ {
++    unsigned long address = (unsigned long) vmf->virtual_address;
+     unsigned long kaddr;
+     mem_map_t* pMmPage;
+ 
+@@ -3682,7 +3678,7 @@
+     kaddr = firegl_get_addr_from_vm(vma);
+     if (!kaddr)
+     {
+-        return NOPAGE_SIGBUS; /* bad address */
++        return VM_FAULT_SIGBUS; /* bad address */
+     }
+     kaddr += (address - vma->vm_start);
+ 
+@@ -3694,19 +3690,23 @@
+     // with drm_alloc_pages, which marks all pages as reserved. Reserved
+     // pages' usage count is not decremented by the kernel during unmap!!!
+     //
+-    // For kernel >= 2.6.15, We should reenable this, because the VM sub-system 
+-    // will decrement the pages' usage count even for the pages marked as reserved 
++    // For kernel >= 2.6.15, We should reenable this, because the VM sub-system
++    // will decrement the pages' usage count even for the pages marked as reserved
+     // 								- MC.
+     get_page(pMmPage); /* inc usage count of page */
+ #endif
+ 
+     __KE_DEBUG3("vm-address 0x%08lx => kernel-page-address 0x%p\n",
+         address, page_address(pMmPage));
+-    return pMmPage;
++    vmf->page = pMmPage;
++
++    return 0;
+ }
+ 
+-static __inline__ vm_nopage_ret_t do_vm_kmap_nopage(struct vm_area_struct* vma, unsigned long address)
++static __inline__ int do_vm_kmap_nopage(struct vm_area_struct* vma,
++					struct vm_fault *vmf)
+ {
++    unsigned long address = (unsigned long) vmf->virtual_address;
+     unsigned long kaddr;
+     mem_map_t* pMmPage;
+ 
+@@ -3716,13 +3716,14 @@
+     if ((pMmPage = (mem_map_t*) firegl_get_pagetable_page_from_vm(vma)))
+     {
+         get_page(pMmPage);
+-        return pMmPage;
++	vmf->page = pMmPage;
++        return 0;
+     }
+ 
+     kaddr = firegl_get_addr_from_vm(vma);
+     if (!kaddr)
+     {
+-        return NOPAGE_SIGBUS; /* bad address */
++        return VM_FAULT_SIGBUS; /* bad address */
+     }
+     kaddr += (address - vma->vm_start);
+ 
+@@ -3735,50 +3736,52 @@
+ 
+     __KE_DEBUG3("vm-address 0x%08lx => kernel-page-address 0x%p\n", address, page_address(pMmPage));
+ 
+-    return pMmPage;
++    vmf->page = pMmPage;
++    return 0;
+ }
+ 
+-/** 
++/**
+  **
+- **  This routine is intented to locate the page table through the 
++ **  This routine is intented to locate the page table through the
+  **  pagelist table created earlier in dev-> pcie
+  **/
+-static __inline__ vm_nopage_ret_t do_vm_pcie_nopage(struct vm_area_struct* vma,
+-                                                         unsigned long address)
++static __inline__ int do_vm_pcie_nopage(struct vm_area_struct* vma,
++					struct vm_fault *vmf)
+ {
+ 
++    unsigned long address = (unsigned long)vmf->virtual_address;
+     unsigned long vma_offset;
+-    unsigned long i; 
++    unsigned long i;
+     mem_map_t* pMmPage;
+     struct firegl_pcie_mem* pciemem;
+     unsigned long* pagelist;
+-    
++
+     drm_device_t *dev = (drm_device_t *)firegl_get_dev_from_vm(vma);
+     if (dev == NULL)
+     {
+         __KE_ERROR("dev is NULL\n");
+-        return NOPAGE_SIGBUS;
++        return VM_FAULT_SIGBUS;
+     }
+ 
+     if (address > vma->vm_end)
+     {
+         __KE_ERROR("address out of range\n");
+-        return NOPAGE_SIGBUS; /* address is out of range */
++        return VM_FAULT_SIGBUS; /* address is out of range */
+     }
+     pciemem = firegl_get_pciemem_from_addr ( vma, address);
+     if (pciemem == NULL)
+     {
+         __KE_ERROR("No pciemem found! \n");
+-        return NOPAGE_SIGBUS;
+-    }    
++        return VM_FAULT_SIGBUS;
++    }
+     pagelist = firegl_get_pagelist_from_vm(vma);
+ 
+-    if (pagelist == NULL) 
++    if (pagelist == NULL)
+     {
+         __KE_ERROR("No pagelist! \n");
+-        return NOPAGE_SIGBUS;
++        return VM_FAULT_SIGBUS;
+     }
+-     
++
+     /** Find offset in  vma */
+     vma_offset = address - vma->vm_start;
+     /** Which entry in the pagelist */
+@@ -3790,15 +3793,17 @@
+     if (page_address(pMmPage) == 0x0)
+     {
+         __KE_ERROR("Invalid page address\n");
+-        return NOPAGE_SIGBUS;
++        return VM_FAULT_SIGBUS;
+     }
+-    return pMmPage;
++
++    vmf->page = pMmPage;
++    return 0;
+ }
+ 
+-static __inline__ vm_nopage_ret_t do_vm_gart_nopage(struct vm_area_struct* vma,
+-                                                    unsigned long address)
++static __inline__ int do_vm_gart_nopage(struct vm_area_struct* vma,
++					struct vm_fault *vmf)
+ {
+-
++    unsigned long address = (unsigned long) vmf->virtual_address;
+     unsigned long page_addr;
+     unsigned long offset;
+     struct page *page;
+@@ -3806,36 +3811,31 @@
+     if (address > vma->vm_end)
+     {
+         __KE_ERROR("Invalid virtual address\n");
+-        return NOPAGE_SIGBUS;   /* Disallow mremap */
+-    }          
++        return VM_FAULT_SIGBUS;   /* Disallow mremap */
++    }
+ 
+     offset      = address - vma->vm_start;
+-#ifdef FIREGL_CF_SUPPORT    
++#ifdef FIREGL_CF_SUPPORT
+     page_addr   = mc_heap_get_page_addr(vma, offset);
+ #else
+     page_addr   = firegl_cmmqs_get_pageaddr_from_vm(vma, offset);
+-#endif    
++#endif
+     if( !page_addr)
+     {
+         __KE_ERROR("Invalid page address\n");
+-        return NOPAGE_SIGBUS;   /* Disallow mremap */
++        return VM_FAULT_SIGBUS;   /* Disallow mremap */
+     }
+     page        = virt_to_page(page_addr);
+     get_page(page);
+ 
+-    return page;
++    vmf->page = page;
++    return 0;
+ }
+ 
+-
+-
+-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,0)
+-
+-static vm_nopage_ret_t vm_nopage(struct vm_area_struct* vma,
+-                                 unsigned long address,
+-                                 int *type)
++static int vm_nopage(struct vm_area_struct* vma,
++		     struct vm_fault *vmf, int type)
+ {
+-    if (type) *type = VM_FAULT_MINOR;
+-        return do_vm_nopage(vma, address);
++	return VM_FAULT_SIGBUS;
+ }
+ 
+ #ifdef __AGP__BUILTIN__
+@@ -3867,12 +3867,10 @@
+     (which is one or more pages in size)
+ 
+  */
+-static vm_nopage_ret_t vm_shm_nopage(struct vm_area_struct* vma,
+-                                     unsigned long address,
+-                                     int *type)
++static int vm_shm_nopage(struct vm_area_struct* vma,
++			 struct vm_fault *vmf, int type)
+ {
+-    if (type) *type = VM_FAULT_MINOR;
+-        return do_vm_shm_nopage(vma, address);
++        return do_vm_shm_nopage(vma, vmf);
+ }
+ 
+ /*
+@@ -3881,115 +3879,29 @@
+       (which is one ore more pages in size)
+ 
+ */
+-static vm_nopage_ret_t vm_dma_nopage(struct vm_area_struct* vma,
+-                                     unsigned long address,
+-                                     int *type)
++static int vm_dma_nopage(struct vm_area_struct* vma,
++			 struct vm_fault *vmf, int type)
+ {
+-    if (type) *type = VM_FAULT_MINOR;
+-        return do_vm_dma_nopage(vma, address);
+-}
+-
+-static vm_nopage_ret_t vm_kmap_nopage(struct vm_area_struct* vma,
+-                                     unsigned long address,
+-                                     int *type)
+-{
+-    if (type) *type = VM_FAULT_MINOR;
+-        return do_vm_kmap_nopage(vma, address);
+-}
+-
+-static vm_nopage_ret_t vm_pcie_nopage(struct vm_area_struct* vma,
+-                                     unsigned long address,
+-                                     int *type)
+-{  
+-       return do_vm_pcie_nopage(vma, address);
++        return do_vm_dma_nopage(vma, vmf);
+ }
+ 
+-static vm_nopage_ret_t vm_gart_nopage(struct vm_area_struct* vma,
+-                                      unsigned long address, 
+-                                      int *type)
++static int vm_kmap_nopage(struct vm_area_struct* vma,
++			  struct vm_fault *vmf, int type)
+ {
+-       return do_vm_gart_nopage(vma, address);
++        return do_vm_kmap_nopage(vma, vmf);
+ }
+ 
+-#else   /* LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,0) */
+-
+-static vm_nopage_ret_t vm_nopage(struct vm_area_struct* vma,
+-                                 unsigned long address,
+-                                 int write_access)
++static int vm_pcie_nopage(struct vm_area_struct* vma,
++			  struct vm_fault *vmf, int type)
+ {
+-    return do_vm_nopage(vma, address);
++	return do_vm_pcie_nopage(vma, vmf);
+ }
+ 
+-#ifdef __AGP__BUILTIN__
+-#ifdef __ia64__
+-
+-
+-static vm_nopage_ret_t vm_cant_nopage(struct vm_area_struct* vma,
+-                                 unsigned long address,
+-                                 int write_access)
++static int vm_gart_nopage(struct vm_area_struct* vma,
++			  struct vm_fault *vmf, int type)
+ {
+-    return do_vm_cant_nopage(vma, address);
++       return do_vm_gart_nopage(vma, vmf);
+ }
+-#endif /* __ia64__ */
+-#endif /* __AGP__BUILTIN__ */
+-
+-/*
+-
+-    This function is called when a page of a mmap()'ed area is not currently
+-    visible in the specified VMA.
+-    Return value is the associated physical address for the requested page.
+-    (If not implemented, then the kernel default routine would allocate a new,
+-     zeroed page for servicing us)
+-
+-    Possible errors: SIGBUS, OutOfMem
+-
+-    This routine is intended to remap addresses of SHM SAREA
+-    (which is one or more pages in size)
+-
+- */
+-static vm_nopage_ret_t vm_shm_nopage(struct vm_area_struct* vma,
+-                                     unsigned long address,
+-                                     int write_access)
+-{
+-    return do_vm_shm_nopage(vma, address);
+-}
+-
+-/*
+-
+-    This routine is intended to remap addresses of a OpenGL context
+-      (which is one ore more pages in size)
+-
+-*/
+-static vm_nopage_ret_t vm_dma_nopage(struct vm_area_struct* vma,
+-                                     unsigned long address,
+-                                     int write_access)
+-{
+-     return do_vm_dma_nopage(vma, address);
+-}
+-
+-static vm_nopage_ret_t vm_kmap_nopage(struct vm_area_struct* vma,
+-                                     unsigned long address,
+-                                     int write_access)
+-{
+-     return do_vm_kmap_nopage(vma, address);
+-}
+-
+-static vm_nopage_ret_t vm_pcie_nopage(struct vm_area_struct* vma,
+-                                     unsigned long address,
+-                                     int write_access)
+-{
+-        return do_vm_pcie_nopage(vma, address);
+-}
+-
+-static vm_nopage_ret_t vm_gart_nopage(struct vm_area_struct* vma,
+-                                      unsigned long address, 
+-                                      int *type)
+-{
+-       return do_vm_gart_nopage(vma, address);
+-}
+-
+-
+-#endif /* LINUX_VERSION_CODE > KERNEL_VERSION(2,6,0) */
+ 
+ void* ATI_API_CALL __ke_vma_file_priv(struct vm_area_struct* vma)
+ {
+@@ -4040,7 +3952,7 @@
+     *(buf + i++) = pgprot & _PAGE_DIRTY    ? 'd' : '-';
+     *(buf + i++) = pgprot & _PAGE_PSE      ? 'm' : 'k';
+     *(buf + i++) = pgprot & _PAGE_GLOBAL   ? 'g' : 'l';
+-#endif /* __i386__ */		
++#endif /* __i386__ */
+     *(buf + i++) = 0;
+ 
+     return buf;
+@@ -4069,9 +3981,9 @@
+     return buf;
+ }
+ 
+-char* ATI_API_CALL __ke_vm_phys_addr_str(struct vm_area_struct* vma, 
+-                            char* buf, 
+-                            unsigned long virtual_addr, 
++char* ATI_API_CALL __ke_vm_phys_addr_str(struct vm_area_struct* vma,
++                            char* buf,
++                            unsigned long virtual_addr,
+                             __ke_dma_addr_t* phys_address)
+ {
+     pgd_t* pgd_p;
+@@ -4174,7 +4086,7 @@
+ 
+ static struct vm_operations_struct vm_ops =
+ {
+-    nopage:  ip_vm_nopage,
++    fault:  ip_vm_nopage,
+     open:    ip_drm_vm_open,
+     close:   ip_drm_vm_close,
+ };
+@@ -4183,7 +4095,7 @@
+ #ifdef __ia64__
+ static struct vm_operations_struct vm_cant_ops =
+ {
+-    nopage:  ip_vm_cant_nopage,
++    fault:  ip_vm_cant_nopage,
+     open:    ip_drm_vm_open,
+     close:   ip_drm_vm_close,
+ };
+@@ -4192,42 +4104,42 @@
+ 
+ static struct vm_operations_struct vm_shm_ops =
+ {
+-    nopage:  ip_vm_shm_nopage,
++    fault:  ip_vm_shm_nopage,
+     open:    ip_drm_vm_open,
+     close:   ip_drm_vm_close,
+ };
+ 
+ static struct vm_operations_struct vm_pci_bq_ops =
+ {
+-    nopage:  ip_vm_dma_nopage,
++    fault:  ip_vm_dma_nopage,
+     open:    ip_drm_vm_open,
+     close:   ip_drm_vm_close,
+ };
+ 
+ static struct vm_operations_struct vm_ctx_ops =
+ {
+-    nopage:  ip_vm_dma_nopage,
++    fault:  ip_vm_dma_nopage,
+     open:    ip_drm_vm_open,
+     close:   ip_drm_vm_close,
+ };
+ 
+ static struct vm_operations_struct vm_pcie_ops = 
+ {
+-    nopage:  ip_vm_pcie_nopage,
++    fault:  ip_vm_pcie_nopage,
+     open:    ip_drm_vm_open,
+     close:   ip_drm_vm_close,
+ };
+ 
+ static struct vm_operations_struct vm_kmap_ops =
+ {
+-    nopage:  ip_vm_kmap_nopage,
++    fault:  ip_vm_kmap_nopage,
+     open:    ip_drm_vm_open,
+     close:   ip_drm_vm_close,
+ };
+ 
+ static struct vm_operations_struct vm_gart_ops =
+ {
+-    nopage:  ip_vm_gart_nopage,
++    fault:  ip_vm_gart_nopage,
+     open:    ip_drm_vm_open,
+     close:   ip_drm_vm_close,
+ };
+@@ -4236,14 +4148,14 @@
+ #ifndef __ia64__
+ static struct vm_operations_struct vm_agp_bq_ops =
+ {
+-    nopage:  ip_vm_nopage,
++    fault:  ip_vm_nopage,
+     open:    ip_drm_vm_open,
+     close:   ip_drm_vm_close,
+ };
+ #else		
+ static struct vm_operations_struct vm_cant_agp_bq_ops =
+ {
+-    nopage:  ip_vm_cant_nopage,
++    fault:  ip_vm_cant_nopage,
+     open:    ip_drm_vm_open,
+     close:   ip_drm_vm_close,
+ };
+@@ -4298,7 +4210,7 @@
+             vma->vm_ops = &vm_ops;
+ 			break;
+ 
+-#ifdef FIREGL_USWC_SUPPORT                
++#ifdef FIREGL_USWC_SUPPORT
+         case __KE_ADPT_REG:
+ 			{
+ #ifdef __ia64__
+@@ -4318,7 +4230,7 @@
+                     }
+                     else
+                     {
+-                        vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot); 
++                        vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+                     }
+                 }
+ #endif /* __i386__ */
+@@ -4337,7 +4249,7 @@
+             vma->vm_ops = &vm_ops;
+             }
+ 			break;
+-#endif                    
++#endif
+ 
+         case __KE_SHM:
+             vma->vm_flags |= VM_SHM | VM_RESERVED; /* Don't swap */
+@@ -4371,7 +4283,7 @@
+ 
+ #ifdef __AGP__BUILTIN__
+         case __KE_AGP:
+-            // if(dev->agp->cant_use_aperture == 1) 
++            // if(dev->agp->cant_use_aperture == 1)
+ #ifdef __ia64__
+             {
+                 /*
+@@ -4395,9 +4307,9 @@
+                     if( firegl_pat_enabled )
+                     {
+                         vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+-                    }    
++                    }
+                 }
+-#endif                
++#endif
+ 
+                 if (REMAP_PAGE_RANGE(vma,offset))
+                 {
+@@ -4414,8 +4326,8 @@
+ #endif
+             break;
+         case __KE_AGP_BQS:
+-            // if(dev->agp->cant_use_aperture == 1) 
+-#ifdef __ia64__			
++            // if(dev->agp->cant_use_aperture == 1)
++#ifdef __ia64__
+             {
+                 /*
+                  * On some systems we can't talk to bus dma address from
+@@ -4438,9 +4350,9 @@
+                     if( firegl_pat_enabled )
+                     {
+                        vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+-                    }   
++                    }
+                 }
+-#endif                
++#endif
+ 
+                 if (REMAP_PAGE_RANGE(vma,offset))
+                 {
+@@ -4469,15 +4381,15 @@
+             break;
+ 
+          case __KE_GART_USWC:
+-#ifdef FIREGL_USWC_SUPPORT         
++#ifdef FIREGL_USWC_SUPPORT
+             if (boot_cpu_data.x86 > 3)
+             {
+                 if( firegl_pat_enabled )
+                 {
+                     vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+-                }    
++                }
+             }
+-#endif            
++#endif
+             // fall through
+          case __KE_GART_CACHEABLE:
+              vma->vm_flags |= VM_RESERVED;
+@@ -4527,7 +4439,7 @@
+ #define FIREGL_agp_backend_release  _X(agp_backend_release)
+ #define FIREGL_agp_memory           _X(agp_memory)
+ 
+-unsigned int __ke_firegl_agpgart_inuse = AGPGART_INUSE_NONE;				
++unsigned int __ke_firegl_agpgart_inuse = AGPGART_INUSE_NONE;
+ 
+ #if defined(CONFIG_AGP) || defined(CONFIG_AGP_MODULE)
+ /*****************************************************************************/
+@@ -4642,7 +4554,7 @@
+ int ATI_API_CALL __ke_agpgart_available(__ke_pci_dev_t *pcidev)
+ {
+     drm_agp_module_stub = &drm_agp;
+-    __ke_firegl_agpgart_inuse = KERNEL26_AGPGART_INUSE;	
++    __ke_firegl_agpgart_inuse = KERNEL26_AGPGART_INUSE;
+     {
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,12)
+         firegl_pci_device = (struct pci_dev*)(void*)pcidev;
+@@ -4778,7 +4690,7 @@
+ 
+     if (AGP_AVAILABLE(copy_info))
+     {
+-        struct agp_kern_info kern;    
++        struct agp_kern_info kern;
+ 
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,12)
+         if (firegl_agp_bridge == NULL)
+@@ -4876,7 +4788,7 @@
+ 
+ int ATI_API_CALL __ke_read_agp_caps_registers(__ke_pci_dev_t* dev, unsigned int *caps)
+ {
+-    return -EINVAL;	
++    return -EINVAL;
+ }
+ 
+ int ATI_API_CALL __ke_agp_acquire(__ke_pci_dev_t* dev)
+@@ -4913,9 +4825,9 @@
+ 
+ /** \brief Runs a function on all other CPUs
+  *  \param func_to_call function to be called on all other cpus
+- *  \return None 
++ *  \return None
+  */
+-void ATI_API_CALL KCL_CallFuncOnOtherCpus(firegl_void_routine_t func_to_call) 
++void ATI_API_CALL KCL_CallFuncOnOtherCpus(firegl_void_routine_t func_to_call)
+ {
+ #ifdef CONFIG_SMP
+ 	smp_call_function( firegl_smp_func_parameter_wrap, (void*)func_to_call, 0, 1 );
+@@ -4926,7 +4838,7 @@
+ 
+ int ATI_API_CALL KCL_is_pat_enabled(void)
+ {
+-   return firegl_pat_enabled; 
++   return firegl_pat_enabled;
+ }
+ 
+ static int ATI_API_CALL KCL_has_pat(void)
+@@ -4942,7 +4854,7 @@
+ {
+     unsigned long cr0=0, cr4=0;
+     unsigned long flags;
+-  
++
+     local_irq_save(flags);
+     cr0 = read_cr0() | 0x40000000;
+     write_cr0(cr0);
+@@ -4973,7 +4885,7 @@
+ {
+     unsigned long cr0 = 0, cr4 = 0;
+     unsigned long flags;
+-  
++
+     local_irq_save(flags);
+     cr0 = read_cr0() | 0x40000000;
+     write_cr0(cr0);
+@@ -4985,7 +4897,7 @@
+        write_cr4(cr4 & ~X86_CR4_PGE);
+     }
+      __flush_tlb();
+-  
++
+     wrmsr(MSR_IA32_CR_PAT,  KCL_orig_pat[0], KCL_orig_pat[1]);
+ 
+     cr0 = read_cr0();
+@@ -5008,7 +4920,7 @@
+          __KE_INFO("USWC is disabled in module parameters\n");
+          return 0;
+      }
+-     
++
+      if (!KCL_has_pat())
+      {
+         return 0;
+@@ -5018,13 +4930,13 @@
+ 
+      for ( i = 0; i < 2; i++ )
+      {
+-        for (j = 0; j < 4; j ++)    
++        for (j = 0; j < 4; j ++)
+         {
+             if (((KCL_orig_pat[i] >> (j * 8)) & 0xFF) == 1)
+-            { 
++            {
+                __KE_ERROR("Pat entry %d is already configured\n", (i+1)*(j+1));
+                return 0;
+-            } 
++            }
+         }
+     }
+ 
+@@ -5096,7 +5008,7 @@
+ } kasContext_t;
+ 
+ /** \brief KAS context */
+-static kasContext_t kasContext; 
++static kasContext_t kasContext;
+ 
+ /** \brief Kernel support required to enable KAS */
+ #if defined(cmpxchg)                        && \
+@@ -5398,7 +5310,7 @@
+     DBG_TRACE("Interrupt handler returned 0x%08X", ret);
+ 
+     kasSetExecutionLevel(orig_level);
+-    spin_unlock(&kasContext.lock_ih); 
++    spin_unlock(&kasContext.lock_ih);
+ 
+     DBG_LEAVE("%d", ret);
+     return ret;
+@@ -5673,7 +5585,7 @@
+ #endif
+     spinlock_t lock;            /* OS spinlock object protecting the cache */
+     unsigned int routine_type;  /* Type of routine the cache might be accessed from */
+-    char name[14];              /* Cache object name (kernel 2.4 restricts its length to 19 chars) */
++    char name[24];              /* Cache object name (kernel 2.4 restricts its length to 19 chars) */
+ } kasSlabCache_t;
+ 
+ /** \brief Return Slab Cache object size
+@@ -5711,7 +5623,8 @@
+ 
+     slabcache_obj->routine_type = access_type;
+     spin_lock_init(&(slabcache_obj->lock));
+-    sprintf(slabcache_obj->name, "kas(%08lX)",(unsigned long)slabcache_obj);
++    snprintf(slabcache_obj->name, sizeof(slabcache_obj->name),
++               "kas(%p)", slabcache_obj);
+ 
+     DBG_TRACE("creating slab object '%s'", slabcache_obj->name);
+ 
+@@ -6627,7 +6540,7 @@
+ 
+     kas_xadd(puiDestination, iAdd, ret, "l");
+ 
+-    return ret + iAdd; 
++    return ret + iAdd;
+ #else
+     return 0xDEADC0DE; /* To make compiler happy */
+ #endif
+@@ -6710,7 +6623,7 @@
+ #ifdef FIREGL_CF_SUPPORT
+ 
+ void *ATI_API_CALL KCL_lock_init()
+-{   
++{
+     spinlock_t *lock;
+ 
+     lock = kmalloc(sizeof(*lock), GFP_KERNEL);
+@@ -6722,7 +6635,7 @@
+ }
+ 
+ void ATI_API_CALL KCL_lock_deinit(void *plock)
+-{   
++{
+     if (plock == NULL)
+     {
+         __KE_ERROR("plock is NULL\n");
+diff -Nur -x '*.orig' -x '*~' fglrx-installer-8.512/lib/modules/fglrx/build_mod/firegl_public.h fglrx-installer-8.512.new/lib/modules/fglrx/build_mod/firegl_public.h
+--- build_mod/firegl_public.h	2008-07-21 14:32:08.000000000 -0400
++++ fglrx-installer-8.512.new/lib/modules/fglrx/build_mod/firegl_public.h	2008-07-21 14:32:14.000000000 -0400
+@@ -78,7 +78,7 @@
+     if (!pgd_present(*(pgd_p)))	\
+     { \
+         __KE_ERROR("FATAL ERROR: User queue buffer not present! (pgd)\n"); \
+-        return (unsigned long)NOPAGE_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
++        return VM_FAULT_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
+         /* alternatively we could generate a NOPAGE_OOM "out of memory" */ \
+     } \
+ } while(0)
+@@ -91,7 +91,7 @@
+     if (!pud_present(*(pud_p)))	\
+     { \
+         __KE_ERROR("FATAL ERROR: User queue buffer not present! (pud)\n"); \
+-        return (unsigned long)NOPAGE_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
++        return VM_FAULT_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
+         /* alternatively we could generate a NOPAGE_OOM "out of memory" */ \
+     } \
+     pmd_p = pmd_offset(pud_p, pte_linear); \
+@@ -111,7 +111,7 @@
+     if (!pmd_present(*(pmd_p)))	\
+     { \
+         __KE_ERROR("FATAL ERROR: User queue buffer not present! (pmd)\n"); \
+-        return (unsigned long)NOPAGE_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
++        return VM_FAULT_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
+         /* alternatively we could generate a NOPAGE_OOM "out of memory" */ \
+     } \
+ } while(0)
+@@ -157,7 +157,7 @@
+     if (!pte_present(pte)) \
+     { \
+         __KE_ERROR("FATAL ERROR: User queue buffer not present! (pte)\n"); \
+-        return (unsigned long)NOPAGE_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
++        return VM_FAULT_SIGBUS;   /* Something bad happened; generate SIGBUS */ \
+         /* alternatively we could generate a NOPAGE_OOM "out of memory" */ \
+     } \
+ } while(0)
diff -Nru 8-7/packages/Ubuntu/dists/intrepid/patches/2.6.27_support.patch 8-7.hotfix/packages/Ubuntu/dists/intrepid/patches/2.6.27_support.patch
--- 8-7/packages/Ubuntu/dists/intrepid/patches/2.6.27_support.patch	1970-01-01 01:00:00.000000000 +0100
+++ 8-7.hotfix/packages/Ubuntu/dists/intrepid/patches/2.6.27_support.patch	2008-08-18 23:28:18.000000000 +0200
@@ -0,0 +1,53 @@
+diff -Nru fglrx-8.512/firegl_public.c fix/fglrx-8.512/firegl_public.c
+--- fglrx-8.512/firegl_public.c	2008-07-21 21:17:45.000000000 +0200
++++ fix/fglrx-8.512/firegl_public.c	2008-08-10 12:16:29.000000000 +0200
+@@ -3235,7 +3235,7 @@
+ {
+ #ifdef __SMP__
+     /* write back invalidate all other CPUs (exported by kernel) */
+-	if (smp_call_function(deferred_flush, NULL, 1, 0) != 0)
++	if (smp_call_function(deferred_flush, NULL, 0) != 0)
+ 		panic("timed out waiting for the other CPUs!\n");
+ 
+     /* invalidate this CPU */
+@@ -4918,7 +4918,7 @@
+ void ATI_API_CALL KCL_CallFuncOnOtherCpus(firegl_void_routine_t func_to_call) 
+ {
+ #ifdef CONFIG_SMP
+-	smp_call_function( firegl_smp_func_parameter_wrap, (void*)func_to_call, 0, 1 );
++	smp_call_function( firegl_smp_func_parameter_wrap, (void*)func_to_call, 1);
+ #endif
+ }
+ 
+@@ -5029,7 +5029,7 @@
+     }
+ 
+ #ifdef CONFIG_SMP
+-    if (smp_call_function(KCL_setup_pat, NULL, 0, 1) != 0)
++    if (smp_call_function(KCL_setup_pat, NULL, 1) != 0)
+        return 0;
+ #endif
+     KCL_setup_pat(NULL);
+@@ -5047,7 +5047,7 @@
+     }
+ 
+ #ifdef CONFIG_SMP
+-    if (smp_call_function(KCL_restore_pat, NULL, 0, 1) != 0)
++    if (smp_call_function(KCL_restore_pat, NULL, 1) != 0)
+        return;
+ #endif
+     KCL_restore_pat(NULL);
+diff -Nru fglrx-8.512/Makefile fix/fglrx-8.512/Makefile
+--- fglrx-8.512/Makefile	2008-07-21 21:17:45.000000000 +0200
++++ fix/fglrx-8.512/Makefile	2008-08-10 12:29:20.000000000 +0200
+@@ -21,6 +21,10 @@
+                 -DFGL_LINUX253P1_VMA_API \
+                 -DPAGE_ATTR_FIX=$(PAGE_ATTR_FIX) \
+ 
++PV_CPU := $(shell grep "D pv_cpu_ops" /boot/System.map-$(shell uname -r) | colrm 9)
++PV_LOCK := $(shell grep "D pv_lock_ops" /boot/System.map-$(shell uname -r) | colrm 9)
++EXTRA_LDFLAGS := --defsym pv_cpu_ops=0x$(PV_CPU) --defsym pv_lock_ops=0x$(PV_LOCK)
++
+ ifeq ($(KERNELRELEASE),)
+ # on first call from remote location we get into this path
+ # whilst on second call all is managed by the embedding kernel makefile
diff -Nru 8-7/packages/Ubuntu/dists/intrepid/patches/2.6.27_sysrq_key_disable.patch 8-7.hotfix/packages/Ubuntu/dists/intrepid/patches/2.6.27_sysrq_key_disable.patch
--- 8-7/packages/Ubuntu/dists/intrepid/patches/2.6.27_sysrq_key_disable.patch	1970-01-01 01:00:00.000000000 +0100
+++ 8-7.hotfix/packages/Ubuntu/dists/intrepid/patches/2.6.27_sysrq_key_disable.patch	2008-08-18 23:03:43.000000000 +0200
@@ -0,0 +1,31 @@
+diff -Nru fglrx-8.512.orig/firegl_public.c fglrx-8.512/firegl_public.c
+--- fglrx-8.512.orig/firegl_public.c	2008-08-18 23:01:41.000000000 +0200
++++ fglrx-8.512/firegl_public.c	2008-08-18 22:54:48.000000000 +0200
+@@ -6774,11 +6774,11 @@
+ {
+     if(enable)
+     {
+-        register_sysrq_key('g', &sysrq_fgldbg_op);
++        //register_sysrq_key('g', &sysrq_fgldbg_op);
+     }     
+     else
+     {
+-        unregister_sysrq_key('g', &sysrq_fgldbg_op);
++        //unregister_sysrq_key('g', &sysrq_fgldbg_op);
+     }
+     return 0;
+ }
+@@ -6800,11 +6800,11 @@
+ {
+     if(enable)
+     {
+-        register_sysrq_key('l', &sysrq_fgldump_op);
++        //register_sysrq_key('l', &sysrq_fgldump_op);
+     }     
+     else
+     {
+-        unregister_sysrq_key('l', &sysrq_fgldump_op);
++        //unregister_sysrq_key('l', &sysrq_fgldump_op);
+     }
+     return 0;
+ }

EOT

[ "$VER" = "8-8" ] && patch -p1 <<'EOT'
diff -Nru 8-8/packages/Ubuntu/dists/intrepid/dkms.conf.in 8-8.hotfix/packages/Ubuntu/dists/intrepid/dkms.conf.in
--- 8-8/packages/Ubuntu/dists/intrepid/dkms.conf.in	2008-08-18 13:45:43.000000000 +0200
+++ 8-8.hotfix/packages/Ubuntu/dists/intrepid/dkms.conf.in	2008-08-23 13:35:46.000000000 +0200
@@ -5,3 +5,7 @@
 MAKE[0]="pushd ${dkms_tree}/fglrx/#CVERSION#/build; sh make.sh --nohints --uname_r=$kernelver; popd"
 DEST_MODULE_LOCATION[0]="/kernel/drivers/char/drm"
 AUTOINSTALL="yes"
+PATCH[0]="2.6.27_support.patch"
+PATCH_MATCH[0]="^2.6.2[7-9]"
+PATCH[1]="2.6.27_sysrq_key_disable.patch"
+PATCH_MATCH[1]="^2.6.2[7-9]"
diff -Nru 8-8/packages/Ubuntu/dists/intrepid/fglrx-kernel-source.install.in 8-8.hotfix/packages/Ubuntu/dists/intrepid/fglrx-kernel-source.install.in
--- 8-8/packages/Ubuntu/dists/intrepid/fglrx-kernel-source.install.in	2008-08-18 13:45:43.000000000 +0200
+++ 8-8.hotfix/packages/Ubuntu/dists/intrepid/fglrx-kernel-source.install.in	2008-08-23 12:09:29.000000000 +0200
@@ -9,3 +9,4 @@
 debian/replacements/*				usr/src/fglrx-#CVERSION#
 arch/#ARCH#/lib/modules/fglrx/build_mod/lib*    usr/src/fglrx-#CVERSION#
 debian/dkms.conf                                usr/src/fglrx-#CVERSION#
+debian/patches					usr/src/fglrx-#CVERSION#
diff -Nru 8-8/packages/Ubuntu/dists/intrepid/patches/2.6.27_support.patch 8-8.hotfix/packages/Ubuntu/dists/intrepid/patches/2.6.27_support.patch
--- 8-8/packages/Ubuntu/dists/intrepid/patches/2.6.27_support.patch	1970-01-01 01:00:00.000000000 +0100
+++ 8-8.hotfix/packages/Ubuntu/dists/intrepid/patches/2.6.27_support.patch	2008-08-23 12:25:53.000000000 +0200
@@ -0,0 +1,53 @@
+diff -Nru fglrx-8.522/firegl_public.c fglrx-8.522.fix/firegl_public.c
+--- fglrx-8.522/firegl_public.c	2008-08-20 18:29:50.000000000 +0200
++++ fglrx-8.522.fix/firegl_public.c	2008-08-23 12:24:54.000000000 +0200
+@@ -3077,7 +3077,7 @@
+ {
+ #ifdef __SMP__
+     /* write back invalidate all other CPUs (exported by kernel) */
+-	if (smp_call_function(deferred_flush, NULL, 1, 0) != 0)
++	if (smp_call_function(deferred_flush, NULL, 0) != 0)
+ 		panic("timed out waiting for the other CPUs!\n");
+ 
+     /* invalidate this CPU */
+@@ -4796,7 +4796,7 @@
+ void ATI_API_CALL KCL_CallFuncOnOtherCpus(firegl_void_routine_t func_to_call) 
+ {
+ #ifdef CONFIG_SMP
+-	smp_call_function( firegl_smp_func_parameter_wrap, (void*)func_to_call, 0, 1 );
++	smp_call_function( firegl_smp_func_parameter_wrap, (void*)func_to_call, 1);
+ #endif
+ }
+ 
+@@ -4910,7 +4910,7 @@
+    }
+ 
+ #ifdef CONFIG_SMP
+-   if (smp_call_function(KCL_setup_pat, NULL, 0, 1) != 0)
++   if (smp_call_function(KCL_setup_pat, NULL, 1) != 0)
+        return 0;
+ #endif
+    KCL_setup_pat(NULL);
+@@ -4929,7 +4929,7 @@
+     }
+ 
+ #ifdef CONFIG_SMP
+-    if (smp_call_function(KCL_restore_pat, NULL, 0, 1) != 0)
++    if (smp_call_function(KCL_restore_pat, NULL, 1) != 0)
+        return;
+ #endif
+     KCL_restore_pat(NULL);
+diff -Nru fglrx-8.522/Makefile fglrx-8.522.fix/Makefile
+--- fglrx-8.522/Makefile	2008-08-20 18:29:50.000000000 +0200
++++ fglrx-8.522.fix/Makefile	2008-08-23 12:20:30.000000000 +0200
+@@ -21,6 +21,10 @@
+                 -DFGL_LINUX253P1_VMA_API \
+                 -DPAGE_ATTR_FIX=$(PAGE_ATTR_FIX) \
+ 
++PV_CPU := $(shell grep "D pv_cpu_ops" /boot/System.map-$(shell uname -r) | colrm 9)
++PV_LOCK := $(shell grep "D pv_lock_ops" /boot/System.map-$(shell uname -r) | colrm 9)
++EXTRA_LDFLAGS := --defsym pv_cpu_ops=0x$(PV_CPU) --defsym pv_lock_ops=0x$(PV_LOCK)
++
+ ifeq ($(KERNELRELEASE),)
+ # on first call from remote location we get into this path
+ # whilst on second call all is managed by the embedding kernel makefile
diff -Nru 8-8/packages/Ubuntu/dists/intrepid/patches/2.6.27_sysrq_key_disable.patch 8-8.hotfix/packages/Ubuntu/dists/intrepid/patches/2.6.27_sysrq_key_disable.patch
--- 8-8/packages/Ubuntu/dists/intrepid/patches/2.6.27_sysrq_key_disable.patch	1970-01-01 01:00:00.000000000 +0100
+++ 8-8.hotfix/packages/Ubuntu/dists/intrepid/patches/2.6.27_sysrq_key_disable.patch	2008-08-23 12:09:29.000000000 +0200
@@ -0,0 +1,31 @@
+diff -Nru fglrx-8.512.orig/firegl_public.c fglrx-8.512/firegl_public.c
+--- fglrx-8.512.orig/firegl_public.c	2008-08-18 23:01:41.000000000 +0200
++++ fglrx-8.512/firegl_public.c	2008-08-18 22:54:48.000000000 +0200
+@@ -6774,11 +6774,11 @@
+ {
+     if(enable)
+     {
+-        register_sysrq_key('g', &sysrq_fgldbg_op);
++        //register_sysrq_key('g', &sysrq_fgldbg_op);
+     }     
+     else
+     {
+-        unregister_sysrq_key('g', &sysrq_fgldbg_op);
++        //unregister_sysrq_key('g', &sysrq_fgldbg_op);
+     }
+     return 0;
+ }
+@@ -6800,11 +6800,11 @@
+ {
+     if(enable)
+     {
+-        register_sysrq_key('l', &sysrq_fgldump_op);
++        //register_sysrq_key('l', &sysrq_fgldump_op);
+     }     
+     else
+     {
+-        unregister_sysrq_key('l', &sysrq_fgldump_op);
++        //unregister_sysrq_key('l', &sysrq_fgldump_op);
+     }
+     return 0;
+ }
diff -Nru 8-8/packages/Ubuntu/dists/intrepid/rules 8-8.hotfix/packages/Ubuntu/dists/intrepid/rules
--- 8-8/packages/Ubuntu/dists/intrepid/rules	2008-08-18 13:45:43.000000000 +0200
+++ 8-8.hotfix/packages/Ubuntu/dists/intrepid/rules	2008-08-23 13:45:01.000000000 +0200
@@ -13,7 +13,7 @@
 #Kernel patches for newer development release kernel
 #In case these break stuff, don't apply to stable
 ifeq ($(DISTRO),intrepid)
-	include /usr/share/cdbs/1/rules/simple-patchsys.mk
+#	include /usr/share/cdbs/1/rules/simple-patchsys.mk
 endif
 
 #Directory naming schemes

EOT

[ "$VER" = "8-9" -o "$VER" = "8-10" ] && patch -p1 <<'EOT'
diff -Nru 8-9/packages/Ubuntu/dists/intrepid/dkms.conf.in 8-9.hotfix/packages/Ubuntu/dists/intrepid/dkms.conf.in
--- 8-9/packages/Ubuntu/dists/intrepid/dkms.conf.in	2008-09-17 22:01:09.000000000 +0200
+++ 8-9.hotfix/packages/Ubuntu/dists/intrepid/dkms.conf.in	2008-09-22 19:14:24.000000000 +0200
@@ -5,3 +5,5 @@
 MAKE[0]="pushd ${dkms_tree}/fglrx/#CVERSION#/build; sh make.sh --nohints --uname_r=$kernelver; popd"
 DEST_MODULE_LOCATION[0]="/kernel/drivers/char/drm"
 AUTOINSTALL="yes"
+PATCH[0]="2.6.27_support.patch"
+PATCH_MATCH[0]="^2.6.2[7-9]"
diff -Nru 8-9/packages/Ubuntu/dists/intrepid/fglrx-kernel-source.install.in 8-9.hotfix/packages/Ubuntu/dists/intrepid/fglrx-kernel-source.install.in
--- 8-9/packages/Ubuntu/dists/intrepid/fglrx-kernel-source.install.in	2008-09-17 22:01:09.000000000 +0200
+++ 8-9.hotfix/packages/Ubuntu/dists/intrepid/fglrx-kernel-source.install.in	2008-09-22 19:14:24.000000000 +0200
@@ -9,3 +9,4 @@
 debian/replacements/*				usr/src/fglrx-#CVERSION#
 arch/#ARCH#/lib/modules/fglrx/build_mod/lib*    usr/src/fglrx-#CVERSION#
 debian/dkms.conf                                usr/src/fglrx-#CVERSION#
+debian/patches                                  usr/src/fglrx-#CVERSION#
diff -Nru 8-9/packages/Ubuntu/dists/intrepid/patches/2.6.27_support.patch 8-9.hotfix/packages/Ubuntu/dists/intrepid/patches/2.6.27_support.patch
--- 8-9/packages/Ubuntu/dists/intrepid/patches/2.6.27_support.patch	1970-01-01 01:00:00.000000000 +0100
+++ 8-9.hotfix/packages/Ubuntu/dists/intrepid/patches/2.6.27_support.patch	2008-09-22 19:08:48.000000000 +0200
@@ -0,0 +1,98 @@
+diff -Nru fglrx-8.532.orig/firegl_public.c fglrx-8.532/firegl_public.c
+--- fglrx-8.532.orig/firegl_public.c	2008-09-22 18:58:41.000000000 +0200
++++ fglrx-8.532/firegl_public.c	2008-09-22 19:08:15.000000000 +0200
+@@ -199,6 +199,12 @@
+ #define preempt_enable()
+ #endif
+ 
++/* Since 2.6.27 smp_call_function doesn't have a nonatomic/retry argument */
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27)
++#define SMP_CALL_FUNCTION(func, info, retry, wait) smp_call_function(func, info, wait)
++#else
++#define SMP_CALL_FUNCTION(func, info, retry, wait) smp_call_function(func, info, retry, wait)
++#endif
+ // ============================================================
+ /* globals */
+ 
+@@ -250,7 +256,7 @@
+ const char BUILD_KERNEL_HAS_MODVERSIONS_CLEARED;
+ #endif
+ 
+-#ifdef __SMP__
++#ifdef CONFIG_SMP
+ const unsigned long __ke_SMP_State = 1;
+ const char BUILD_KERNEL_HAS_SMP_SET;
+ #else
+@@ -2516,8 +2522,8 @@
+ {
+ /*Some kernel developer removed the export of symbol "flush_tlb_page" on 2.6.25 x86_64 SMP kernel.
+   Define a simple version here.*/
+-#if defined(__x86_64__) && defined(__SMP__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25)) 
+-    on_each_cpu(KCL_flush_tlb_one, &va, 1, 1);
++#if defined(__x86_64__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25)) 
++    on_each_cpu(KCL_flush_tlb_one, &va, 1);
+ #else
+     flush_tlb_page(vma, va);
+ #endif
+@@ -2902,7 +2908,7 @@
+ 
+ /*****************************************************************************/
+ 
+-#ifdef __SMP__
++#ifdef CONFIG_SMP
+ static atomic_t cpus_waiting;
+ 
+ static void deferred_flush(void* contextp)
+@@ -2918,13 +2924,13 @@
+ 	while (atomic_read(&cpus_waiting) > 0)
+ 		barrier();
+ }
+-#endif /* __SMP__ */
++#endif /* CONFIG_SMP */
+ 
+ int ATI_API_CALL __ke_flush_cache(void)
+ {
+-#ifdef __SMP__
++#ifdef CONFIG_SMP
+     /* write back invalidate all other CPUs (exported by kernel) */
+-	if (smp_call_function(deferred_flush, NULL, 1, 0) != 0)
++	if (SMP_CALL_FUNCTION(deferred_flush, NULL, 1, 0) != 0)
+ 		panic("timed out waiting for the other CPUs!\n");
+ 
+     /* invalidate this CPU */
+@@ -2938,7 +2944,7 @@
+ 
+ 	while (atomic_read(&cpus_waiting) > 0)
+ 		barrier();
+-#else /* !__SMP__ */
++#else /* !CONFIG_SMP */
+ #if defined(__i386__) || defined(__x86_64__)
+ 	asm volatile ("wbinvd":::"memory");
+ #elif defined(__alpha__) || defined(__sparc__)
+@@ -2946,7 +2952,7 @@
+ #else
+ #error "Please define flush_cache for your architecture."
+ #endif
+-#endif /* !__SMP__ */
++#endif /* !CONFIG_SMP */
+ 
+     //for kernel 2.6.25, tlb_flush has been included when calling set_pages_*.
+     #if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,25)
+@@ -4654,7 +4660,7 @@
+    }
+ 
+ #ifdef CONFIG_SMP
+-   if (smp_call_function(KCL_setup_pat, NULL, 0, 1) != 0)
++   if (SMP_CALL_FUNCTION(KCL_setup_pat, NULL, 0, 1) != 0)
+        return 0;
+ #endif
+    KCL_setup_pat(NULL);
+@@ -4673,7 +4679,7 @@
+     }
+ 
+ #ifdef CONFIG_SMP
+-    if (smp_call_function(KCL_restore_pat, NULL, 0, 1) != 0)
++    if (SMP_CALL_FUNCTION(KCL_restore_pat, NULL, 0, 1) != 0)
+        return;
+ #endif
+     KCL_restore_pat(NULL);
diff -Nru 8-9/packages/Ubuntu/dists/intrepid/rules 8-9.hotfix/packages/Ubuntu/dists/intrepid/rules
--- 8-9/packages/Ubuntu/dists/intrepid/rules	2008-09-17 22:01:09.000000000 +0200
+++ 8-9.hotfix/packages/Ubuntu/dists/intrepid/rules	2008-09-22 19:14:24.000000000 +0200
@@ -13,7 +13,7 @@
 #Kernel patches for newer development release kernel
 #In case these break stuff, don't apply to stable
 ifeq ($(DISTRO),intrepid)
-	include /usr/share/cdbs/1/rules/simple-patchsys.mk
+#	include /usr/share/cdbs/1/rules/simple-patchsys.mk
 endif
 
 #Directory naming schemes

EOT

[ "$VER" = "8-11" ] && patch -p1 <<'EOT'
diff -Nru 8-11.orig/packages/Ubuntu/ati-packager.sh 8-11/packages/Ubuntu/ati-packager.sh
--- 8-11.orig/packages/Ubuntu/ati-packager.sh	2008-11-11 17:18:16.000000000 +0100
+++ 8-11/packages/Ubuntu/ati-packager.sh	2008-11-24 06:09:43.000000000 +0100
@@ -209,7 +209,7 @@
     case ${X_NAME} in
         gutsy|7.10)  X_DIR=x710; X_NAME=gutsy;;
         hardy|8.04)  X_DIR=x710; X_NAME=hardy;;
-        intrepid|8.10) X_DIR=x710; X_NAME=intrepid;;
+        intrepid|8.10) X_DIR=x740; X_NAME=intrepid;;
         source) X_DIR=x710; X_NAME=intrepid;;
         *)
         #Automatically detect
diff -Nru 8-11.orig/packages/Ubuntu/dists/hardy/replacements/Makefile 8-11/packages/Ubuntu/dists/hardy/replacements/Makefile
--- 8-11.orig/packages/Ubuntu/dists/hardy/replacements/Makefile	2008-11-11 17:18:16.000000000 +0100
+++ 8-11/packages/Ubuntu/dists/hardy/replacements/Makefile	2008-11-24 05:12:12.000000000 +0100
@@ -1,17 +1,63 @@
+# Copyright (c) 2008 Advanced Micro Devices. All Rights Reserved.
+# 
+# Redistribution and  use  in  source  and  binary  forms,  with  or  without
+# modification, are permitted provided that the following conditions are met:
+# 
+# 1. Redistributions of source code must retain the above  copyright  notice,
+# this list of conditions and the following disclaimer.
+# 
+# 2. Redistributions in  binary  form  must  reproduce  the  above  copyright
+# notice, this list  of  conditions  and  the  following  disclaimer  in  the
+# documentation and/or other materials provided with the distribution.
+# 
+# 3. The name of the author may not be used to endorse  or  promote  products
+# derived from this software without specific prior written permission.
+# 
+# THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR  IMPLIED
+# WARRANTIES, INCLUDING, BUT  NOT  LIMITED  TO,  THE  IMPLIED  WARRANTIES  OF
+# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN  NO
+# EVENT SHALL THE AUTHOR BE LIABLE  FOR  ANY  DIRECT,  INDIRECT,  INCIDENTAL,
+# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT  LIMITED
+# TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;  LOSS  OF  USE,  DATA,  OR
+# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED  AND  ON  ANY  THEORY  OF
+# LIABILITY, WHETHER  IN  CONTRACT,  STRICT  LIABILITY,  OR  TORT  (INCLUDING
+# NEGLIGENCE OR OTHERWISE) ARISING  IN  ANY  WAY  OUT  OF  THE  USE  OF  THIS
+# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
 GCC_VER_MAJ      = $(shell $(CC) --version | head -n 1 | sed -e 's/[^0-9. ]//g;s/^ *//;s/^\(.\)\..*$$/\1/')
 
 LIBIP_PREFIX	?= ..
 
 obj-m           += fglrx.o
 fglrx-libs      += libfglrx_ip.a.GCC$(GCC_VER_MAJ)
-fglrx-c-objs    += firegl_public.o
+
+fglrx-c-objs    += firegl_public.o      \
+                   kcl_acpi.o           \
+                   kcl_agp.o            \
+                   kcl_debug.o          \
+                   kcl_ioctl.o          \
+                   kcl_io.o             \
+                   kcl_pci.o            \
+                   kcl_str.o            \
+                   kcl_wait.o
+
 fglrx-objs      += $(fglrx-c-objs) $(fglrx-libs)
-fglrx-hdrs      += firegl_public.h fglrxko_pci_ids.h
-drm-hdrs        += drm.h drmP.h drm_os_linux.h drm_proc.h drm_compat.h
 
-ifeq ($(PAGE_ATTR_FIX),)
-PAGE_ATTR_FIX   =1
-endif
+fglrx-hdrs      += firegl_public.h      \
+                   fglrxko_pci_ids.h    \
+                   kcl_acpi.h           \
+                   kcl_agp.h            \
+                   kcl_config.h         \
+                   kcl_debug.h          \
+                   kcl_io.h             \
+                   kcl_ioctl.h          \
+                   kcl_osconfig.h       \
+                   kcl_pci.h            \
+                   kcl_str.h            \
+                   kcl_type.h           \
+                   kcl_wait.h
+                   
+drm-hdrs        += drm.h drmP.h drm_os_linux.h drm_proc.h drm_compat.h
 
 EXTRA_CFLAGS    += \
                 -I$(PWD) \
@@ -29,11 +75,7 @@
 KVER            = $(shell uname -r)
 endif
 
-ifeq (1,1)
 KDIR            = /lib/modules/$(KVER)/build
-else
-KDIR            = /usr/src/linux-$(KVER)
-endif
 PWD             = $(shell pwd)
 
 fglrx-cfiles    = ${fglrx-c-objs:.o=.c}
@@ -55,7 +97,7 @@
 # distclean:: clean
 
 clean::
-	rm -f *.c *.h *.o *.ko *.GCC* .??*
+	rm -rf *.c *.h *.o *.ko *.GCC* .??* *.symvers
 
 endif
 
diff -Nru 8-11.orig/packages/Ubuntu/dists/intrepid/replacements/Makefile 8-11/packages/Ubuntu/dists/intrepid/replacements/Makefile
--- 8-11.orig/packages/Ubuntu/dists/intrepid/replacements/Makefile	2008-11-11 17:18:16.000000000 +0100
+++ 8-11/packages/Ubuntu/dists/intrepid/replacements/Makefile	2008-11-24 05:12:12.000000000 +0100
@@ -1,17 +1,63 @@
+# Copyright (c) 2008 Advanced Micro Devices. All Rights Reserved.
+# 
+# Redistribution and  use  in  source  and  binary  forms,  with  or  without
+# modification, are permitted provided that the following conditions are met:
+# 
+# 1. Redistributions of source code must retain the above  copyright  notice,
+# this list of conditions and the following disclaimer.
+# 
+# 2. Redistributions in  binary  form  must  reproduce  the  above  copyright
+# notice, this list  of  conditions  and  the  following  disclaimer  in  the
+# documentation and/or other materials provided with the distribution.
+# 
+# 3. The name of the author may not be used to endorse  or  promote  products
+# derived from this software without specific prior written permission.
+# 
+# THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR  IMPLIED
+# WARRANTIES, INCLUDING, BUT  NOT  LIMITED  TO,  THE  IMPLIED  WARRANTIES  OF
+# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN  NO
+# EVENT SHALL THE AUTHOR BE LIABLE  FOR  ANY  DIRECT,  INDIRECT,  INCIDENTAL,
+# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT  LIMITED
+# TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;  LOSS  OF  USE,  DATA,  OR
+# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED  AND  ON  ANY  THEORY  OF
+# LIABILITY, WHETHER  IN  CONTRACT,  STRICT  LIABILITY,  OR  TORT  (INCLUDING
+# NEGLIGENCE OR OTHERWISE) ARISING  IN  ANY  WAY  OUT  OF  THE  USE  OF  THIS
+# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
 GCC_VER_MAJ      = $(shell $(CC) --version | head -n 1 | sed -e 's/[^0-9. ]//g;s/^ *//;s/^\(.\)\..*$$/\1/')
 
 LIBIP_PREFIX	?= ..
 
 obj-m           += fglrx.o
 fglrx-libs      += libfglrx_ip.a.GCC$(GCC_VER_MAJ)
-fglrx-c-objs    += firegl_public.o
+
+fglrx-c-objs    += firegl_public.o      \
+                   kcl_acpi.o           \
+                   kcl_agp.o            \
+                   kcl_debug.o          \
+                   kcl_ioctl.o          \
+                   kcl_io.o             \
+                   kcl_pci.o            \
+                   kcl_str.o            \
+                   kcl_wait.o
+
 fglrx-objs      += $(fglrx-c-objs) $(fglrx-libs)
-fglrx-hdrs      += firegl_public.h fglrxko_pci_ids.h
-drm-hdrs        += drm.h drmP.h drm_os_linux.h drm_proc.h drm_compat.h
 
-ifeq ($(PAGE_ATTR_FIX),)
-PAGE_ATTR_FIX   =1
-endif
+fglrx-hdrs      += firegl_public.h      \
+                   fglrxko_pci_ids.h    \
+                   kcl_acpi.h           \
+                   kcl_agp.h            \
+                   kcl_config.h         \
+                   kcl_debug.h          \
+                   kcl_io.h             \
+                   kcl_ioctl.h          \
+                   kcl_osconfig.h       \
+                   kcl_pci.h            \
+                   kcl_str.h            \
+                   kcl_type.h           \
+                   kcl_wait.h
+                   
+drm-hdrs        += drm.h drmP.h drm_os_linux.h drm_proc.h drm_compat.h
 
 EXTRA_CFLAGS    += \
                 -I$(PWD) \
@@ -29,11 +75,7 @@
 KVER            = $(shell uname -r)
 endif
 
-ifeq (1,1)
 KDIR            = /lib/modules/$(KVER)/build
-else
-KDIR            = /usr/src/linux-$(KVER)
-endif
 PWD             = $(shell pwd)
 
 fglrx-cfiles    = ${fglrx-c-objs:.o=.c}
@@ -55,7 +97,7 @@
 # distclean:: clean
 
 clean::
-	rm -f *.c *.h *.o *.ko *.GCC* .??*
+	rm -rf *.c *.h *.o *.ko *.GCC* .??* *.symvers
 
 endif
 
diff -Nru 8-11.orig/packages/Ubuntu/dists/intrepid/rules 8-11/packages/Ubuntu/dists/intrepid/rules
--- 8-11.orig/packages/Ubuntu/dists/intrepid/rules	2008-11-11 17:18:16.000000000 +0100
+++ 8-11/packages/Ubuntu/dists/intrepid/rules	2008-11-24 06:03:48.000000000 +0100
@@ -23,11 +23,11 @@
 ifeq ($(DEB_BUILD_ARCH),amd64)
 	LIBDIR=lib64
 	ARCH=x86_64
-	XARCH=x710_64a
+	XARCH=x740_64a
 else
 	LIBDIR=lib
 	ARCH=x86
-	XARCH=x710
+	XARCH=x740
 endif
 
 # Package names
diff -Nru 8-11.orig/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.postrm 8-11/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.postrm
--- 8-11.orig/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.postrm	2008-11-11 17:18:16.000000000 +0100
+++ 8-11/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.postrm	2008-11-24 05:49:34.000000000 +0100
@@ -23,6 +23,7 @@
 	dpkg-divert --remove --rename --package $PKGNAME --divert /usr/lib/fglrx/libGL.so.1.2.xlibmesa /usr/lib/libGL.so.1.2 > /dev/null
 	dpkg-divert --remove --rename --package $PKGNAME --divert /usr/lib32/fglrx/libGL.so.1.2.xlibmesa /usr/lib32/libGL.so.1.2 > /dev/null
 	dpkg-divert --remove --rename --package $PKGNAME --divert /usr/lib/fglrx/libdri.so.xlibmesa /usr/lib/xorg/modules/extensions/libdri.so > /dev/null
+	dpkg-divert --remove --rename --package $PKGNAME --divert /usr/lib/fglrx/libglx.so.xlibmesa /usr/lib/xorg/modules/extensions/libglx.so > /dev/null
     ;;
     
     upgrade|failed-upgrade|abort-install|abort-upgrade|disappear)
diff -Nru 8-11.orig/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.preinst 8-11/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.preinst
--- 8-11.orig/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.preinst	2008-11-11 17:18:16.000000000 +0100
+++ 8-11/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.preinst	2008-11-24 05:50:45.000000000 +0100
@@ -68,6 +68,7 @@
 	fi
 	dpkg-divert --add --rename --package $PKGNAME --divert /usr/lib/fglrx/libGL.so.1.2.xlibmesa /usr/lib/libGL.so.1.2 > /dev/null
 	dpkg-divert --add --rename --package $PKGNAME --divert /usr/lib/fglrx/libdri.so.xlibmesa /usr/lib/xorg/modules/extensions/libdri.so > /dev/null
+	dpkg-divert --add --rename --package $PKGNAME --divert /usr/lib/fglrx/libglx.so.xlibmesa /usr/lib/xorg/modules/extensions/libglx.so > /dev/null
 
 	if [ -n "$HAS_LIB32" ]; then
 		if [ ! -d /usr/lib32/fglrx ]; then

EOT

[ "$VER" = "8-12" ] && sed -i 's/\.so*/./' packages/Ubuntu/dists/*/libamdxvba1.install.in

case $VER in 9-3) patch -p1 << 'EOT'
diff -Nru 9-3.orig/packages/Ubuntu/dists/hardy/dkms/patches/2.6.29_support.patch 9-3/packages/Ubuntu/dists/hardy/dkms/patches/2.6.29_support.patch
--- 9-3.orig/packages/Ubuntu/dists/hardy/dkms/patches/2.6.29_support.patch	1970-01-01 01:00:00.000000000 +0100
+++ 9-3/packages/Ubuntu/dists/hardy/dkms/patches/2.6.29_support.patch	2009-10-20 13:13:06.433473909 +0200
@@ -0,0 +1,96 @@
+diff -Nru fglrx-8.593.orig/firegl_public.c fglrx-8.593/firegl_public.c
+--- fglrx-8.593.orig/firegl_public.c	2009-10-20 12:23:28.000000000 +0200
++++ fglrx-8.593/firegl_public.c	2009-10-20 12:55:58.364468070 +0200
+@@ -1402,7 +1402,11 @@
+  */
+ KCL_TYPE_Uid ATI_API_CALL KCL_GetEffectiveUid(void)
+ {
++#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,28)
++    return current->cred->euid;
++#else
+     return current->euid;
++#endif
+ }
+ 
+ /** /brief Delay execution for the specified number of microseconds
+@@ -1774,15 +1778,30 @@
+  */
+ void ATI_API_CALL KCL_PosixSecurityCapSetIPCLock(unsigned int lock)
+ {
++
++#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,28)
++    struct cred *new = prepare_creds();
++    if (!new) {
++	    printk(KERN_ERR "fglrx: could not allocate memory\n");
++	    return;
++    }
++#else
++#define new current
++#endif
+     if (lock == 0 )
+     {
+-        cap_lower(current->cap_effective, CAP_IPC_LOCK);
++        cap_lower(new->cap_effective, CAP_IPC_LOCK);
+     }
+     else
+     {
+-        cap_raise(current->cap_effective, CAP_IPC_LOCK);
++        cap_raise(new->cap_effective, CAP_IPC_LOCK);
+     }    
+-    return; 
++
++#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,28)
++    commit_creds(new);
++#else
++#undef new
++#endif
+ }
+ 
+ /** \brief Get number of available RAM pages
+diff -Nru fglrx-8.593.orig/firegl_public.h fglrx-8.593/firegl_public.h
+--- fglrx-8.593.orig/firegl_public.h	2009-10-20 12:23:28.000000000 +0200
++++ fglrx-8.593/firegl_public.h	2009-10-20 12:55:58.364468070 +0200
+@@ -18,6 +18,7 @@
+ #define _FIREGL_PUBLIC_H_
+ 
+ #include <stdarg.h>
++#include <asm/pgtable.h>
+ #include "kcl_pci.h"
+ #include "kcl_io.h"
+ 
+@@ -591,6 +592,11 @@
+ #define cpu_has_pge test_bit(X86_FEATURE_PGE, &boot_cpu_data.x86_capability)
+ #endif
+ 
++#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,28)
++#undef pgprot_writecombine
++#undef pgprot_noncached
++#endif
++
+ #ifndef pgprot_writecombine
+ #define pgprot_writecombine(prot) __pgprot((pgprot_val(prot) & ~(_PAGE_PCD)) | _PAGE_PWT)
+ #endif
+@@ -599,6 +605,7 @@
+ #define pgprot_noncached(prot) __pgprot(pgprot_val(prot) | _PAGE_PCD | _PAGE_PWT)
+ #endif
+ 
++
+ #endif //FIREGL_USWC_SUPPORT
+ 
+ 
+diff -Nru fglrx-8.593.orig/kcl_acpi.c fglrx-8.593/kcl_acpi.c
+--- fglrx-8.593.orig/kcl_acpi.c	2009-10-20 12:23:28.000000000 +0200
++++ fglrx-8.593/kcl_acpi.c	2009-10-20 12:57:47.369195556 +0200
+@@ -18,6 +18,12 @@
+ #include <linux/autoconf.h>
+ #include <linux/acpi.h>
+ 
++#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,28)
++#include <../drivers/acpi/acpica/acconfig.h>
++#include <../drivers/acpi/acpica/aclocal.h>
++#include <../drivers/acpi/acpica/acobject.h>
++#endif
++
+ #include "kcl_config.h"
+ #include "kcl_type.h"
+ #include "kcl_acpi.h"
diff -Nru 9-3.orig/packages/Ubuntu/dists/hardy/dkms/patches/2.6.30_support.patch 9-3/packages/Ubuntu/dists/hardy/dkms/patches/2.6.30_support.patch
--- 9-3.orig/packages/Ubuntu/dists/hardy/dkms/patches/2.6.30_support.patch	1970-01-01 01:00:00.000000000 +0100
+++ 9-3/packages/Ubuntu/dists/hardy/dkms/patches/2.6.30_support.patch	2009-10-20 13:13:13.576486505 +0200
@@ -0,0 +1,89 @@
+diff -Nru fglrx-8.593.orig/drm_os_linux.h fglrx-8.593/drm_os_linux.h
+--- fglrx-8.593.orig/drm_os_linux.h	2009-10-20 12:23:28.000000000 +0200
++++ fglrx-8.593/drm_os_linux.h	2009-10-20 13:08:26.689014147 +0200
+@@ -42,10 +42,12 @@
+ #define DRM_IRQ_ARGS		int irq, void *arg, struct pt_regs *regs
+ /** backwards compatibility with old irq return values */
+ #ifndef IRQ_HANDLED
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,30)
+ typedef void irqreturn_t;
+ #define IRQ_HANDLED   /* nothing */
+ #define IRQ_NONE      /* nothing */
+ #endif
++#endif
+ 
+ /** AGP types */
+ #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,70)
+diff -Nru fglrx-8.593.orig/firegl_public.c fglrx-8.593/firegl_public.c
+--- fglrx-8.593.orig/firegl_public.c	2009-10-20 13:07:27.880473391 +0200
++++ fglrx-8.593/firegl_public.c	2009-10-20 13:09:42.392475262 +0200
+@@ -31,6 +31,7 @@
+ #include <linux/autoconf.h>
+ 
+ #if !defined(CONFIG_X86_PC) 
++#if !defined(CONFIG_X86_XEN)
+ #if !defined(CONFIG_X86_64)
+ #if !defined(CONFIG_X86_VOYAGER)
+ #if !defined(CONFIG_X86_NUMAQ)
+@@ -38,6 +39,7 @@
+ #if !defined(CONFIG_X86_BIGSMP)
+ #if !defined(CONFIG_X86_VISWS)
+ #if !defined(CONFIG_X86_GENERICARCH)
++#if !defined(CONFIG_X86_32)
+ #error unknown or undefined architecture configured
+ #endif
+ #endif
+@@ -47,6 +49,8 @@
+ #endif
+ #endif
+ #endif
++#endif
++#endif
+ 
+ /* The dirty-page-tracking patch included in NLD 9 SMP kernels defines
+  * a static inline function that uses a GPL-only symbol in a header
+@@ -1239,7 +1243,11 @@
+    int process_terminated = 1;
+   
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
++#if !defined(CONFIG_PREEMPT_RT)
+    rcu_read_lock();
++#else
++   preempt_disable();
++#endif
+ #else   
+    read_lock(&tasklist_lock);
+ #endif   
+@@ -1260,7 +1268,11 @@
+       }
+    }   
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
++#if !defined(CONFIG_PREEMPT_RT)
+    rcu_read_unlock();
++#else
++   preempt_disable();
++#endif
+ #else   
+    read_unlock(&tasklist_lock);
+ #endif   
+@@ -2275,7 +2287,7 @@
+  * kernel <  2.6.27, on_each_cpu has 4 parameters.
+  * kernel >= 2.6.27, on_each_cpu has 3 parameters (removed the "retry" parameter)
+  */
+-#if defined(__x86_64__) && defined(__SMP__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25)) 
++#if defined(CONFIG_SMP) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25))
+ #   if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,27))
+         on_each_cpu(KCL_flush_tlb_one, &va, 1, 1);
+ #   else
+diff -Nru fglrx-8.593.orig/kcl_pci.c fglrx-8.593/kcl_pci.c
+--- fglrx-8.593.orig/kcl_pci.c	2009-10-20 12:23:28.000000000 +0200
++++ fglrx-8.593/kcl_pci.c	2009-10-20 13:08:26.689014147 +0200
+@@ -310,3 +310,8 @@
+ }
+ #endif //__x86_64__
+ 
++#undef pci_enable_msi
++int pci_enable_msi(struct pci_dev *pdev)
++{
++return pci_enable_msi_block(pdev, 1);
++}
diff -Nru 9-3.orig/packages/Ubuntu/dists/hardy/dkms.conf.in 9-3/packages/Ubuntu/dists/hardy/dkms.conf.in
--- 9-3.orig/packages/Ubuntu/dists/hardy/dkms.conf.in	2009-03-18 16:07:25.000000000 +0100
+++ 9-3/packages/Ubuntu/dists/hardy/dkms.conf.in	2009-10-20 12:18:44.822305379 +0200
@@ -7,3 +7,7 @@
 AUTOINSTALL="yes"
 PATCH[0]="fglrx-rt-compat.patch"
 PATCH_MATCH[0]="rt"
+PATCH[1]="2.6.29_support.patch"
+PATCH_MATCH[1]="2.6.(29|3[0-9])"
+PATCH[2]="2.6.30_support.patch"
+PATCH_MATCH[2]="2.6.3[0-9]"
diff -Nru 9-3.orig/packages/Ubuntu/dists/intrepid/dkms/patches/2.6.29_support.patch 9-3/packages/Ubuntu/dists/intrepid/dkms/patches/2.6.29_support.patch
--- 9-3.orig/packages/Ubuntu/dists/intrepid/dkms/patches/2.6.29_support.patch	1970-01-01 01:00:00.000000000 +0100
+++ 9-3/packages/Ubuntu/dists/intrepid/dkms/patches/2.6.29_support.patch	2009-10-20 13:13:28.037469742 +0200
@@ -0,0 +1,96 @@
+diff -Nru fglrx-8.593.orig/firegl_public.c fglrx-8.593/firegl_public.c
+--- fglrx-8.593.orig/firegl_public.c	2009-10-20 12:23:28.000000000 +0200
++++ fglrx-8.593/firegl_public.c	2009-10-20 12:55:58.364468070 +0200
+@@ -1402,7 +1402,11 @@
+  */
+ KCL_TYPE_Uid ATI_API_CALL KCL_GetEffectiveUid(void)
+ {
++#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,28)
++    return current->cred->euid;
++#else
+     return current->euid;
++#endif
+ }
+ 
+ /** /brief Delay execution for the specified number of microseconds
+@@ -1774,15 +1778,30 @@
+  */
+ void ATI_API_CALL KCL_PosixSecurityCapSetIPCLock(unsigned int lock)
+ {
++
++#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,28)
++    struct cred *new = prepare_creds();
++    if (!new) {
++	    printk(KERN_ERR "fglrx: could not allocate memory\n");
++	    return;
++    }
++#else
++#define new current
++#endif
+     if (lock == 0 )
+     {
+-        cap_lower(current->cap_effective, CAP_IPC_LOCK);
++        cap_lower(new->cap_effective, CAP_IPC_LOCK);
+     }
+     else
+     {
+-        cap_raise(current->cap_effective, CAP_IPC_LOCK);
++        cap_raise(new->cap_effective, CAP_IPC_LOCK);
+     }    
+-    return; 
++
++#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,28)
++    commit_creds(new);
++#else
++#undef new
++#endif
+ }
+ 
+ /** \brief Get number of available RAM pages
+diff -Nru fglrx-8.593.orig/firegl_public.h fglrx-8.593/firegl_public.h
+--- fglrx-8.593.orig/firegl_public.h	2009-10-20 12:23:28.000000000 +0200
++++ fglrx-8.593/firegl_public.h	2009-10-20 12:55:58.364468070 +0200
+@@ -18,6 +18,7 @@
+ #define _FIREGL_PUBLIC_H_
+ 
+ #include <stdarg.h>
++#include <asm/pgtable.h>
+ #include "kcl_pci.h"
+ #include "kcl_io.h"
+ 
+@@ -591,6 +592,11 @@
+ #define cpu_has_pge test_bit(X86_FEATURE_PGE, &boot_cpu_data.x86_capability)
+ #endif
+ 
++#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,28)
++#undef pgprot_writecombine
++#undef pgprot_noncached
++#endif
++
+ #ifndef pgprot_writecombine
+ #define pgprot_writecombine(prot) __pgprot((pgprot_val(prot) & ~(_PAGE_PCD)) | _PAGE_PWT)
+ #endif
+@@ -599,6 +605,7 @@
+ #define pgprot_noncached(prot) __pgprot(pgprot_val(prot) | _PAGE_PCD | _PAGE_PWT)
+ #endif
+ 
++
+ #endif //FIREGL_USWC_SUPPORT
+ 
+ 
+diff -Nru fglrx-8.593.orig/kcl_acpi.c fglrx-8.593/kcl_acpi.c
+--- fglrx-8.593.orig/kcl_acpi.c	2009-10-20 12:23:28.000000000 +0200
++++ fglrx-8.593/kcl_acpi.c	2009-10-20 12:57:47.369195556 +0200
+@@ -18,6 +18,12 @@
+ #include <linux/autoconf.h>
+ #include <linux/acpi.h>
+ 
++#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,28)
++#include <../drivers/acpi/acpica/acconfig.h>
++#include <../drivers/acpi/acpica/aclocal.h>
++#include <../drivers/acpi/acpica/acobject.h>
++#endif
++
+ #include "kcl_config.h"
+ #include "kcl_type.h"
+ #include "kcl_acpi.h"
diff -Nru 9-3.orig/packages/Ubuntu/dists/intrepid/dkms/patches/2.6.30_support.patch 9-3/packages/Ubuntu/dists/intrepid/dkms/patches/2.6.30_support.patch
--- 9-3.orig/packages/Ubuntu/dists/intrepid/dkms/patches/2.6.30_support.patch	1970-01-01 01:00:00.000000000 +0100
+++ 9-3/packages/Ubuntu/dists/intrepid/dkms/patches/2.6.30_support.patch	2009-10-20 13:13:21.492468210 +0200
@@ -0,0 +1,89 @@
+diff -Nru fglrx-8.593.orig/drm_os_linux.h fglrx-8.593/drm_os_linux.h
+--- fglrx-8.593.orig/drm_os_linux.h	2009-10-20 12:23:28.000000000 +0200
++++ fglrx-8.593/drm_os_linux.h	2009-10-20 13:08:26.689014147 +0200
+@@ -42,10 +42,12 @@
+ #define DRM_IRQ_ARGS		int irq, void *arg, struct pt_regs *regs
+ /** backwards compatibility with old irq return values */
+ #ifndef IRQ_HANDLED
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,30)
+ typedef void irqreturn_t;
+ #define IRQ_HANDLED   /* nothing */
+ #define IRQ_NONE      /* nothing */
+ #endif
++#endif
+ 
+ /** AGP types */
+ #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,70)
+diff -Nru fglrx-8.593.orig/firegl_public.c fglrx-8.593/firegl_public.c
+--- fglrx-8.593.orig/firegl_public.c	2009-10-20 13:07:27.880473391 +0200
++++ fglrx-8.593/firegl_public.c	2009-10-20 13:09:42.392475262 +0200
+@@ -31,6 +31,7 @@
+ #include <linux/autoconf.h>
+ 
+ #if !defined(CONFIG_X86_PC) 
++#if !defined(CONFIG_X86_XEN)
+ #if !defined(CONFIG_X86_64)
+ #if !defined(CONFIG_X86_VOYAGER)
+ #if !defined(CONFIG_X86_NUMAQ)
+@@ -38,6 +39,7 @@
+ #if !defined(CONFIG_X86_BIGSMP)
+ #if !defined(CONFIG_X86_VISWS)
+ #if !defined(CONFIG_X86_GENERICARCH)
++#if !defined(CONFIG_X86_32)
+ #error unknown or undefined architecture configured
+ #endif
+ #endif
+@@ -47,6 +49,8 @@
+ #endif
+ #endif
+ #endif
++#endif
++#endif
+ 
+ /* The dirty-page-tracking patch included in NLD 9 SMP kernels defines
+  * a static inline function that uses a GPL-only symbol in a header
+@@ -1239,7 +1243,11 @@
+    int process_terminated = 1;
+   
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
++#if !defined(CONFIG_PREEMPT_RT)
+    rcu_read_lock();
++#else
++   preempt_disable();
++#endif
+ #else   
+    read_lock(&tasklist_lock);
+ #endif   
+@@ -1260,7 +1268,11 @@
+       }
+    }   
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
++#if !defined(CONFIG_PREEMPT_RT)
+    rcu_read_unlock();
++#else
++   preempt_disable();
++#endif
+ #else   
+    read_unlock(&tasklist_lock);
+ #endif   
+@@ -2275,7 +2287,7 @@
+  * kernel <  2.6.27, on_each_cpu has 4 parameters.
+  * kernel >= 2.6.27, on_each_cpu has 3 parameters (removed the "retry" parameter)
+  */
+-#if defined(__x86_64__) && defined(__SMP__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25)) 
++#if defined(CONFIG_SMP) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,25))
+ #   if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,27))
+         on_each_cpu(KCL_flush_tlb_one, &va, 1, 1);
+ #   else
+diff -Nru fglrx-8.593.orig/kcl_pci.c fglrx-8.593/kcl_pci.c
+--- fglrx-8.593.orig/kcl_pci.c	2009-10-20 12:23:28.000000000 +0200
++++ fglrx-8.593/kcl_pci.c	2009-10-20 13:08:26.689014147 +0200
+@@ -310,3 +310,8 @@
+ }
+ #endif //__x86_64__
+ 
++#undef pci_enable_msi
++int pci_enable_msi(struct pci_dev *pdev)
++{
++return pci_enable_msi_block(pdev, 1);
++}
diff -Nru 9-3.orig/packages/Ubuntu/dists/intrepid/dkms.conf.in 9-3/packages/Ubuntu/dists/intrepid/dkms.conf.in
--- 9-3.orig/packages/Ubuntu/dists/intrepid/dkms.conf.in	2009-03-18 16:07:25.000000000 +0100
+++ 9-3/packages/Ubuntu/dists/intrepid/dkms.conf.in	2009-10-20 12:18:54.350294972 +0200
@@ -7,3 +7,7 @@
 AUTOINSTALL="yes"
 PATCH[0]="fglrx-rt-compat.patch"
 PATCH_MATCH[0]="rt"
+PATCH[1]="2.6.29_support.patch"
+PATCH_MATCH[1]="2.6.(29|3[0-9])"
+PATCH[2]="2.6.30_support.patch"
+PATCH_MATCH[2]="2.6.3[0-9]"

EOT
;;
esac

case $VER in 9-12|8.682.2) patch -p1 << 'EOT'
diff -Nru 9-12.orig/packages/Ubuntu/dists/hardy/rules 9-12/packages/Ubuntu/dists/hardy/rules
--- 9-12.orig/packages/Ubuntu/dists/hardy/rules	2009-12-02 18:32:39.000000000 +0100
+++ 9-12/packages/Ubuntu/dists/hardy/rules	2009-12-07 02:48:19.000000000 +0100
@@ -121,7 +121,12 @@
 	dh_install -p$(PKG_driver) "arch/x86/usr/lib/*"                     "usr/lib32"
 	dh_installdirs -p$(PKG_driver) "usr/lib32/fglrx"
 
+
+	#they don't provide the symlink for us (starting at 8.699)
+	dh_link -p$(PKG_driver) usr/lib32/libatiuki.so.1.0 usr/lib32/libatiuki.so.1
 endif
+	#they don't provide the symlink for us (starting at 8.699)
+	dh_link -p$(PKG_driver) usr/lib/libatiuki.so.1.0 usr/lib/libatiuki.so.1
 
 	dh_installdocs -p$(PKG_driver) usr/share/doc/fglrx/* --exclude ATI_LICENSE.TXT
 	dh_installinit -p$(PKG_driver) --name="atieventsd" --no-start --update-rcd-params="defaults 31"
diff -Nru 9-12.orig/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.install.in 9-12/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.install.in
--- 9-12.orig/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.install.in	2009-12-02 18:32:39.000000000 +0100
+++ 9-12/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.install.in	2009-12-07 02:48:19.000000000 +0100
@@ -26,3 +26,6 @@
 
 #CAL stuff
 arch/#ARCH#/usr/#LIBDIR#/*                     usr/lib
+
+#Install QT4 libraries that weren't around for 9.04 and earlier
+arch/#ARCH#/usr/share/ati/#LIBDIR#             usr/share/ati
diff -Nru 9-12.orig/packages/Ubuntu/dists/intrepid/rules 9-12/packages/Ubuntu/dists/intrepid/rules
--- 9-12.orig/packages/Ubuntu/dists/intrepid/rules	2009-12-02 18:32:39.000000000 +0100
+++ 9-12/packages/Ubuntu/dists/intrepid/rules	2009-12-07 02:48:19.000000000 +0100
@@ -121,7 +121,12 @@
 	dh_install -p$(PKG_driver) "arch/x86/usr/lib/*"                     "usr/lib32"
 	dh_installdirs -p$(PKG_driver) "usr/lib32/fglrx"
 
+
+	#they don't provide the symlink for us (starting at 8.699)
+	dh_link -p$(PKG_driver) usr/lib32/libatiuki.so.1.0 usr/lib32/libatiuki.so.1
 endif
+	#they don't provide the symlink for us (starting at 8.699)
+	dh_link -p$(PKG_driver) usr/lib/libatiuki.so.1.0 usr/lib/libatiuki.so.1
 
 	dh_installdocs -p$(PKG_driver) usr/share/doc/fglrx/* --exclude ATI_LICENSE.TXT
 	dh_installinit -p$(PKG_driver) --name="atieventsd" --no-start --update-rcd-params="defaults 31"
diff -Nru 9-12.orig/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.install.in 9-12/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.install.in
--- 9-12.orig/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.install.in	2009-12-02 18:32:39.000000000 +0100
+++ 9-12/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.install.in	2009-12-07 02:48:19.000000000 +0100
@@ -26,3 +26,6 @@
 
 #CAL stuff
 arch/#ARCH#/usr/#LIBDIR#/*                     usr/lib
+
+#Install QT4 libraries that weren't around for 9.04 and earlier
+arch/#ARCH#/usr/share/ati/#LIBDIR#             usr/share/ati

EOT
;;
esac

case $VER in 10-1) patch -p1 << 'EOT'
diff -Nru 10-1/packages/Ubuntu/ati-packager.sh 10-1.fix/packages/Ubuntu/ati-packager.sh
--- 10-1/packages/Ubuntu/ati-packager.sh	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/ati-packager.sh	2010-01-28 01:59:52.000000000 +0100
@@ -62,7 +62,7 @@
     release=$1
 
     #if we don't know what we're working with, assume it's supported by the source target
-    if [ ! -d packages/Ubuntu/dists/$release/control ]; then
+    if [ ! -d packages/Ubuntu/dists/$release ]; then
         release="source"
     fi
 
@@ -322,9 +322,9 @@
 lsb()
 {
     lsb_launcher=`which lsb_release 2>/dev/null`
-    if [ ! -z "$lsb_launcher" ]; then
+    if [ ! -z "$lsb_launcher" ] && [ `lsb_release -i -s` = "Ubuntu" ]; then
         echo `lsb_release -s -c`
-    else
+    elif [ -f /etc/lsb-release ] && [ `grep ID /etc/lsb-release | awk -F"=" '{ print $2 }'` = "Ubuntu" ]; then
         echo `grep CODENAME /etc/lsb-release | awk -F"=" '{ print $2 }'`
     fi
 }
diff -Nru 10-1/packages/Ubuntu/dists/hardy/control 10-1.fix/packages/Ubuntu/dists/hardy/control
--- 10-1/packages/Ubuntu/dists/hardy/control	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/hardy/control	2010-01-28 01:59:52.000000000 +0100
@@ -15,9 +15,7 @@
                fakeroot, 
                libdrm2,
                libgl1-mesa-glx,
-               libxinerama1,
-               libqtgui4,
-               execstack
+               libxinerama1
 Standards-Version: 3.8.0
 Homepage: http://ati.amd.com/support/driver.html
 
diff -Nru 10-1/packages/Ubuntu/dists/hardy/dkms/patches/fglrx-rt-compat.patch 10-1.fix/packages/Ubuntu/dists/hardy/dkms/patches/fglrx-rt-compat.patch
--- 10-1/packages/Ubuntu/dists/hardy/dkms/patches/fglrx-rt-compat.patch	1970-01-01 01:00:00.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/hardy/dkms/patches/fglrx-rt-compat.patch	2009-12-02 08:54:53.000000000 +0100
@@ -0,0 +1,26 @@
+--- a/firegl_public.c
++++ b/firegl_public.c
+@@ -1352,7 +1352,11 @@
+    int process_terminated = 1;
+   
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
++#if !defined(CONFIG_PREEMPT_RT)
+    rcu_read_lock();
++#else
++   preempt_disable();
++#endif
+ #else   
+    read_lock(&tasklist_lock);
+ #endif   
+@@ -1373,7 +1377,11 @@
+       }
+    }   
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
++#if !defined(CONFIG_PREEMPT_RT)
+    rcu_read_unlock();
++#else
++   preempt_enable();
++#endif
+ #else   
+    read_unlock(&tasklist_lock);
+ #endif   
diff -Nru 10-1/packages/Ubuntu/dists/hardy/dkms.conf.in 10-1.fix/packages/Ubuntu/dists/hardy/dkms.conf.in
--- 10-1/packages/Ubuntu/dists/hardy/dkms.conf.in	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/hardy/dkms.conf.in	2010-01-28 01:59:52.000000000 +0100
@@ -6,6 +6,6 @@
 DEST_MODULE_LOCATION[0]="/kernel/drivers/char/drm"
 AUTOINSTALL="yes"
 PATCH[0]="rt_preempt_28.patch"
-PATCH_MATCH[0]="2.6.28"
+PATCH_MATCH[0]="^2.6.28\-[0-9]*\-rt$"
 PATCH[1]="rt_preempt_31.patch"
-PATCH_MATCH[1]="2.6.31"
+PATCH_MATCH[1]="^2.6.31\-[0-9]*\-rt$"
diff -Nru 10-1/packages/Ubuntu/dists/hardy/rules 10-1.fix/packages/Ubuntu/dists/hardy/rules
--- 10-1/packages/Ubuntu/dists/hardy/rules	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/hardy/rules	2010-01-28 01:59:52.000000000 +0100
@@ -121,22 +121,12 @@
 	dh_install -p$(PKG_driver) "arch/x86/usr/lib/*"                     "usr/lib32"
 	dh_installdirs -p$(PKG_driver) "usr/lib32/fglrx"
 
-	for i in \
-			debian/$(PKG_driver)/$(DRIDIR32)/dri/fglrx_dri.so \
-			debian/$(PKG_driver)/usr/lib32/libGL.so.* \
-			; do execstack -q $$i; execstack -c $$i; done
 
+	#they don't provide the symlink for us (starting at 8.699)
+	dh_link -p$(PKG_driver) usr/lib32/libatiuki.so.1.0 usr/lib32/libatiuki.so.1
 endif
+	#they don't provide the symlink for us (starting at 8.699)
+	dh_link -p$(PKG_driver) usr/lib/libatiuki.so.1.0 usr/lib/libatiuki.so.1
 
 	dh_installdocs -p$(PKG_driver) usr/share/doc/fglrx/* --exclude ATI_LICENSE.TXT
 	dh_installinit -p$(PKG_driver) --name="atieventsd" --no-start --update-rcd-params="defaults 31"
-
-	for i in \
-			debian/$(PKG_driver)/usr/bin/atiode \
-			debian/$(PKG_driver)/usr/sbin/amdnotifyui \
-			debian/$(PKG_driver)/usr/lib/dri/fglrx_dri.so \
-			debian/$(PKG_driver)/usr/lib/libGL.so.* \
-			; do execstack -q $$i; execstack -c $$i; done
-
-binary-install/$(PKG_control)::
-	execstack -c debian/$(PKG_control)/usr/bin/amdcccle
diff -Nru 10-1/packages/Ubuntu/dists/hardy/xorg-driver-fglrx-dev.install.in 10-1.fix/packages/Ubuntu/dists/hardy/xorg-driver-fglrx-dev.install.in
--- 10-1/packages/Ubuntu/dists/hardy/xorg-driver-fglrx-dev.install.in	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/hardy/xorg-driver-fglrx-dev.install.in	2010-01-28 01:59:52.000000000 +0100
@@ -1,7 +1,7 @@
-debian/overrides/xorg-driver-fglrx-dev usr/share/lintian/overrides
+debian/overrides/xorg-driver-fglrx-dev                  usr/share/lintian/overrides
 
-usr/include/*                          usr/include
-usr/X11R6/include/*                    usr/include
+usr/include/*                               usr/include
+usr/X11R6/include/*                         usr/include
 
 #XARCH#/usr/X11R6/#LIBDIR#/modules/*.a      usr/lib
-arch/#ARCH#/usr/X11R6/#LIBDIR#/*.a     usr/lib
+arch/#ARCH#/usr/X11R6/#LIBDIR#/*.a          usr/lib
diff -Nru 10-1/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.install.in 10-1.fix/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.install.in
--- 10-1/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.install.in	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.install.in	2010-01-28 01:59:52.000000000 +0100
@@ -26,3 +26,6 @@
 
 #CAL stuff
 arch/#ARCH#/usr/#LIBDIR#/*                     usr/lib
+
+#Install QT4 libraries that weren't around for 9.04 and earlier
+arch/#ARCH#/usr/share/ati/#LIBDIR#             usr/share/ati
diff -Nru 10-1/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.postrm 10-1.fix/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.postrm
--- 10-1/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.postrm	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.postrm	2010-01-28 01:59:52.000000000 +0100
@@ -22,10 +22,9 @@
     remove|purge)
 	dpkg-divert --remove --rename --package $PKGNAME --divert /usr/lib/fglrx/libGL.so.1.2.xlibmesa /usr/lib/libGL.so.1.2 > /dev/null
 	dpkg-divert --remove --rename --package $PKGNAME --divert /usr/lib32/fglrx/libGL.so.1.2.xlibmesa /usr/lib32/libGL.so.1.2 > /dev/null
-	dpkg-divert --remove --rename --package $PKGNAME --divert /usr/lib/fglrx/libdri.so.xlibmesa /usr/lib/xorg/modules/extensions/libdri.so > /dev/null
 	dpkg-divert --remove --rename --package $PKGNAME --divert /usr/lib/fglrx/libglx.so.xlibmesa /usr/lib/xorg/modules/extensions/libglx.so > /dev/null
     ;;
-    
+
     upgrade|failed-upgrade|abort-install|abort-upgrade|disappear)
         ;;
 
diff -Nru 10-1/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.preinst 10-1.fix/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.preinst
--- 10-1/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.preinst	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.preinst	2010-01-28 01:59:52.000000000 +0100
@@ -71,6 +71,12 @@
              /usr/X11R6/lib32/libGL.so.1.2 ; do \
 	dpkg-divert --remove --package $PKGNAME $i > /dev/null; \
      done
+
+    #before 8.699 we had to divert libdri
+    dpkg-divert --remove --rename --package $PKGNAME \
+        --divert /usr/lib/fglrx/libdri.so.xlibmesa   \
+        /usr/lib/xorg/modules/extensions/libdri.so > /dev/null
+
 }
 
 case "$1" in
@@ -84,7 +90,6 @@
 		mkdir -p /usr/lib/fglrx
 	fi
 	dpkg-divert --add --rename --package $PKGNAME --divert /usr/lib/fglrx/libGL.so.1.2.xlibmesa /usr/lib/libGL.so.1.2 > /dev/null
-	dpkg-divert --add --rename --package $PKGNAME --divert /usr/lib/fglrx/libdri.so.xlibmesa /usr/lib/xorg/modules/extensions/libdri.so > /dev/null
 	dpkg-divert --add --rename --package $PKGNAME --divert /usr/lib/fglrx/libglx.so.xlibmesa /usr/lib/xorg/modules/extensions/libglx.so > /dev/null
 
 	if [ -n "$HAS_LIB32" ]; then
@@ -105,6 +110,10 @@
 	mv_conffile "/etc/ati/logo_mask.xbm.example"
 	mv_conffile "/etc/ati/signature"
 	mv_conffile "/etc/ati/logo.xbm.example"
+
+        ## Just in case they installed without debs before, finish a proper uninstall routine ##
+        ## This will error out on any failure (which should be cleaned up anyway before installing debs) ##
+        [ -x /usr/share/ati/fglrx-uninstall.sh ] && /usr/share/ati/fglrx-uninstall.sh
     ;;
 
     abort-upgrade)
diff -Nru 10-1/packages/Ubuntu/dists/intrepid/control 10-1.fix/packages/Ubuntu/dists/intrepid/control
--- 10-1/packages/Ubuntu/dists/intrepid/control	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/intrepid/control	2010-01-28 01:59:52.000000000 +0100
@@ -15,9 +15,7 @@
                fakeroot, 
                libdrm2,
                libgl1-mesa-glx,
-               libxinerama1,
-               libqtgui4,
-               execstack
+               libxinerama1
 Standards-Version: 3.8.0
 Homepage: http://ati.amd.com/support/driver.html
 
diff -Nru 10-1/packages/Ubuntu/dists/intrepid/dkms/patches/fglrx-rt-compat.patch 10-1.fix/packages/Ubuntu/dists/intrepid/dkms/patches/fglrx-rt-compat.patch
--- 10-1/packages/Ubuntu/dists/intrepid/dkms/patches/fglrx-rt-compat.patch	1970-01-01 01:00:00.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/intrepid/dkms/patches/fglrx-rt-compat.patch	2009-12-02 08:54:53.000000000 +0100
@@ -0,0 +1,26 @@
+--- a/firegl_public.c
++++ b/firegl_public.c
+@@ -1352,7 +1352,11 @@
+    int process_terminated = 1;
+   
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
++#if !defined(CONFIG_PREEMPT_RT)
+    rcu_read_lock();
++#else
++   preempt_disable();
++#endif
+ #else   
+    read_lock(&tasklist_lock);
+ #endif   
+@@ -1373,7 +1377,11 @@
+       }
+    }   
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)  
++#if !defined(CONFIG_PREEMPT_RT)
+    rcu_read_unlock();
++#else
++   preempt_enable();
++#endif
+ #else   
+    read_unlock(&tasklist_lock);
+ #endif   
diff -Nru 10-1/packages/Ubuntu/dists/intrepid/dkms.conf.in 10-1.fix/packages/Ubuntu/dists/intrepid/dkms.conf.in
--- 10-1/packages/Ubuntu/dists/intrepid/dkms.conf.in	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/intrepid/dkms.conf.in	2010-01-28 01:59:52.000000000 +0100
@@ -6,6 +6,6 @@
 DEST_MODULE_LOCATION[0]="/kernel/drivers/char/drm"
 AUTOINSTALL="yes"
 PATCH[0]="rt_preempt_28.patch"
-PATCH_MATCH[0]="2.6.28"
+PATCH_MATCH[0]="^2.6.28\-[0-9]*\-rt$"
 PATCH[1]="rt_preempt_31.patch"
-PATCH_MATCH[1]="2.6.31"
+PATCH_MATCH[1]="^2.6.31\-[0-9]*\-rt$"
diff -Nru 10-1/packages/Ubuntu/dists/intrepid/rules 10-1.fix/packages/Ubuntu/dists/intrepid/rules
--- 10-1/packages/Ubuntu/dists/intrepid/rules	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/intrepid/rules	2010-01-28 01:59:52.000000000 +0100
@@ -121,22 +121,12 @@
 	dh_install -p$(PKG_driver) "arch/x86/usr/lib/*"                     "usr/lib32"
 	dh_installdirs -p$(PKG_driver) "usr/lib32/fglrx"
 
-	for i in \
-			debian/$(PKG_driver)/$(DRIDIR32)/dri/fglrx_dri.so \
-			debian/$(PKG_driver)/usr/lib32/libGL.so.* \
-			; do execstack -q $$i; execstack -c $$i; done
 
+	#they don't provide the symlink for us (starting at 8.699)
+	dh_link -p$(PKG_driver) usr/lib32/libatiuki.so.1.0 usr/lib32/libatiuki.so.1
 endif
+	#they don't provide the symlink for us (starting at 8.699)
+	dh_link -p$(PKG_driver) usr/lib/libatiuki.so.1.0 usr/lib/libatiuki.so.1
 
 	dh_installdocs -p$(PKG_driver) usr/share/doc/fglrx/* --exclude ATI_LICENSE.TXT
 	dh_installinit -p$(PKG_driver) --name="atieventsd" --no-start --update-rcd-params="defaults 31"
-
-	for i in \
-			debian/$(PKG_driver)/usr/bin/atiode \
-			debian/$(PKG_driver)/usr/sbin/amdnotifyui \
-			debian/$(PKG_driver)/usr/lib/dri/fglrx_dri.so \
-			debian/$(PKG_driver)/usr/lib/libGL.so.* \
-			; do execstack -q $$i; execstack -c $$i; done
-
-binary-install/$(PKG_control)::
-	execstack -c debian/$(PKG_control)/usr/bin/amdcccle
diff -Nru 10-1/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx-dev.install.in 10-1.fix/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx-dev.install.in
--- 10-1/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx-dev.install.in	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx-dev.install.in	2010-01-28 01:59:52.000000000 +0100
@@ -1,7 +1,7 @@
-debian/overrides/xorg-driver-fglrx-dev usr/share/lintian/overrides
+debian/overrides/xorg-driver-fglrx-dev                  usr/share/lintian/overrides
 
-usr/include/*                          usr/include
-usr/X11R6/include/*                    usr/include
+usr/include/*                               usr/include
+usr/X11R6/include/*                         usr/include
 
 #XARCH#/usr/X11R6/#LIBDIR#/modules/*.a      usr/lib
-arch/#ARCH#/usr/X11R6/#LIBDIR#/*.a     usr/lib
+arch/#ARCH#/usr/X11R6/#LIBDIR#/*.a          usr/lib
diff -Nru 10-1/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.install.in 10-1.fix/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.install.in
--- 10-1/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.install.in	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.install.in	2010-01-28 01:59:52.000000000 +0100
@@ -26,3 +26,6 @@
 
 #CAL stuff
 arch/#ARCH#/usr/#LIBDIR#/*                     usr/lib
+
+#Install QT4 libraries that weren't around for 9.04 and earlier
+arch/#ARCH#/usr/share/ati/#LIBDIR#             usr/share/ati
diff -Nru 10-1/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.postrm 10-1.fix/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.postrm
--- 10-1/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.postrm	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.postrm	2010-01-28 01:59:52.000000000 +0100
@@ -22,10 +22,9 @@
     remove|purge)
 	dpkg-divert --remove --rename --package $PKGNAME --divert /usr/lib/fglrx/libGL.so.1.2.xlibmesa /usr/lib/libGL.so.1.2 > /dev/null
 	dpkg-divert --remove --rename --package $PKGNAME --divert /usr/lib32/fglrx/libGL.so.1.2.xlibmesa /usr/lib32/libGL.so.1.2 > /dev/null
-	dpkg-divert --remove --rename --package $PKGNAME --divert /usr/lib/fglrx/libdri.so.xlibmesa /usr/lib/xorg/modules/extensions/libdri.so > /dev/null
 	dpkg-divert --remove --rename --package $PKGNAME --divert /usr/lib/fglrx/libglx.so.xlibmesa /usr/lib/xorg/modules/extensions/libglx.so > /dev/null
     ;;
-    
+
     upgrade|failed-upgrade|abort-install|abort-upgrade|disappear)
         ;;
 
diff -Nru 10-1/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.preinst 10-1.fix/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.preinst
--- 10-1/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.preinst	2010-01-15 00:42:21.000000000 +0100
+++ 10-1.fix/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.preinst	2010-01-28 01:59:52.000000000 +0100
@@ -71,6 +71,12 @@
              /usr/X11R6/lib32/libGL.so.1.2 ; do \
 	dpkg-divert --remove --package $PKGNAME $i > /dev/null; \
      done
+
+    #before 8.699 we had to divert libdri
+    dpkg-divert --remove --rename --package $PKGNAME \
+        --divert /usr/lib/fglrx/libdri.so.xlibmesa   \
+        /usr/lib/xorg/modules/extensions/libdri.so > /dev/null
+
 }
 
 case "$1" in
@@ -84,7 +90,6 @@
 		mkdir -p /usr/lib/fglrx
 	fi
 	dpkg-divert --add --rename --package $PKGNAME --divert /usr/lib/fglrx/libGL.so.1.2.xlibmesa /usr/lib/libGL.so.1.2 > /dev/null
-	dpkg-divert --add --rename --package $PKGNAME --divert /usr/lib/fglrx/libdri.so.xlibmesa /usr/lib/xorg/modules/extensions/libdri.so > /dev/null
 	dpkg-divert --add --rename --package $PKGNAME --divert /usr/lib/fglrx/libglx.so.xlibmesa /usr/lib/xorg/modules/extensions/libglx.so > /dev/null
 
 	if [ -n "$HAS_LIB32" ]; then
@@ -105,6 +110,10 @@
 	mv_conffile "/etc/ati/logo_mask.xbm.example"
 	mv_conffile "/etc/ati/signature"
 	mv_conffile "/etc/ati/logo.xbm.example"
+
+        ## Just in case they installed without debs before, finish a proper uninstall routine ##
+        ## This will error out on any failure (which should be cleaned up anyway before installing debs) ##
+        [ -x /usr/share/ati/fglrx-uninstall.sh ] && /usr/share/ati/fglrx-uninstall.sh
     ;;
 
     abort-upgrade)

EOT
;;
esac

# http://aur.archlinux.org/packages/catalyst-test/catalyst-test/fglrx-2.6.33.patch
case $VER in 10-1|10-2|10-3|10-4|*) grep -q generated/autoconf.h common/lib/modules/fglrx/build_mod/firegl_public.c || patch -p1 << 'EOT'
Index: ati10.1/common/lib/modules/fglrx/build_mod/drmP.h
===================================================================
--- ati10.1/common/lib/modules/fglrx/build_mod/drmP.h
+++ ati10.1/common/lib/modules/fglrx/build_mod/drmP.h	2010-01-28 19:57:07.562644291 +0200
@@ -42,7 +42,12 @@
  * can build the DRM (part of PI DRI). 4/21/2000 S + B */
 #include <asm/current.h>
 #endif /* __alpha__ */
+#include <linux/version.h>
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,33)
+#include <generated/autoconf.h>
+#else
 #include <linux/autoconf.h>
+#endif
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/miscdevice.h>
@@ -51,7 +56,6 @@
 #include <linux/init.h>
 #include <linux/file.h>
 #include <linux/pci.h>
-#include <linux/version.h>
 #include <linux/sched.h>
 #include <linux/smp_lock.h>	/* For (un)lock_kernel */
 #include <linux/mm.h>
Index: ati10.1/common/lib/modules/fglrx/build_mod/firegl_public.c
===================================================================
--- ati10.1/common/lib/modules/fglrx/build_mod/firegl_public.c
+++ ati10.1/common/lib/modules/fglrx/build_mod/firegl_public.c	2010-01-29 14:21:58.687999115 +0200
@@ -28,7 +28,11 @@
 #error Kernel versions older than 2.6.0 are no longer supported by this module.
 #endif 
 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,33)
+#include <generated/autoconf.h>
+#else
 #include <linux/autoconf.h>
+#endif
 
 #if !defined(CONFIG_X86) 
 #if !defined(CONFIG_X86_PC) 
@@ -163,8 +167,12 @@
 
 //  For 2.6.18 or higher, the UTS_RELEASE is defined in the linux/utsrelease.h. 
 #ifndef UTS_RELEASE 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,33)
+#include <generated/utsrelease.h>
+#else
 #include <linux/utsrelease.h>
 #endif
+#endif
 
 #if defined(__i386__)
 #ifndef do_div
@@ -1472,7 +1472,16 @@
 #ifndef __HAVE_ARCH_CMPXCHG
     return __fgl_cmpxchg(ptr,old,new,size);
 #else
-    return __cmpxchg(ptr,old,new,size);
+    switch (size) {
+    case 1: { volatile u8 *_ptr = ptr; return cmpxchg(_ptr, old, new); }
+    case 2: { volatile u16 *_ptr = ptr; return cmpxchg(_ptr, old, new); }
+    case 4: { volatile u32 *_ptr = ptr; return cmpxchg(_ptr, old, new); }
+#ifdef __x86_64__
+    case 8: { volatile u64 *_ptr = ptr; return cmpxchg(_ptr, old, new); }
+#endif
+    default:
+        return old;
+    }
 #endif
 }

 
Index: ati10.1/common/lib/modules/fglrx/build_mod/kcl_acpi.c
===================================================================
--- ati10.1/common/lib/modules/fglrx/build_mod/kcl_acpi.c
+++ ati10.1/common/lib/modules/fglrx/build_mod/kcl_acpi.c	2010-01-28 19:57:17.897225045 +0200
@@ -15,7 +15,11 @@
  ****************************************************************************/
 
 #include <linux/version.h>
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,33)
+#include <generated/autoconf.h>
+#else
 #include <linux/autoconf.h>
+#endif
 #include <linux/acpi.h>
 
 #include "kcl_config.h"
Index: ati10.1/common/lib/modules/fglrx/build_mod/kcl_agp.c
===================================================================
--- ati10.1/common/lib/modules/fglrx/build_mod/kcl_agp.c
+++ ati10.1/common/lib/modules/fglrx/build_mod/kcl_agp.c	2010-01-28 19:57:26.104892082 +0200
@@ -31,7 +31,11 @@
  */
 
 #include <linux/version.h>
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,33)
+#include <generated/autoconf.h>
+#else
 #include <linux/autoconf.h>
+#endif
 #include <linux/pci.h>
 #include <linux/agp_backend.h>
 #include <linux/string.h>
Index: ati10.1/common/lib/modules/fglrx/build_mod/kcl_io.c
===================================================================
--- ati10.1/common/lib/modules/fglrx/build_mod/kcl_io.c
+++ ati10.1/common/lib/modules/fglrx/build_mod/kcl_io.c	2010-01-28 19:57:34.337558105 +0200
@@ -37,7 +37,11 @@
  */
 
 #include <linux/version.h>
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,33)
+#include <generated/autoconf.h>
+#else
 #include <linux/autoconf.h>
+#endif
 #include <linux/poll.h>
 #include <linux/signal.h>
 #include <asm/io.h>
Index: ati10.1/common/lib/modules/fglrx/build_mod/kcl_osconfig.h
===================================================================
--- ati10.1/common/lib/modules/fglrx/build_mod/kcl_osconfig.h
+++ ati10.1/common/lib/modules/fglrx/build_mod/kcl_osconfig.h	2010-01-28 19:57:43.599182385 +0200
@@ -20,7 +20,11 @@
 #define KCL_OSCONFIG_H
 
 #include <linux/version.h>
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,33)
+#include <generated/autoconf.h>
+#else
 #include <linux/autoconf.h>
+#endif
 
 // Choose modern way to call 32-on-64 IOCTLs if configured in the kernel
 #if defined(CONFIG_COMPAT) && LINUX_VERSION_CODE > KERNEL_VERSION(2,6,9)
Index: ati10.1/common/lib/modules/fglrx/build_mod/kcl_pci.c
===================================================================
--- ati10.1/common/lib/modules/fglrx/build_mod/kcl_pci.c
+++ ati10.1/common/lib/modules/fglrx/build_mod/kcl_pci.c	2010-01-28 19:57:51.295870149 +0200
@@ -31,7 +31,11 @@
  */
 
 #include <linux/version.h>
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,33)
+#include <generated/autoconf.h>
+#else
 #include <linux/autoconf.h>
+#endif
 #include <linux/pci.h>
 
 #include "kcl_config.h"
Index: ati10.1/common/lib/modules/fglrx/build_mod/kcl_str.c
===================================================================
--- ati10.1/common/lib/modules/fglrx/build_mod/kcl_str.c
+++ ati10.1/common/lib/modules/fglrx/build_mod/kcl_str.c	2010-01-28 19:57:59.728528058 +0200
@@ -30,7 +30,12 @@
  *
  */
 
+#include <linux/version.h>
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,33)
+#include <generated/autoconf.h>
+#else
 #include <linux/autoconf.h>
+#endif
 #include <linux/string.h>
 #include <linux/module.h>
 
Index: ati10.1/common/lib/modules/fglrx/build_mod/kcl_wait.c
===================================================================
--- ati10.1/common/lib/modules/fglrx/build_mod/kcl_wait.c
+++ ati10.1/common/lib/modules/fglrx/build_mod/kcl_wait.c	2010-01-28 19:58:08.936154527 +0200
@@ -31,7 +31,11 @@
  */
 
 #include <linux/version.h>
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,33)
+#include <generated/autoconf.h>
+#else
 #include <linux/autoconf.h>
+#endif
 #include <linux/wait.h>
 #include <linux/highmem.h>
 #include <linux/sched.h>
Index: ati10.1/common/lib/modules/fglrx/build_mod/make.sh
===================================================================
--- ati10.1/common/lib/modules/fglrx/build_mod/make.sh
+++ ati10.1/common/lib/modules/fglrx/build_mod/make.sh	2010-01-28 19:55:10.849378991 +0200
@@ -218,8 +218,15 @@
         # UTS-define is in external version-*.h files, i.e. linux-2.2.14-5.0-RedHat does this flaw
         kernel_release=`cat $linuxincludes/linux/version-*.h | grep UTS_RELEASE | grep \"$OsRelease\" | cut -d'"' -f2` 
     else
-        # For 2.6.18 or higher, UTS-define is defined in utsrelease.h.
-        kernel_release=`cat $linuxincludes/linux/utsrelease.h | grep UTS_RELEASE | grep \"$OsRelease\" | cut -d'"' -f2` 
+        UTS_REL_COUNT=`cat $linuxincludes/generated/utsrelease.h 2>/dev/null | grep UTS_RELEASE -c`
+
+	if [ $UTS_REL_COUNT -gt 0 ]; then
+	    # 2.6.33+
+	    kernel_release=`cat $linuxincludes/generated/utsrelease.h | grep UTS_RELEASE | grep \"$OsRelease\" | cut -d'"' -f2`
+	else
+            # For 2.6.18 to 2.6.32, UTS-define is defined in utsrelease.h.
+            kernel_release=`cat $linuxincludes/linux/utsrelease.h | grep UTS_RELEASE | grep \"$OsRelease\" | cut -d'"' -f2`
+	fi
     fi
   fi
 fi
@@ -302,7 +309,8 @@
 # 3
 # linux/autoconf.h may contain this: #define CONFIG_SMP 1
 
-src_file=$linuxincludes/linux/autoconf.h
+src_file=$linuxincludes/generated/autoconf.h
+[ -e $src_file ] || src_file=$linuxincludes/linux/autoconf.h
 
 if [ ! -e $src_file ]; then
   echo "Warning:"                                                  >> $logfile
@@ -355,7 +363,8 @@
 MODVERSIONS=0
 
 # linux/autoconf.h may contain this: #define CONFIG_MODVERSIONS 1
-src_file=$linuxincludes/linux/autoconf.h
+src_file=$linuxincludes/generated/autoconf.h
+[ -e $src_file ] || src_file=$linuxincludes/linux/autoconf.h
 if [ ! -e $src_file ];
 then
   echo "Warning:"                                                  >> $logfile
EOT
;;
esac
# http://aur.archlinux.org/packages/catalyst-test/catalyst-test/fglrx-2.6.34-rc4.patch
case $VER in 10-1|10-2|10-3|10-4|*) grep -q linux/slab.h common/lib/modules/fglrx/build_mod/kcl_wait.c || patch -p1 << 'EOT'
--- ati10.4/common/lib/modules/fglrx/build_mod/kcl_wait2.c	2010-04-13 20:02:46.494496561 +0200
+++ ati10.4/common/lib/modules/fglrx/build_mod/kcl_wait.c	2010-04-13 19:52:00.054563389 +0200
@@ -39,6 +39,7 @@
 #include <linux/wait.h>
 #include <linux/highmem.h>
 #include <linux/sched.h>
+#include <linux/slab.h>

 #include "kcl_config.h"
 #include "kcl_wait.h"

EOT
;;
esac

case $VER in 10-4) patch -p1 << 'EOT'
diff -Nru 10-4/packages/Ubuntu/dists/hardy/fglrx-amdcccle.install.in 10-4.fix/packages/Ubuntu/dists/hardy/fglrx-amdcccle.install.in
--- 10-4/packages/Ubuntu/dists/hardy/fglrx-amdcccle.install.in	2010-04-15 18:44:17.000000000 +0200
+++ 10-4.fix/packages/Ubuntu/dists/hardy/fglrx-amdcccle.install.in	2010-04-29 02:22:00.000000000 +0200
@@ -2,5 +2,5 @@
 usr/share/icons/*.xpm usr/share/pixmaps
 usr/share/ati usr/share
 usr/share/applications usr/share
-usr/X11R6/bin/* #DRIDIR#/bin
+usr/X11R6/bin/* usr/bin
 arch/#ARCH#/usr/X11R6/bin/amdcccle usr/bin
diff -Nru 10-4/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.dirs 10-4.fix/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.dirs
--- 10-4/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.dirs	2010-04-15 18:44:17.000000000 +0200
+++ 10-4.fix/packages/Ubuntu/dists/hardy/xorg-driver-fglrx.dirs	2010-04-29 02:22:00.000000000 +0200
@@ -1,2 +1,4 @@
 usr/lib/fglrx
 usr/share/fglrx
+lib/fglrx
+usr/lib/fglrx/etc/ati
diff -Nru 10-4/packages/Ubuntu/dists/intrepid/fglrx-amdcccle.install.in 10-4.fix/packages/Ubuntu/dists/intrepid/fglrx-amdcccle.install.in
--- 10-4/packages/Ubuntu/dists/intrepid/fglrx-amdcccle.install.in	2010-04-15 18:44:17.000000000 +0200
+++ 10-4.fix/packages/Ubuntu/dists/intrepid/fglrx-amdcccle.install.in	2010-04-29 02:22:00.000000000 +0200
@@ -2,5 +2,5 @@
 usr/share/icons/*.xpm usr/share/pixmaps
 usr/share/ati usr/share
 usr/share/applications usr/share
-usr/X11R6/bin/* #DRIDIR#/bin
+usr/X11R6/bin/* usr/bin
 arch/#ARCH#/usr/X11R6/bin/amdcccle usr/bin
diff -Nru 10-4/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.dirs 10-4.fix/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.dirs
--- 10-4/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.dirs	2010-04-15 18:44:17.000000000 +0200
+++ 10-4.fix/packages/Ubuntu/dists/intrepid/xorg-driver-fglrx.dirs	2010-04-29 02:22:00.000000000 +0200
@@ -1,2 +1,4 @@
 usr/lib/fglrx
 usr/share/fglrx
+lib/fglrx
+usr/lib/fglrx/etc/ati
diff -Nru 10-4/packages/Ubuntu/dists/lucid/clean 10-4.fix/packages/Ubuntu/dists/lucid/clean
--- 10-4/packages/Ubuntu/dists/lucid/clean	1970-01-01 01:00:00.000000000 +0100
+++ 10-4.fix/packages/Ubuntu/dists/lucid/clean	2010-04-29 02:22:00.000000000 +0200
@@ -0,0 +1,7 @@
+debian/10fglrx
+debian/dkms.conf
+debian/fglrx.install
+debian/fglrx-dev.install
+debian/fglrx-amdcccle.install
+debian/overrides/fglrx
+debian/modaliases/fglrx-modules.alias.override
diff -Nru 10-4/packages/Ubuntu/dists/lucid/control 10-4.fix/packages/Ubuntu/dists/lucid/control
--- 10-4/packages/Ubuntu/dists/lucid/control	2010-04-15 18:44:17.000000000 +0200
+++ 10-4.fix/packages/Ubuntu/dists/lucid/control	2010-04-29 02:22:00.000000000 +0200
@@ -1,7 +1,7 @@
 Source: fglrx-installer
 Section: restricted/misc
 Priority: extra
-Maintainer: Mario Limonciello <superm1@ubuntu.com>
+Maintainer: Ubuntu Core Developers <ubuntu-devel-discuss@lists.ubuntu.com>
 Uploaders: Mario Limonciello <superm1@ubuntu.com>, Alberto Milone <albertomilone@alice.it>
 Build-Depends: debhelper (>= 7),
                libxext6, 
diff -Nru 10-4/packages/Ubuntu/dists/lucid/fglrx.dirs 10-4.fix/packages/Ubuntu/dists/lucid/fglrx.dirs
--- 10-4/packages/Ubuntu/dists/lucid/fglrx.dirs	2010-04-15 18:44:17.000000000 +0200
+++ 10-4.fix/packages/Ubuntu/dists/lucid/fglrx.dirs	2010-04-29 02:22:00.000000000 +0200
@@ -1,2 +1,4 @@
 usr/lib/fglrx
 usr/share/fglrx
+lib/fglrx
+usr/lib/fglrx/etc/ati
diff -Nru 10-4/packages/Ubuntu/dists/lucid/fglrx.install.in 10-4.fix/packages/Ubuntu/dists/lucid/fglrx.install.in
--- 10-4/packages/Ubuntu/dists/lucid/fglrx.install.in	2010-04-15 18:44:17.000000000 +0200
+++ 10-4.fix/packages/Ubuntu/dists/lucid/fglrx.install.in	2010-04-29 02:22:00.000000000 +0200
@@ -14,9 +14,9 @@
 debian/overrides/fglrx                          usr/share/lintian/overrides
 debian/acpi/fglrx-*-aticonfig                   etc/acpi/events
 debian/acpi/fglrx-powermode.sh                  etc/acpi
-debian/10fglrx                                  etc/X11/Xsession.d
-etc/ati                                         etc
-debian/replacements/authatieventsd.sh           etc/ati
+debian/10fglrx                                  #DRIDIR#
+etc/ati/*                                       #DRIDIR#/etc/ati
+debian/replacements/authatieventsd.sh           #DRIDIR#/etc/ati
 
 #binaries
 arch/#ARCH#/usr/sbin/*                          #DRIDIR#/bin
diff -Nru 10-4/packages/Ubuntu/dists/lucid/fglrx.postinst 10-4.fix/packages/Ubuntu/dists/lucid/fglrx.postinst
--- 10-4/packages/Ubuntu/dists/lucid/fglrx.postinst	2010-04-15 18:44:17.000000000 +0200
+++ 10-4.fix/packages/Ubuntu/dists/lucid/fglrx.postinst	2010-04-29 02:22:00.000000000 +0200
@@ -108,7 +108,10 @@
         --slave /usr/bin/atieventsd atieventsd  /usr/lib/fglrx/bin/atieventsd \
         --slave /usr/lib/xorg/modules/drivers/fglrx_drv.so fglrx_drv /usr/lib/fglrx/xorg/modules/drivers/fglrx_drv.so \
         --slave /usr/lib/dri/fglrx_dri.so fglrx_dri /usr/lib/fglrx/dri/fglrx_dri.so \
-        --slave /etc/modprobe.d/fglrx.conf fglrx_modconf /usr/lib/fglrx/modprobe.conf \
+        --slave /usr/lib/libAMDXvBA.cap libAMDXvBA_cap /usr/lib/fglrx/libAMDXvBA.cap \
+        --slave /etc/modprobe.d/fglrx.conf fglrx_modconf /lib/fglrx/modprobe.conf \
+        --slave /etc/X11/Xsession.d/10fglrx 10fglrx /usr/lib/fglrx/10fglrx \
+        --slave /etc/ati ati_conf /usr/lib/fglrx/etc/ati \
         --slave /usr/lib/xorg/extra-modules xorg_extra_modules /usr/lib/fglrx/xorg \
     # ldconfig needs to be run immediately as we're changing /etc/ld.so.conf.d/ with
     # alternatives.
@@ -126,7 +129,8 @@
         update-initramfs -u
             
         if [ -n "$NEWEST_KERNEL" ] && [ ${CURRENT_KERNEL} != ${NEWEST_KERNEL} ]; then
-            update-initramfs -u -k $CURRENT_KERNEL
+            # This can fail when dealing with a chroot see LP: #556653
+            update-initramfs -u -k $CURRENT_KERNEL || true
         fi
     fi
 
diff -Nru 10-4/packages/Ubuntu/dists/lucid/fglrx.preinst 10-4.fix/packages/Ubuntu/dists/lucid/fglrx.preinst
--- 10-4/packages/Ubuntu/dists/lucid/fglrx.preinst	2010-04-15 18:44:17.000000000 +0200
+++ 10-4.fix/packages/Ubuntu/dists/lucid/fglrx.preinst	2010-04-29 02:22:00.000000000 +0200
@@ -14,39 +14,23 @@
 # For details see /usr/share/doc/packaging-manual/
 
 PKGNAME=fglrx
+OLDPKGNAME=xorg-driver-fglrx
 
 if [ `dpkg --print-architecture` = "amd64" ]; then
 	HAS_LIB32="yes"
 fi
 
-# Snippet from  http://www.dpkg.org/dpkg/ConffileHandling
-mv_conffile() {
-    CONFFILE="$1"
-
-    if [ -e "$CONFFILE" ]; then
-        md5sum="`md5sum \"$CONFFILE\" | sed -e \"s/ .*//\"`"
-        old_md5sum="`sed -n -e \"/^Conffiles:/,/^[^ ]/{\\\\' $CONFFILE'{s/.* //;p}}\" /var/lib/dpkg/status`"
-        if [ "$md5sum" != "$old_md5sum" ]; then
-            echo "Conffile $CONFFILE has been modified by you."
-            echo "AMD graphics driver requires $CONFFILE to be updated when driver is updated."
-            echo "Saving as $CONFFILE.dpkg-bak ..."
-            mv -f "$CONFFILE" "$CONFFILE".dpkg-bak
-        fi
-    fi
-}
-
-
 fix_diversions()
 {
     # Remove very old style diversions
     if [ -d /usr/share/fglrx/diversions ]; then
 	if [ -n "$HAS_LIB32" ]; then
-	    dpkg-divert --remove --package $PKGNAME \
+	    dpkg-divert --remove --package $OLDPKGNAME \
 		--divert /usr/share/fglrx/diversions/libGL.so.1.2_32bit \
 		--rename /usr/lib32/libGL.so.1.2
 	fi
 
-	dpkg-divert --remove --package $PKGNAME \
+	dpkg-divert --remove --package $OLDPKGNAME \
 	    --divert /usr/share/fglrx/diversions/libGL.so.1.2 \
 	    --rename /usr/lib/libGL.so.1.2
 
@@ -69,13 +53,17 @@
              /usr/X11R6/lib/libGL.so.1.2 \
              /usr/X11R6/lib32/libGL.so.1 \
              /usr/X11R6/lib32/libGL.so.1.2 ; do \
-	dpkg-divert --remove --package $PKGNAME $i > /dev/null; \
+	dpkg-divert --remove --package $OLDPKGNAME $i > /dev/null; \
      done
 
     #before 8.699 we had to divert libdri
-    dpkg-divert --remove --rename --package $PKGNAME \
-        --divert /usr/lib/fglrx/libdri.so.xlibmesa   \
+    if dpkg-divert --list $OLDPKGNAME | \
+       grep /usr/lib/xorg/modules/extensions/libdri.so > /dev/null ; then
+        rm -f /usr/lib/xorg/modules/extensions/libdri.so > /dev/null
+        dpkg-divert --remove --rename --package $OLDPKGNAME \
+        --divert /usr/lib/fglrx/libdri.so.xlibmesa \
         /usr/lib/xorg/modules/extensions/libdri.so > /dev/null
+    fi
 
 }
 
@@ -85,21 +73,20 @@
         ### remove old fglrx diversions ###
 	fix_diversions
 
-	### Remove user changes to "conffiles""                     ###
-	### These files are stored in /etc but shouldn't be treated ###
-	### as conf files because updated drivers may stop working  ###
-	### if they are modified.                                   ###
-	mv_conffile "/etc/ati/amdpcsdb.default"
-	mv_conffile "/etc/ati/atiogl.xml"
-	mv_conffile "/etc/ati/authatieventsd.sh"
-	mv_conffile "/etc/ati/control"
-	mv_conffile "/etc/ati/logo_mask.xbm.example"
-	mv_conffile "/etc/ati/signature"
-	mv_conffile "/etc/ati/logo.xbm.example"
+        # Remove the file if it's not a symlink (see LP: #552903)
+        if [ ! -L /etc/X11/Xsession.d/10fglrx ]; then
+            rm -f /etc/X11/Xsession.d/10fglrx
+        fi
 
         ## Just in case they installed without debs before, finish a proper uninstall routine ##
         ## This will error out on any failure (which should be cleaned up anyway before installing debs) ##
         [ -x /usr/share/ati/fglrx-uninstall.sh ] && /usr/share/ati/fglrx-uninstall.sh
+
+        # Remove the directory if it's not a symlink (as it should be
+        # a slave link now)
+        if [ ! -L /etc/ati ]; then
+            rm -Rf /etc/ati
+        fi
     ;;
 
     abort-upgrade)
diff -Nru 10-4/packages/Ubuntu/dists/lucid/modaliases/fglrx_supported 10-4.fix/packages/Ubuntu/dists/lucid/modaliases/fglrx_supported
--- 10-4/packages/Ubuntu/dists/lucid/modaliases/fglrx_supported	2010-04-15 18:44:17.000000000 +0200
+++ 10-4.fix/packages/Ubuntu/dists/lucid/modaliases/fglrx_supported	2010-04-29 02:22:00.000000000 +0200
@@ -12,5 +12,5 @@
 echo "# Listing generated by fglrx_supported. Do not edit manually."
 
 grep "0x" "$filename" | \
-  sed -n 's/FGL_ASIC_ID(0x\([0-9A-F]\{4\}\)),$/alias pci:v00001002d0000\1sv*sd*bc03sc*i* fglrx xorg-driver-fglrx/p' | \
+  sed -n 's/FGL_ASIC_ID(0x\([0-9A-F]\{4\}\)),$/alias pci:v00001002d0000\1sv*sd*bc03sc*i* fglrx fglrx/p' | \
   sort | uniq | sed -e 's/^[ \t]*//'
diff -Nru 10-4/packages/Ubuntu/dists/lucid/rules 10-4.fix/packages/Ubuntu/dists/lucid/rules
--- 10-4/packages/Ubuntu/dists/lucid/rules	2010-04-15 18:44:17.000000000 +0200
+++ 10-4.fix/packages/Ubuntu/dists/lucid/rules	2010-04-29 02:22:00.000000000 +0200
@@ -21,7 +21,14 @@
 ARCH     := x86
 XARCH    := x750
 
-ifeq ($(DEB_BUILD_ARCH),amd64)
+# This is a hack to make sure that
+# the blacklist file is available
+# early in the boot process when
+# /usr is on a separate partition.
+# See LP: #538071.
+PKG_LIBDIR := lib/fglrx
+
+ifeq ($(DEB_HOST_ARCH),amd64)
 	LIBDIR  := lib64
 	ARCH    := x86_64
 	XARCH   := $(XARCH)_64a
@@ -30,13 +37,6 @@
 # DEB_DH_SHLIBDEPS_ARGS_ALL="-Xlib32"
 
 clean:
-	rm -f debian/{10fglrx, \
-		dkms.conf, \
-		$(PKG_driver).install, \
-		$(PKG_driver_dev).install, \
-		$(PKG_control).install, \
-		overrides/$(PKG_driver), \
-		modaliases/fglrx-modules.alias.override}
 	dh clean
 
 
@@ -83,9 +83,9 @@
 	dh build
 
 
-binary:
+binary-arch:
 	#Steps that we can't easily represent in debhelper files or .in files yet
-ifeq ($(DEB_BUILD_ARCH),amd64)
+ifeq ($(DEB_HOST_ARCH),amd64)
 	dh_install -p$(PKG_driver)    "arch/x86/usr/X11R6/lib/libAMD*.so*"           "$(DRIDIR32)"
 	dh_install -p$(PKG_driver) "arch/x86/usr/X11R6/lib/*.so*"           "$(DRIDIR32)"
 	dh_installdirs -p$(PKG_driver) "$(DRIDIR32)"
@@ -99,6 +99,8 @@
 
 	#they don't provide the symlink for us (starting at 8.699)
 	dh_link -p$(PKG_driver) $(DRIDIR32)/libatiuki.so.1.0 $(DRIDIR32)/libatiuki.so.1
+else
+	dh_installdirs -p$(PKG_driver)
 endif
 	dh_installdocs -p$(PKG_driver) usr/share/doc/fglrx/* --exclude ATI_LICENSE.TXT
 	dh_installinit -p$(PKG_driver) --name="atieventsd" --no-start --update-rcd-params="defaults 31"
@@ -119,21 +121,24 @@
 		-type f | xargs chmod a+x
 
 	# Blacklist any other driver that udev may want to load instead of fglrx
-	printf "blacklist radeon\n" > $(CURDIR)/debian/$(PKG_driver)/$(DRIDIR)/modprobe.conf
+	printf "blacklist radeon\n" > $(CURDIR)/debian/$(PKG_driver)/$(PKG_LIBDIR)/modprobe.conf
 
 	#ld.so.conf
 	echo "/$(DRIDIR)" >	"$(CURDIR)/debian/$(PKG_driver)/$(DRIDIR)/ld.so.conf"
-ifeq ($(DEB_BUILD_ARCH),amd64)
+ifeq ($(DEB_HOST_ARCH),amd64)
 	echo "/$(DRIDIR32)" >>	"$(CURDIR)/debian/$(PKG_driver)/$(DRIDIR)/ld.so.conf"
 endif
 
 
 	#Run the normal stuff
-	dh binary
+	dh binary-arch
 
+binary: binary-arch binary-indep ;
+	#Run the normal stuff
+	dh binary
 
 override_dh_shlibdeps:
-ifeq ($(DEB_BUILD_ARCH),amd64)
+ifeq ($(DEB_HOST_ARCH),amd64)
 	dh_shlibdeps -l$(CURDIR)/debian/fglrx/usr/lib/fglrx:$(CURDIR)/debian/fglrx/usr/lib32/fglrx -Xlib32
 else
 	dh_shlibdeps -l$(CURDIR)/debian/fglrx/usr/lib/fglrx
EOT
;;
esac

# http://launchpadlibrarian.net/56199871/compat_alloc_cve-2010-3081.patch
case $VER in 10-9|*) grep -q COMPAT_ALLOC_USER_SPACE common/lib/modules/fglrx/build_mod/kcl_ioctl.c || patch -p1 << 'EOT'
diff -Nru 10-9.orig/common/lib/modules/fglrx/build_mod/2.6.x/Makefile 10-9/common/lib/modules/fglrx/build_mod/2.6.x/Makefile
--- 10-9.orig/common/lib/modules/fglrx/build_mod/2.6.x/Makefile	2010-09-01 16:05:31.000000000 +0200
+++ 10-9/common/lib/modules/fglrx/build_mod/2.6.x/Makefile	2010-09-22 09:23:56.363622996 +0200
@@ -67,6 +67,11 @@
                 -DFGL_LINUX253P1_VMA_API \
                 -DPAGE_ATTR_FIX=$(PAGE_ATTR_FIX) \
 
+
+ifeq ($(ARCH_COMPAT_ALLOC_USER_SPACE), 1)
+	EXTRA_CFLAGS +=-DARCH_COMPAT_ALLOC_USER_SPACE
+endif
+
 ifeq ($(KERNELRELEASE),)
 # on first call from remote location we get into this path
 # whilst on second call all is managed by the embedding kernel makefile
diff -Nru 10-9.orig/common/lib/modules/fglrx/build_mod/kcl_ioctl.c 10-9/common/lib/modules/fglrx/build_mod/kcl_ioctl.c
--- 10-9.orig/common/lib/modules/fglrx/build_mod/kcl_ioctl.c	2010-09-01 16:05:31.000000000 +0200
+++ 10-9/common/lib/modules/fglrx/build_mod/kcl_ioctl.c	2010-09-22 09:23:56.363622996 +0200
@@ -193,7 +193,22 @@
  */
 void* ATI_API_CALL KCL_IOCTL_AllocUserSpace32(long size)
 {
-    return compat_alloc_user_space(size);
+    void __user *ptr;
+
+    /* If len occupies more than half of the entire compat space... */
+    if (unlikely(((unsigned long) size) > (((compat_uptr_t)~0) >> 1)))
+        return NULL;
+
+#ifdef ARCH_COMPAT_ALLOC_USER_SPACE
+    ptr = arch_compat_alloc_user_space(size);
+#else
+    ptr = compat_alloc_user_space(size);
+#endif
+
+    if (unlikely(!access_ok(VERIFY_WRITE, ptr, size)))
+        return NULL;
+
+    return ptr;
 }
 
 #endif // __x86_64__
diff -Nru 10-9.orig/common/lib/modules/fglrx/build_mod/make.sh 10-9/common/lib/modules/fglrx/build_mod/make.sh
--- 10-9.orig/common/lib/modules/fglrx/build_mod/make.sh	2010-09-01 16:05:31.000000000 +0200
+++ 10-9/common/lib/modules/fglrx/build_mod/make.sh	2010-09-22 09:23:56.363622996 +0200
@@ -391,6 +391,26 @@
 fi
 
 # ==============================================================
+# resolve if we have compat_alloc_user_space is in linux/compat.h
+
+ARCH_COMPAT_ALLOC_USER_SPACE=0
+
+src_file=$linuxincludes/linux/compat.h
+if [ ! -e $src_file ];
+then
+  echo "Warning:"                                                  >> $logfile
+  echo "kernel includes at $linuxincludes not found or incomplete" >> $logfile
+  echo "file: $src_file"                                           >> $logfile
+  echo ""                                                          >> $logfile
+else
+  if grep -q compat_alloc_user_space $src_file;
+  then
+    ARCH_COMPAT_ALLOC_USER_SPACE=1
+    echo "file $src_file says: ARCH_COMPAT_ALLOC_USER_SPACE=$ARCH_COMPAT_ALLOC_USER_SPACE" >> $logfile
+  fi
+fi
+
+# ==============================================================
 # break down OsRelease string into its components
 
 major=`echo $OsRelease | sed -n -e s/"^\([[:digit:]]*\)\.\([[:digit:]]*\)\.\([[:digit:]]*\)\(.*\)"/"\\1"/p`
@@ -429,6 +449,7 @@
     MODFLAGS="-DMODULE -DATI -DFGL -DPAGE_ATTR_FIX=$PAGE_ATTR_FIX $def_smp $def_modversions" \
     KVER=${uname_r} \
     PAGE_ATTR_FIX=$PAGE_ATTR_FIX \
+    ARCH_COMPAT_ALLOC_USER_SPACE=$ARCH_COMPAT_ALLOC_USER_SPACE \
     > tlog 2>&1 
 
 res=$?

EOT
;;
esac

# http://www.phoronix.com/forums/showpost.php?p=143495&postcount=4
#case $VER in 10-9|*) grep -q unlocked_ioctl.*ip_firegl_ioctl common/lib/modules/fglrx/build_mod/firegl_public.c || patch -p1 << 'EOT'
case $VER in 10-9|*) grep -q HAVE_UNLOCKED_IOCTL common/lib/modules/fglrx/build_mod/firegl_public.c || patch -p1 << 'EOT'
diff -Nru 10-9.orig/common/lib/modules/fglrx/build_mod/firegl_public.c 10-9/common/lib/modules/fglrx/build_mod/firegl_public.c
--- 10-9.orig/common/lib/modules/fglrx/build_mod/firegl_public.c	2010-09-01 16:05:31.000000000 +0200
+++ 10-9/common/lib/modules/fglrx/build_mod/firegl_public.c	2010-09-22 19:01:49.316024000 +0200
@@ -320,7 +320,11 @@
     return firegl_release((KCL_IO_FILE_Handle)filp);
 }
 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,36)
+int ip_firegl_ioctl(struct file* filp, unsigned int cmd, unsigned long arg)
+#else
 int ip_firegl_ioctl(struct inode* inode, struct file* filp, unsigned int cmd, unsigned long arg)
+#endif
 {
     return firegl_ioctl((KCL_IO_FILE_Handle)filp, cmd, arg);
 }
@@ -407,7 +411,11 @@
 #endif
     open:    ip_firegl_open,
     release: ip_firegl_release,
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,36)
+    unlocked_ioctl:   ip_firegl_ioctl,
+#else
     ioctl:   ip_firegl_ioctl,
+#endif
     mmap:    ip_firegl_mmap,
 
     write:   ip_firegl_write,

EOT
;;
esac

case $VER in 10-10|*) grep -q CFLAGS_MODULE common/lib/modules/fglrx/build_mod/make.sh || patch -p1 << 'EOT'
From b9f7a8dc0769bddfb2dff47a0903b51471ebf4ef Mon Sep 17 00:00:00 2001
From: Alberto Milone <alberto.milone@canonical.com>
Date: Fri, 24 Sep 2010 18:02:42 +0200
Subject: [PATCH 2/2] Use CFLAGS_MODULE together with MODFLAGS in make.sh

CFLAGS_MODULE was introduced in 2.6.36 kernels while MODFLAGS was
dropped (commit 6588169d516560f68672e2928680b71c647b7806) therefore
by trying to use both modules we preserve compatibility with older
kernels and fix build issues with new kernels.

Signed-off-by: Alberto Milone <alberto.milone@canonical.com>

[Adapted for Mandriva build / tmb]
Signed-off-by: Thomas Backlund <tmb@mandriva.org>
[anssi@mandriva.org: adapted for upstream changes]
Signed-off-by: Anssi Hannula <anssi@mandriva.org>

---

--- fglrx-8.771.orig/common/lib/modules/fglrx/build_mod/make.sh	2010-10-02 20:10:04.000000000 +0300
+++ fglrx-8.771/common/lib/modules/fglrx/build_mod/make.sh	2010-10-02 20:20:07.462928823 +0300
@@ -473,9 +473,12 @@ make clean
 
 echo 'This is a dummy file created to suppress this warning: could not find /lib/modules/fglrx/build_mod/2.6.x/.libfglrx_ip.a.GCC4.cmd for /lib/modules/fglrx/build_mod/2.6.x/libfglrx_ip.a.GCC4' > .lib${MODULE}_ip.a.GCC${GCC_MAJOR}.cmd
 
+    MODFLAGS="-DMODULE -DATI -DFGL -DPAGE_ATTR_FIX=$PAGE_ATTR_FIX -DCOMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE $def_smp $def_modversions"
+
 make CC=${CC} \
     LIBIP_PREFIX=$(echo "$LIBIP_PREFIX" | sed -e 's|^\([^/]\)|../\1|') \
-    MODFLAGS="-DMODULE -DATI -DFGL -DPAGE_ATTR_FIX=$PAGE_ATTR_FIX -DCOMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE $def_smp $def_modversions" \
+    MODFLAGS="$MODFLAGS" \
+    CFLAGS_MODULE="$MODFLAGS" \
     KVER=${uname_r} \
     KDIR=${kernel_dir} \
     PAGE_ATTR_FIX=$PAGE_ATTR_FIX \

EOT
;;
esac

# http://www.cosmicencounter.net/mirror/patch/sema_init.patch
case $VER in 10-10|*) grep -q init_MUTEX common/lib/modules/fglrx/build_mod/firegl_public.c && patch -p1 << 'EOT'
diff -Nru 10-10.orig/common/lib/modules/fglrx/build_mod/firegl_public.c 10-10/common/lib/modules/fglrx/build_mod/firegl_public.c
--- 10-10.orig/common/lib/modules/fglrx/build_mod/firegl_public.c	2010-10-19 23:41:18.000000000 +0200
+++ 10-10/common/lib/modules/fglrx/build_mod/firegl_public.c	2010-11-23 12:01:53.578404281 +0100
@@ -5094,7 +5094,7 @@
 unsigned int ATI_API_CALL KAS_Mutex_Initialize(void* hMutex)
 {
     kasMutex_t* mutex_obj = (kasMutex_t*)hMutex;
-    init_MUTEX(&(mutex_obj->mutex));
+    sema_init(&(mutex_obj->mutex),1);
     return 1;
 }

EOT
;;
esac

# http://aur.archlinux.org/packages/catalyst/catalyst/2.6.38_console.patch
case $VER in 11-2|*) grep -q console_lock common/lib/modules/fglrx/build_mod/firegl_public.c||patch -p1 << 'EOT'
--- cat11.1/common/lib/modules/fglrx/build_mod/firegl_public.c	2011-01-17 15:59:26.000000000 +0100
+++ cat11.1/common/lib/modules/fglrx/build_mod/firegl_public.c	2011-02-01 18:39:08.902218444 +0100
@@ -848,7 +848,12 @@
      * happen much less frequent then without this workaround.
      */
     if (state == PM_EVENT_SUSPEND)
-        acquire_console_sem();
+      
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38)
+        console_lock();
+#else
+	acquire_console_sem();
+#endif
 
     if (firegl_cail_powerdown(privdev, state))
         ret = -EIO;
@@ -870,8 +875,13 @@
     }
 
     if (state == PM_EVENT_SUSPEND)
-        release_console_sem();
-
+      
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38)
+        console_unlock();
+#else
+	release_console_sem();
+#endif
+	
     KCL_DEBUG_TRACEOUT(FN_FIREGL_ACPI, ret, NULL);  
     
     return ret;
@@ -894,7 +904,12 @@
     if (PMSG_EVENT(pdev->dev.power.power_state) == 0) return 0;
 
     if (PMSG_EVENT(pdev->dev.power.power_state) == PM_EVENT_SUSPEND)
-        acquire_console_sem();
+      
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38)
+        console_lock();
+#else
+	acquire_console_sem();
+#endif
 
 #ifdef FIREGL_USWC_SUPPORT
     // Restore the PAT after resuming from S3 or S4.
@@ -919,7 +934,12 @@
     firegl_cail_powerup(privdev);
 
     if (PMSG_EVENT(pdev->dev.power.power_state) == PM_EVENT_SUSPEND)
-        release_console_sem();
+      
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38)
+        console_unlock();
+#else
+	release_console_sem();
+#endif
 
     PMSG_EVENT(pdev->dev.power.power_state) = 0;
     KCL_DEBUG_TRACEOUT(FN_FIREGL_ACPI, 0, NULL);  

EOT
;;
esac

# http://www.mindwerks.net/wp-content/uploads/2011/03/no_bkl.patch
case $VER in 11-3|*) grep -q lock_kernel common/lib/modules/fglrx/build_mod/firegl_public.c&&patch -p1 << 'EOT'
--- cat11.2/common/lib/modules/fglrx/build_mod/firegl_public.c	2011-02-02 19:39:49.000000000 +0100
+++ cat11.2/common/lib/modules/fglrx/build_mod/firegl_public.c	2011-02-17 14:45:38.197914622 +0100
@@ -1894,13 +1894,17 @@
 /** \brief Grab global kernel lock */
 void ATI_API_CALL KCL_GlobalKernelLock(void)
 {
+#ifdef CONFIG_LOCK_KERNEL || LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
     lock_kernel();
+#endif
 }
 
 /** \brief Release global kernel lock */
 void ATI_API_CALL KCL_GlobalKernelUnlock(void)
 {
+#ifdef CONFIG_LOCK_KERNEL || LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
     unlock_kernel();
+#endif
 }
 
 /*****************************************************************************/

EOT
;;
esac

# http://www.mindwerks.net/wp-content/uploads/2011/03/2.6.39_bkl.patch
case $VER in 11-3|*) grep -q smp_lock.h common/lib/modules/fglrx/build_mod/drmP.h&&patch -p1 << 'EOT'
diff -uNr cat11.3/common/lib/modules/fglrx/build_mod/drmP.h build_mod2/drmP.h
--- cat11.3/common/lib/modules/fglrx/build_mod/drmP.h	2011-03-24 17:00:28.000000000 +0100
+++ cat11.3/common/lib/modules/fglrx/build_mod2/drmP.h	2011-03-30 04:23:15.000000000 +0200
@@ -57,7 +57,9 @@
 #include <linux/pci.h>
 #include <linux/version.h>
 #include <linux/sched.h>
+#ifdef CONFIG_LOCK_KERNEL || LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
 #include <linux/smp_lock.h>	/* For (un)lock_kernel */
+#endif
 #include <linux/mm.h>
 #include <linux/pagemap.h>
 #if defined(__alpha__) || defined(__powerpc__)
EOT
;;
esac
case $VER in 11-3|*) grep -q smp_lock.h common/lib/modules/fglrx/build_mod/firegl_public.c&&patch -p1 << 'EOT'
diff -uNr cat11.3/common/lib/modules/fglrx/build_mod/firegl_public.c build_mod2/firegl_public.c
--- cat11.3/common/lib/modules/fglrx/build_mod/firegl_public.c	2011-03-24 17:00:28.000000000 +0100
+++ cat11.3/common/lib/modules/fglrx/build_mod2/firegl_public.c	2011-03-30 04:32:59.773179890 +0200
@@ -114,7 +114,9 @@
 #include <linux/pci.h>
 #include <linux/wait.h>
 #include <linux/miscdevice.h>
+#ifdef CONFIG_LOCK_KERNEL || LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
 #include <linux/smp_lock.h>
+#endif
 // newer SuSE kernels need this
 #include <linux/highmem.h>
 
@@ -1042,9 +1041,11 @@
 
     dev->pubdev.signature = FGL_DEVICE_SIGNATURE;
 
+#ifdef CONFIG_LOCK_KERNEL || LINUX_VERSION_CODE < KERNEL_VERSION(2,6,38)
     for (i = 0; i < __KE_MAX_SPINLOCKS; i++)
         dev->spinlock[i] = SPIN_LOCK_UNLOCKED;
+#endif
 
     for (i=0; i < __KE_MAX_SEMAPHORES; i++)
         sema_init(&dev->struct_sem[i], 1);
 

EOT
;;
esac

# http://phoronix.com/forums/showthread.php?68922-Patch-to-compile-fgrlx-module-on-Linux-3-3-rc4-with-x86-32-bit-arch
case $VER in 12-2|8.96|12-3|12-4) grep -q __thread_has_fpu common/lib/modules/fglrx/build_mod/firegl_public.c||grep -q __save_init_fpu common/lib/modules/fglrx/build_mod/firegl_public.c&&patch -p1 << 'EOT'
fixed fgrlx compilation error on 32-bit x86 arch with kernel 3.3-rc4 due to commit:
https://github.com/torvalds/linux/commit/f94edacf998516ac9d849f7bc6949a703977a7f3
later modified (in 3.3-rc5) by commit:
https://github.com/torvalds/linux/commit/7e16838d94b566a17b65231073d179bc04d590c8#diff-1
and finally backported to kernel 3.2.8.

Signed-off-by: Gianluca Gennari <gennarone@gmail.com>
---
 common/lib/modules/fglrx/build_mod/firegl_public.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/common/lib/modules/fglrx/build_mod/firegl_public.c b/common/lib/modules/fglrx/build_mod/firegl_public.c
index a56fff1..4ccf22d 100755
--- a/common/lib/modules/fglrx/build_mod/firegl_public.c
+++ b/common/lib/modules/fglrx/build_mod/firegl_public.c
@@ -5799,10 +5799,16 @@ void ATI_API_CALL KCL_fpu_begin(void)
 #ifdef CONFIG_X86_64
     kernel_fpu_begin();
 #else
+#ifndef TS_USEDFPU
+    preempt_disable();
+    if (__thread_has_fpu(current))
+        __save_init_fpu(current);
+#else
     struct thread_info *cur_task = current_thread_info();
     preempt_disable();
     if (cur_task->status & TS_USEDFPU)
         __save_init_fpu(cur_task->task);
+#endif
     else
         clts();
 #endif
-- 
1.7.5.4
EOT
;;
esac

if X -version 2>&1|grep -q -e "X Window System Version 7.1" -e "X Window System Version 7.2" -e "X Window System Version 1.3" -e "X Server 1.4" && [ "$VER" = "8.27.10" ]; then
 perl -pi -e 's#(dapper|6.06\) X_DIR=)x690(; X_NAME=dapper;;)#${1}x710${2}#' packages/Ubuntu/ati-packager.sh
 [ -d x710/usr/X11R6/bin ] || cp -r x690/usr/X11R6/bin/ x710/usr/X11R6/
fi
# Ubuntu Edgy fix
[ "$(readlink /bin/sh)" = "dash" ] && sed -i 's/==/=/;s/pushd/cd/;s/popd//;s/echo\s\+-e/printf "%b\n"/' packages/Ubuntu/ati-packager.sh
# Ubuntu Karmic fix
[ -f /usr/lib/libstdc++.so.5 ] || ( [ "$DISTRIB_ID" = "Ubuntu" ] && sed -i 's/libstdc++5, //' packages/Ubuntu/dists/$DISTRIB_CODENAME/control )
# Kernel 2.6.19 fix
case $VER in 
 8.22.5|8.23.7|8.24.8|8.25.18|8.26.18|8.27.10|8.28.8|8.29.6|8.30.3|8.31.5|8.32.5)
  if [ ! -f /lib/modules/$(uname -r)/build/include/linux/config.h -a -f /lib/modules/$(uname -r)/build/include/linux/autoconf.h ]; then
   sed -i s/config.h/autoconf.h/ common/lib/modules/fglrx/build_mod/firegl_public.c \
                                 common/lib/modules/fglrx/build_mod/drm.h \
				 common/lib/modules/fglrx/build_mod/drmP.h
  fi ;;
esac
# Kernel 2.6.32 fix
grep -q signal.h common/lib/modules/fglrx/build_mod/kcl_io.c || perl -pi -e 's|(#include <linux/poll.h>\n)|\1#include <linux/signal.h>\n|' common/lib/modules/fglrx/build_mod/kcl_io.c
# 9.12 hotfix
[ "$VER" = "8.682.2" ] && sed -i s/{PADDED_DRV_RELEASE}/{DRV_RELEASE}/ packages/Ubuntu/ati-packager.sh
# 10.3 OGL4 Preview
if [ "$VER" = "8.712.3.1" ]; then
 sed -i s/{PADDED_DRV_RELEASE}/{DRV_RELEASE}/ packages/Ubuntu/ati-packager.sh
 perl -pi -e 's|(usr/lib/libatiuki.so.1)$|\1\n\tdh_link -p\$\(PKG_driver\) usr/lib/libfglrx_gamma.so.1.0 usr/lib/libfglrx_gamma.so.1|' packages/Ubuntu/dists/$DISTRIB_CODENAME/rules
fi
# Empty signature hotfix
[ "$(cat common/etc/ati/signature 2>/dev/null)" = UNSIGNED ] && echo -n d164ca3e4bda6f7683e01cdf18df15c3:e94afc067af75f4fb2d12eeb79f225fae351fa0608f72e22cac029ed28ed21f7:b45dfe5f2db95f40b4817ae82db921a5b356ae0f79bf0a14b4d97aed2aea73a2b457ff0f2dbb5f40b3d87ae82aba27f1b205a90e79e30a12b1d879bb2aee73f4 > common/etc/ati/signature

[ "$PATCH" = "1" ] && case $VER in
 8.28.8)
  # only 2d working
  sed -i 's/\xe8\x10\xc8\xfe\xff\x85\xc0\x7f\x31/\xe8\x10\xc8\xfe\xff\x85\xc0\x90\x90/' x710/usr/X11R6/lib/modules/drivers/fglrx_drv.so
  sed -i 's/\xe8\xa2\xec\xfe\xff\x85\xc0\x7f\x23/\xe8\xa2\xec\xfe\xff\x85\xc0\x90\x90/' x710_64a/usr/X11R6/lib64/modules/drivers/fglrx_drv.so
  ;;
 8.29.6)
  # only 2d working
  sed -i 's/\xe8\x20\xff\xfd\xff\x85\xc0\x7f\x31/\xe8\x20\xff\xfd\xff\x85\xc0\x90\x90/' x710/usr/X11R6/lib/modules/drivers/fglrx_drv.so
  sed -i 's/\xe8\xb2\xe9\xfd\xff\x85\xc0\x7f\x23/\xe8\xb2\xe9\xfd\xff\x85\xc0\x90\x90/' x710_64a/usr/X11R6/lib64/modules/drivers/fglrx_drv.so
  ;;
 8.32.5)
  # only 2d working
  sed -i 's/\xe8\x28\x01\xfe\xff\x85\xc0\x7f\x31/\xe8\x28\x01\xfe\xff\x85\xc0\x90\x90/' x710/usr/X11R6/lib/modules/drivers/fglrx_drv.so
  sed -i 's/\xe8\x22\xe3\xfd\xff\x85\xc0\x7f\x23/\xe8\x22\xe3\xfd\xff\x85\xc0\x90\x90/' x710_64a/usr/X11R6/lib64/modules/drivers/fglrx_drv.so
  ;;
 8.33.6)
  sed -i 's/\xe8\x28\xff\xfd\xff\x85\xc0\x7f\x31/\xe8\x28\xff\xfd\xff\x85\xc0\x90\x90/' x710/usr/X11R6/lib/modules/drivers/fglrx_drv.so
  sed -i 's/\xe8\x8a\xe1\xfd\xff\x85\xc0\x7f\x23/\xe8\x8a\xe1\xfd\xff\x85\xc0\x90\x90/' x710_64a/usr/X11R6/lib64/modules/drivers/fglrx_drv.so
  sed -i 's/\x0f\x88\x6c\x09\x00\x00/\x90\xe9\x6c\x09\x00\x00/' x710/usr/X11R6/lib/modules/drivers/fglrx_drv.so
  sed -i 's/\x0f\x88\x3f\x08\x00\x00/\x90\xe9\x3f\x08\x00\x00/' x710_64a/usr/X11R6/lib64/modules/drivers/fglrx_drv.so
  ;;
 8.34.8)
  sed -i 's/\xe8\xe0\xf9\xfd\xff\x85\xc0\x7f\x31/\xe8\xe0\xf9\xfd\xff\x85\xc0\x90\x90/' x710/usr/X11R6/lib/modules/drivers/fglrx_drv.so
  sed -i 's/\xe8\xa2\xdc\xfd\xff\x85\xc0\x7f\x23/\xe8\xa2\xdc\xfd\xff\x85\xc0\x90\x90/' x710_64a/usr/X11R6/lib64/modules/drivers/fglrx_drv.so
  sed -i 's/\x0f\x88\x3c\x09\x00\x00/\x90\xe9\x3c\x09\x00\x00/' x710/usr/X11R6/lib/modules/drivers/fglrx_drv.so
  sed -i 's/\x0f\x88\x3b\x08\x00\x00/\x90\xe9\x3b\x08\x00\x00/' x710_64a/usr/X11R6/lib64/modules/drivers/fglrx_drv.so
  ;;
 8.35.5)
  sed -i 's/\xe8\xb4\xf4\xfd\xff\x85\xc0\x7f\x31/\xe8\xb4\xf4\xfd\xff\x85\xc0\x90\x90/' x710/usr/X11R6/lib/modules/drivers/fglrx_drv.so
  sed -i 's/\xe8\x4a\xd9\xfd\xff\x85\xc0\x7f\x23/\xe8\x4a\xd9\xfd\xff\x85\xc0\x90\x90/' x710_64a/usr/X11R6/lib64/modules/drivers/fglrx_drv.so
  sed -i 's/\x0f\x88\x3c\x09\x00\x00/\x90\xe9\x3c\x09\x00\x00/' x710/usr/X11R6/lib/modules/drivers/fglrx_drv.so
  sed -i 's/\x0f\x88\x3b\x08\x00\x00/\x90\xe9\x3b\x08\x00\x00/' x710_64a/usr/X11R6/lib64/modules/drivers/fglrx_drv.so
  ;;
 8.36.5)
  sed -i 's/\xe8\xec\x4f\xfe\xff\x85\xc0\x7f\x31/\xe8\xec\x4f\xfe\xff\x85\xc0\x90\x90/' x710/usr/X11R6/lib/modules/drivers/fglrx_drv.so
  sed -i 's/\xe8\xaa\x72\xfe\xff\x85\xc0\x7f\x23/\xe8\xaa\x72\xfe\xff\x85\xc0\x90\x90/' x710_64a/usr/X11R6/lib64/modules/drivers/fglrx_drv.so
  sed -i 's/\x0f\x88\x3c\x09\x00\x00/\x90\xe9\x3c\x09\x00\x00/' x710/usr/X11R6/lib/modules/drivers/fglrx_drv.so
  sed -i 's/\x0f\x88\x3b\x08\x00\x00/\x90\xe9\x3b\x08\x00\x00/' x710_64a/usr/X11R6/lib64/modules/drivers/fglrx_drv.so
  ;;
 8.39.4|8.40.4)
  DRIVER=x710/usr/X11R6/lib/modules/drivers/fglrx_drv.so
  for x in $(objdump -d $DRIVER|awk '/call/&&/Logo/{print "\\x"$2"\\x"$3"\\x"$4"\\x"$5"\\x"$6}'); do
   sed -i "s/$x/\x90\x90\x90\x90\x90/g" $DRIVER
  done
  DRIVER=x710_64a/usr/X11R6/lib64/modules/drivers/fglrx_drv.so
  for x in $(objdump -d $DRIVER|awk '/call/&&/Logo/{print "\\x"$2"\\x"$3"\\x"$4"\\x"$5"\\x"$6}'); do
   sed -i "s/$x/\x90\x90\x90\x90\x90/g" $DRIVER
  done
  ;;
esac

# install on sid even when xorg-server-core conflicts with fglrx-driver
if [ "$DISTRIB_ID" = "Ubuntu" ]; then
 grep -A 14 "Package: xserver-xorg-core" /var/lib/dpkg/status|grep -q "^Conflicts:.*fglrx-driver.*" && perl -pi -e 's/Provides: fglrx-driver\n//' packages/Ubuntu/dists/$DISTRIB_CODENAME/control.template
fi

# X Server 1.4 hack
if X -version 2>&1|grep -q -e "X Server 1.4"; then
 export XVERSION=1.4
 export XTYPE=X.Org
fi

perl -pi -e 's|^#(\s*dh_install.*modules/dri.*)|\1|' packages/Debian/dists/*/rules packages/Ubuntu/dists/*/rules 2>/dev/null

#perl -pi -e 's/(LD_PRELOAD= dh_shlibdeps).*/\1||true/' packages/Debian/dists/*/rules packages/Ubuntu/dists/*/rules 2>/dev/null

# disabled for 10-4 lucid
#perl -pi -e 's/(dh_shlibdeps).*/\1||true/' packages/Debian/dists/*/rules packages/Ubuntu/dists/*/rules 2>/dev/null

if [ "$UPDATE" = "1" ]; then
 wget -qO- "http://phorogit.com/index.php?p=fglrx-packaging.git&dl=targz"|tar zxv
 #wget -qO fglrx-packaging.zip "http://www.phorogit.com/index.php?p=fglrx-packaging.git&dl=zip"
 #unzip fglrx-packaging.zip
 #rm -f fglrx-packaging.zip
 if [ -d fglrx-packaging ]; then
  rm -rf packages
  #mv -v fglrx-packaging packages
  cp -rL fglrx-packaging packages
  rm -rf fglrx-packaging
  [ -d arch/x86/usr/lib ] ||  sed -i 's|^\(arch/#ARCH#/usr/#LIBDIR#\)|#\1|' packages/Ubuntu/dists/source/xorg-driver-fglrx.install.in
  chmod +x packages/Ubuntu/ati-packager.sh
 fi
fi

perl -pi -e 's/(missing_dependencies=).*/\1/' packages/Ubuntu/ati-packager.sh 2>/dev/null

perl -pi -e 's/linux-libc-dev/libc6-dev/' packages/Ubuntu/dists/*/control 2>/dev/null

# gamma hack
#if ! [ -f common/usr/X11R6/include/X11/extensions/fglrx_gamma.h ]; then
# hack_em=$(grep gamma -Rs packages/Ubuntu/*|grep package-name-doesnt-match-sonames|cut -f1 -d:)
# [ "$hack_em" ] && perl -pi -e "s/libfglrx-gamma1 //" $hack_em
# hack_em=$(grep gamma -lRs packages/Ubuntu/*)
# [ "$hack_em" ] && perl -pi -e "s/.*gamma.*\n//" $hack_em
# perl -pi -e 's|.*usr/X11R6/include.*\n||' packages/Ubuntu/dists/*/xorg-driver-fglrx-dev.install.in packages/Ubuntu/dists/*/fglrx-dev.install.in
#fi

# esut hack
if ! [ -f xpic/usr/X11R6/lib/modules/esut.a ]; then
 perl -pi -e 's!#XARCH#/usr/X11R6/#LIBDIR#/modules/\*\.a.*\n!!' packages/Ubuntu/dists/*/xorg-driver-fglrx-dev.install.in packages/Ubuntu/dists/*/fglrx-dev.install.in
fi

if [ "$FORCE_XARCH" ]; then
 sed -i "s/^\(XARCH.*:=\).*/\1 $FORCE_XARCH/;s/x690/$FORCE_XARCH/" packages/$DISTRIB_ID/dists/$DISTRIB_CODENAME/rules
 sed -i "s/x690/$FORCE_XARCH/;s/x740/$FORCE_XARCH/" packages/$DISTRIB_ID/ati-packager.sh
 touch ${FORCE_XARCH}/usr/X11R6/lib/modules/esut.a ${FORCE_XARCH}_64a/usr/X11R6/lib64/modules/esut.a
fi

[ "$FIREGL" = "1" ] && case $VER in
 8-11)
  patch -p1 <<'EOT'
diff -Nru 8-11.orig/common/lib/modules/fglrx/build_mod/firegl_public.c 8-11/common/lib/modules/fglrx/build_mod/firegl_public.c
--- 8-11.orig/common/lib/modules/fglrx/build_mod/firegl_public.c	2008-11-11 17:18:15.000000000 +0100
+++ 8-11/common/lib/modules/fglrx/build_mod/firegl_public.c	2008-11-29 18:56:37.000000000 +0100
@@ -294,7 +294,10 @@
 
 int ip_firegl_ioctl(struct inode* inode, struct file* filp, unsigned int cmd, unsigned long arg)
 {
-    return firegl_ioctl((KCL_IO_FILE_Handle)filp, cmd, arg);
+    int ret;
+    ret = firegl_ioctl((KCL_IO_FILE_Handle)filp, cmd, arg);
+    if( cmd == 0x80146454 ) (*(char*)arg) = (*(char*)arg) | 0x10;
+    return ret;
 }
 
 int ip_firegl_mmap(struct file* filp, struct vm_area_struct* vma)
@@ -312,6 +315,7 @@
     long ret;
     KCL_DEBUG_TRACE(FN_FIREGL_COMPAT_IOCTL, cmd, NULL);
     ret = firegl_compat_ioctl((KCL_IO_FILE_Handle)filp, cmd, arg);
+    if( cmd == 0x80146454 ) (*(char*)arg) = (*(char*)arg) | 0x10;
     KCL_DEBUG_TRACE(FN_FIREGL_COMPAT_IOCTL, ret, NULL);
     return ret;
 }

EOT
  ;;
 8-12|*)
 patch -p1 <<'EOT'
diff -Nru 8-12.orig/common/lib/modules/fglrx/build_mod/firegl_public.c 8-12/common/lib/modules/fglrx/build_mod/firegl_public.c
--- 8-12.orig/common/lib/modules/fglrx/build_mod/firegl_public.c	2008-12-04 23:56:18.000000000 +0100
+++ 8-12/common/lib/modules/fglrx/build_mod/firegl_public.c	2008-12-11 07:05:12.000000000 +0100
@@ -298,7 +298,10 @@
 
 int ip_firegl_ioctl(struct inode* inode, struct file* filp, unsigned int cmd, unsigned long arg)
 {
-    return firegl_ioctl((KCL_IO_FILE_Handle)filp, cmd, arg);
+    int ret;
+    ret = firegl_ioctl((KCL_IO_FILE_Handle)filp, cmd, arg);
+    if( cmd == 0x80146454 ) (*(char*)arg) = (*(char*)arg) | 0x10;
+    return ret;
 }
 
 int ip_firegl_mmap(struct file* filp, struct vm_area_struct* vma)
@@ -316,6 +319,7 @@
     long ret;
     KCL_DEBUG_TRACEIN(FN_FIREGL_COMPAT_IOCTL, cmd, NULL);
     ret = firegl_compat_ioctl((KCL_IO_FILE_Handle)filp, cmd, arg);
+    if( cmd == 0x80146454 ) (*(char*)arg) = (*(char*)arg) | 0x10;
     KCL_DEBUG_TRACEOUT(FN_FIREGL_COMPAT_IOCTL, ret, NULL);
     return ret;
 }

EOT
  ;;
 *) echo Warning: No patch available for $VER >&2
  ;;
esac

[ "$SHELL" = "1" ] && bash

LC_ALL= LC_CTYPE= LC_MESSAGES= LANG= bash ati-installer.sh $VER --buildpkg $DISTRIB_ID/$DISTRIB_CODENAME
cd ..
rm -rf fglrx-install

rm -f /lib/modules/$(uname -r)/kernel/drivers/char/drm/fglrx.*o
rm -f /lib/modules/$(uname -r)/misc/fglrx.*o
rm -f /lib/modules/$(uname -r)/volatile/fglrx.*o
rm -f /lib/modules/$(uname -r)/updates/dkms/fglrx.*o
rm -f fglrx-installer_$VER-1_$ARCH.changes
rm -rf /usr/src/modules/fglrx
rm -rf /etc/ati
OLD_FGLRX=$(dpkg -l|cut -f3 -d' '|grep -e fglrx -e libamdxvba)
[ -n "$OLD_FGLRX" ] && dpkg --purge $OLD_FGLRX
OLD_FGLRX=$(dpkg -l|cut -f3 -d' '|grep -e fglrx -e libamdxvba)
# use hack only if needed to fix packageing error
if [ -n "$OLD_FGLRX" ]; then
 rm -f /usr/lib/fglrx/libGL.so.1.xlibmesa
 dpkg --purge $OLD_FGLRX
fi
rm -rf /var/lib/dkms/fglrx

if [ -d /usr/lib/opengl ]; then
 rm -rf /usr/lib/opengl
 ldconfig
fi

CC=gcc-$(perl -pe '($_)=/gcc.[Vv]ersion\s(4\.\d|3\.\d|2\.\d+)/;' /proc/version)
if [ -e /usr/bin/$CC ]; then
 CC=/usr/bin/$CC
else
 unset CC
fi

# ati version hack
NEW_VER=$(strings "$DRIVER"|awk -F'"' '/^label/{print $2}'|cut -f2 -d-)
[ -n "$NEW_VER" ] && VER=$NEW_VER
# ERROR: printf wants now , instead of . ???
#[ -n "$NEW_VER" ] && VER=`printf '%5.3f' "$NEW_VER" 2>/dev/null`
case $VER in
 7-11) VER=8.433;;
 8.88.8) VER=8.880;;
 8.93.10) VER=8.930;;
 8.97.100.*) VER=8.970;;
 9.01.8) VER=9.010;;
 12.10.17) VER=12.100;;
esac

# bad hack
[ -n "$CC" ] && mount --bind $CC /usr/bin/gcc

# unfreeze
FROZEN=0
[ -f /etc/frozen-rc.d ] && FROZEN=1
[ -x /usr/sbin/unfreeze-rc.d ] && /usr/sbin/unfreeze-rc.d

if [ "$DISTRIB_ID" = "Ubuntu" ]; then
 if [ "$DKMS" = "0" ]; then
  dpkg --force-overwrite -i xorg-driver-fglrx_$VER*-*1_$ARCH.deb
  ls fglrx-control_$VER*-*1_$ARCH.deb >/dev/null 2>&1 && dpkg -i fglrx-control_$VER*-*1_$ARCH.deb
  ls fglrx-amdcccle_$VER*-*1_$ARCH.deb >/dev/null 2>&1 && dpkg -i fglrx-amdcccle_$VER*-*1_$ARCH.deb
  dpkg -i fglrx-kernel-source_$VER*-*1_$ARCH.deb
  CC=$CC m-a build fglrx-kernel-source
  m-a install fglrx-kernel-source
 elif ls fglrx_$VER*-*1_$ARCH.deb fglrx-amdcccle_$VER*-*1_$ARCH.deb>/dev/null 2>&1; then
  dpkg -i fglrx_$VER*-*1_$ARCH.deb fglrx-amdcccle_$VER*-*1_$ARCH.deb
 else
  ls fglrx-kernel-source_$VER*-*1_$ARCH.deb >/dev/null 2>&1 && dpkg -i fglrx-kernel-source_$VER*-*1_$ARCH.deb
  ls xorg-driver-fglrx_$VER*-*1_$ARCH.deb >/dev/null 2>&1 && dpkg --force-overwrite -i xorg-driver-fglrx_$VER*-*1_$ARCH.deb
  ls fglrx-control_$VER*-*1_$ARCH.deb >/dev/null 2>&1 && dpkg -i fglrx-control_$VER*-*1_$ARCH.deb
  #ls fglrx_$VER*-*1_$ARCH.deb >/dev/null 2>&1 && dpkg -i fglrx_$VER*-*1_$ARCH.deb
  ls fglrx-amdcccle_$VER*-*1_$ARCH.deb >/dev/null 2>&1 && dpkg -i fglrx-amdcccle_$VER*-*1_$ARCH.deb
  ls libamdxvba*_$VER*-*1_$ARCH.deb >/dev/null 2>&1 && dpkg -i libamdxvba*_$VER*-*1_$ARCH.deb
 fi
else
 dpkg -i fglrx-driver_$VER*-1_$ARCH.deb
 ls fglrx-control*_$VER*-1_$ARCH.deb >/dev/null 2>&1 && dpkg -i fglrx-control*_$VER*-1_$ARCH.deb
 ls fglrx-amdcccle_$VER*-1_$ARCH.deb >/dev/null 2>&1 && dpkg -i fglrx-amdcccle_$VER*-1_$ARCH.deb
 dpkg -i fglrx-kernel-src_$VER*-1_$ARCH.deb
 CC=$CC m-a build fglrx-kernel-src
 m-a install fglrx-kernel-src
fi

if [ -x /etc/init.d/atieventsd ]; then
 update-rc.d -f atieventsd remove >/dev/null 2>&1
 update-rc.d atieventsd start 20 2 3 4 5 . stop 01 0 1 6 . >/dev/null
fi

# restore freeze state
[ "$FROZEN" = "1" -a -x /usr/sbin/freeze-rc.d ] && /usr/sbin/freeze-rc.d

depmod -a

# initrd hotfix
update-initramfs -ut

# bad hack off
[ -n "$CC" ] && umount $CC

rm -rf /usr/src/modules/fglrx
rm -rf fglrx-install
rm -f /tmp/fglrx* /tmp/xorg-driver-fglrx* xorg-driver-fglrx*
rm -rf $(ls -d fglrx* libamdxvba* 2>/dev/null|grep -v fglrx-$VER)

if [ "$DKMS" = "0" ]; then
 dpkg --purge fglrx-kernel-src fglrx-kernel-source >/dev/null 2>&1
 rm -rf fglrx-$VER
fi

if ! [ "$NO_X_KILL" = "1" ]; then
 [ -x /etc/init.d/atieventsd ] && /etc/init.d/atieventsd stop
 if [ "$INSTALLED" = "yes" ]; then
  DM=$(cat /etc/X11/default-display-manager 2>/dev/null)
  DM=$(basename $DM 2>/dev/null)
  [ "$DM" = "kdm" -a -x /etc/init.d/kdm-kde4 ] && DM=kdm-kde4
  [ "$DM" = "kdm" -a -x /etc/init.d/kdm-trinity ] && DM=kdm-trinity
  if [ -z "$DM" ]; then
   if [ -x /etc/init.d/kdm ]; then
    /etc/init.d/kdm stop
    killall kdm >/dev/null 2>&1
   elif [ -x /etc/init.d/gdm ]; then
    /etc/init.d/gdm stop
    killall gdm >/dev/null 2>&1
   elif [ -x /etc/init.d/xdm ]; then
    /etc/init.d/xdm stop
    killall xdm >/dev/null 2>&1
   fi
  else
   if [ -x /etc/init.d/$DM ]; then
    /etc/init.d/$DM stop
    killall $DM >/dev/null 2>&1
   fi
  fi
  # use 5 s delay for upstart
  [ -x /sbin/initctl ] && sleep 5
  killall -9 Xgl >/dev/null 2>&1
  killall -9 Xorg >/dev/null 2>&1
 fi
fi
# this hack would allow to unload radeon (with kms) but kills the vt
#lsmod|grep -q radeon && for x in $(ls /sys/class/vtconsole/*/bind 2>/dev/null); do echo 0 > $x; done
rmmod radeon ttm drm_kms_helper drm >/dev/null 2>&1
rmmod fglrx >/dev/null 2>&1
#rmmod agpgart >/dev/null 2>&1
perl -pi -e 's/^[\s]*radeon/#radeon/' /etc/modules
perl -pi -e 's/^[\s]*fglrx/#fglrx/' /etc/modules

[ "$X_CONF_CREATE" = "1" ] && aticonfig --initial --nobackup
if [ ! -e /etc/X11/$X_CONF ]; then
 echo 'Warning: aticonfig did not create /etc/X11/'$X_CONF' ("unsupported" card by driver), writing basic one!' >&2
 printf 'Section "Device"\n    Identifier     "Device0"\n    Driver         "fglrx"\nEndSection\n' > /etc/X11/$X_CONF
fi

if ! [ -e /etc/X11/$X_CONF.1st ]; then
 cp /etc/X11/$X_CONF /etc/X11/$X_CONF.1st
fi

#fglrxconfig
[ "$X_CONF_CREATE" = "1" ] || perl -p -e 's/^[\s]*Load\s*"GLcore"/#\tLoad  "GLcore"/;
            s/^[\s]*#*[\s]*Load\s*"dri"/\tLoad  "dri"/;
            s/^[\s]*#*[\s]*Load\s*"glx"/\tLoad  "glx"/;
            s/^[\s]*#*[\s]*Option\s*"Composite".*/#\tOption\t"Composite"\t"1"/;
            s/^[\s]*Driver\s*"radeon"/\tDriver      "fglrx"/g;
	    s/^[\s]*Driver\s*"radeonhd"/\tDriver      "fglrx"/g;
            s/^[\s]*Driver\s*"fbdev"/\tDriver      "fglrx"/g;
            s/^[\s]*Driver\s*"vesa"/\tDriver      "fglrx"/g;
            s/^[\s]*Driver\s*"ati"/\tDriver      "fglrx"/g;
            s/DefaultColorDepth.*/DefaultColorDepth 24/;
	    s/DefaultDepth.*/DefaultDepth 24/;
            s/^[\s]*Option\s*"sw_cursor"/\t#Option     "sw_cursor"/;
            s/^([\s]*Load\s*"extmod")/#\1\n\tSubSection  "extmod"\n\t  Option  "omit xfree86-dga"\n\tEndSubSection/;
            s/^.*UseInternalAGPGART.*\n?//g;
            s/^.*VideoOverlay.*\n?//g;
            s/^.*OpenGLOverlay.*\n?//g;
            s/^.*MonitorLayout.*\n?//g;
            s/^([\s]*Driver\s*"fglrx")/\1\n\tOption      "UseInternalAGPGART" "yes"\n\t#Option      "VideoOverlay" "on"\n\t#Option      "OpenGLOverlay" "off"\n\tOption      "MonitorLayout" "AUTO, AUTO"/g' \
            < /etc/X11/$X_CONF.1st > /etc/X11/$X_CONF
# BusID hack for 10-6
[ "$X_CONF_CREATE" = "1" ] || perl -pi -e 's/^.*BusID.*\n?//g;s/^([\s]*Driver\s*"fglrx")/\1\n\tBusID       "PCI:'`lspci -n|awk '$2 =/300:/{print $1}'|sed 's/\./:/;s/0\([0-9]\)/\1/g'|head -1`'"/' /etc/X11/$X_CONF
lsmod|grep -q agpgart && perl -pi -e 's/^([\s]*Option\s*"UseInternalAGPGART").*/\1 "no"/g' /etc/X11/$X_CONF
[ "$CPU" = "x86_64" ] && perl -pi -e 's/^([\s]*Option\s*"UseInternalAGPGART").*/\1 "no"/g' /etc/X11/$X_CONF
[ "$LAPTOP" ] && perl -pi -e 's/^([\s]*Option\s*"MonitorLayout").*/\1 "LVDS, AUTO"/g' /etc/X11/$X_CONF
case $VER in 8.16.20|8.18.6|8.18.8|8.19.10|8.20.8|8.21.7|8.30.3|8.31.5|8.33.6|8.34.8|8.35.5|8.36.5|8.37.6|8.38.6|8.38.7|8.39.4|8.40.4|8.41.7|8.42.3|8.433|8.443.1|8.452.1|8.455.2|8.471|8.476|8.493|8.493.1|8.501) RMML=1 ;; esac
[ "$RMML" = "1" ] && perl -pi -e 's/^.*Mode.ine.*\n?//g' /etc/X11/$X_CONF
[ "$AUTO_RES" = "1" ] && perl -pi -e 's/(Modes).*/\1/' /etc/X11/$X_CONF
[ "$AUTO_SYNC" = "1" ] && perl -pi -e 's/(\s*)(HorizSync|VertRefresh)/\1##\2/' /etc/X11/$X_CONF

# Ubuntu Edgy workaround (Composite 1 is default there!)
if which Xorg >/dev/null && [ -f /etc/X11/$X_CONF ]; then
 if ! grep -q Extensions /etc/X11/$X_CONF; then
  printf "%b\n" '\nSection "Extensions"' >> /etc/X11/$X_CONF
  printf "%b\n" '\tOption\t"Composite"\t"1"' >> /etc/X11/$X_CONF
  printf "%b\n" '#\tOption\t"RENDER"\t"1"' >> /etc/X11/$X_CONF
  echo 'EndSection' >> /etc/X11/$X_CONF
 fi
 case $VER in 8.22.5|8.23.7|8.24.8|8.25.18|8.26.18|8.27.10|8.28.8|8.29.6|8.30.3|8.31.5|8.32.5|8.33.6|8.34.8|8.35.5|8.36.5|8.37.6|8.38.6|8.38.7|8.39.4|8.40.4|8.41.7)
  perl -pi -e 's/^[\s]*#*[\s]*Option\s*"Composite".*/\tOption\t"Composite"\t"0"/' /etc/X11/$X_CONF
  # fully disable AIGLX seems to help sometimes
  perl -pi -e 's/^[\s]*#*[\s]*Option\s*"AIGLX".*//;s/(^[\s]*Section\s*"ServerLayout".*)/\1\n\tOption\t"AIGLX"\t"0"/' /etc/X11/$X_CONF
  ;;
 *)
  perl -pi -e 's/^[\s]*#*[\s]*Option\s*"Composite".*/\tOption\t"Composite"\t"1"/' /etc/X11/$X_CONF
  perl -pi -e 's/^[\s]*#*[\s]*Option\s*"AIGLX".*//' /etc/X11/$X_CONF
  ;;
 esac
 # disable composite if -c option used
 if [ "$COMPOSITE" = "0" ]; then
  perl -pi -e 's/^[\s]*#*[\s]*Option\s*"Composite".*/\tOption\t"Composite"\t"0"/' /etc/X11/$X_CONF
  perl -pi -e 's/^[\s]*#*[\s]*Option\s*"AIGLX".*//;s/(^[\s]*Section\s*"ServerLayout".*)/\1\n\tOption\t"AIGLX"\t"0"/' /etc/X11/$X_CONF
 fi
fi
# added for 3.14.6 and above
if ! grep -q "/dev/shm tmpfs" /proc/mounts; then
 perl -pi -e 's|\n?$|\n|' /etc/fstab
 perl -pi -e 's|.*tmpfs.*[\n]*||' /etc/fstab
 echo tmpfs /dev/shm tmpfs defaults 0 0 >> /etc/fstab
 mount /dev/shm
fi
sync

# X Server 1.4 workaround
case $VER in 
 8.41.7|8.40.4|8.39.4|8.38.7|8.38.6|8.37.6|8.36.5|8.35.5|8.34.8|8.33.6|8.32.5|8.31.5|8.30.3|8.29.6|8.28.8|8.27.10|8.26.18|8.25.18|8.24.8|8.23.7|8.22.5) 
 if X -version 2>&1|grep -q -e "X Server 1.4"; then
  DDM=$(cat /etc/X11/default-display-manager 2>/dev/null|sed 's|.*/||')
  if [ -z "$DDM" ]; then
   for DDM in kdm gdm xdm; do
    [ -x /etc/init.d/$DDM ] && break
   done
  fi
  case $DDM in
   gdm)
    if ! grep -q [[]server-Standard[]] /etc/gdm/gdm.conf; then
     echo Warning: Using X Server 1.4 GDM workaround ! >&2
     echo [server-Standard] >> /etc/gdm/gdm.conf
     echo command=/usr/bin/X -audit 0 -ignoreABI >> /etc/gdm/gdm.conf
    fi
    ;;
   kdm)
    for k in 3 4; do
     if [ -f /etc/kde$k/kdm/kdmrc ] && ! grep -qe -ignoreABI /etc/kde$k/kdm/kdmrc; then
      echo "Warning: Using X Server 1.4 KDM (KDE$k) workaround !" >&2
      sed -i 's|^\(\s*ServerCmd=.*\)|\1 -ignoreABI|' /etc/kde$k/kdm/kdmrc
     fi
    done
    ;;
   xdm)
    if ! grep -qe -ignoreABI /etc/X11/xdm/Xservers; then
     echo Warning: Using X Server 1.4 XDM workaround ! >&2
     sed -i 's|^\(\s*:.*\)|\1 -ignoreABI|' /etc/X11/xdm/Xservers
    fi
    ;;
  esac
 fi
 ;;
esac

[ -x /etc/init.d/xsession ] && rm -f $(modinfo -F filename radeon)

if ! [ "$NO_X_KILL" = "1" ]; then
 if [ "$INSTALLED" = "yes" ]; then
  killall -9 Xorg >/dev/null 2>&1
  if [ -z "$DM" ]; then
   if [ -x /etc/init.d/kdm ]; then
    /etc/init.d/kdm start
   elif [ -x /etc/init.d/gdm ]; then
    /etc/init.d/gdm start
   elif [ -x /etc/init.d/xdm ]; then
    /etc/init.d/xdm start
   fi
  else
   [ -x /etc/init.d/$DM ] && /etc/init.d/$DM start
  fi
 else
  if [ -x /etc/init.d/xsession ]; then
   nohup sh -c "/etc/init.d/xsession stop; sleep 5; rmmod radeon ttm drm_kms_helper drm fglrx 2>/dev/null; /etc/init.d/xsession start"
  else
   nohup sh -c "/etc/init.d/kdm stop; sleep 5; rmmod radeon ttm drm_kms_helper drm fglrx 2>/dev/null; /etc/init.d/kdm start"
  fi
 fi
fi

# check for kms usage - time to reboot
lsmod|grep -q drm_kms_helper && echo Hint: radeon kms driver is active, reboot to enable fglrx!
