# Crossfade GNU/Linux 0.90
# Kickstart File
# Copywrite (C) 2015 Be <be.0@gmx.com>
#
# This file can be used with livecd-creator to generate a live DVD/USB ISO image of Crossfade GNU/Linux with patched versions of the imgcreate and pykickstart libraries. The patches are included as here documents in this Kickstart files.
# See the HTML manual for instructions on installing, using, and modifying Crossfade GNU/Linux.
#
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. The "source code" for Crossfade GNU/Linux referred to by the GNU General Public License means this Kickstart file, the crossfade-usb-install and crossfade-boot scripts, and the manual.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# The GNU General Public License version 3 can be found as an HTML document in the "license.html" or a text document in the "license" file included in this torrent. It is also available online at http://www.gnu.org/licenses/gpl.html
#
# Crossfade GNU/Linux is a Fedora® Remix containing software from sources other than Fedora, namely RPMFusion and PlanetCCRMA. Fedora® is a registered trademark of Red Hat, Inc. This is NOT provided or supported by the Fedora Project or Red Hat, Inc. Official Fedora Spins are available through the Fedora Project website, http://fedoraproject.org/ , through free downloads of live DVD/USB installation images. The Fedora Project also maintains links to vendors selling installation media and a volunteer initiative to provide free media upon request. See http://fedoraproject.org/get-fedora-all for more details.

lang en_US.UTF-8
keyboard us
timezone US/Central
auth --useshadow --enablemd5
selinux --enforcing
firewall --enabled --service=mdns
xconfig --startxonboot
services --enabled=NetworkManager --disabled=network,sshd
part / --size 5000

repo --name=fedora --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-22&arch=i386
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f22&arch=i386
repo --name=rpmfusion-free --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-22&arch=i386
repo --name=rpmfusion-free-updates --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-22&arch=i386
repo --name=planetcore --baseurl=http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetcore/22/i386
repo --name=planetccrma --baseurl=http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetccrma/22/i386

%pre
rpm --import https://fedoraproject.org/static/95A43F54.txt
rpm --import 'http://rpmfusion.org/keys?action=AttachFile&do=get&target=RPM-GPG-KEY-rpmfusion-free-fedora-22'
rpm --import http://ccrma.stanford.edu/planetccrma/apt/configuration/all/RPM-GPG-KEY.planetccrma.txt
%end

%packages
rpmfusion-free-release
planetccrma-repo

# system
@standard
@core
@input-methods
@hardware-support
planetccrma-core-PAE
kernel-rtPAE-modules-extra
kernel-tools
-kernel-rt
-kernel
-kernel-modules-extra
-gfs2-utils
grub2-efi
grub2-efi-modules
grub2-tools
memtest86+
anaconda
@anaconda-tools
initial-setup-gui

# filesystems
exfat-utils
fuse-exfat
simple-mtpfs
gvfs-mtp
gvfs-afc
fuse-afp
ifuse
gvfs-afp
gvfs-gphoto2
gvfs-archive
fuse-sshfs

# desktop
@base-x
@guest-desktop-agents
fedora-icon-theme
arandr
abrt-desktop
xdg-user-dirs-gtk
xscreensaver-base
dbus-x11

# All of XFCE, minus a few packages that are unnecessary on a live USB and pull in heavy dependencies
xfce4*
# -xfce4-xfswitch-plugin # Pulls in GNOME dependencies
-xfce4-sensors-plugin # Pulls in Perl dependencies
-xfce4-vala
-xfce4-dev-tools
mate-themes-extras # For DeLorean-Dark GTK theme
qt-config
xfconf
xfdesktop
xfwm4
lightdm-gtk
Thunar
thunar-archive-plugin
thunar-media-tags-plugin
thunar-volman
tumbler
catfish
orage
ristretto
seahorse
xarchiver
galculator
leafpad
atril

# Internet
@dial-up
network-manager-applet
nm-connection-editor
NetworkManager-bluetooth
NetworkManager-config-connectivity-fedora
NetworkManager-tui
NetworkManager-openconnect
NetworkManager-openvpn
NetworkManager-pptp
NetworkManager-vpnc
openssh-askpass

midori
tor
claws-mail-plugins-pgp
pidgin-otr
transmission-daemon
transmission-cli
transmission-gtk
transgui

# sound
alsa*
-alsamixergui
pavucontrol
pulseaudio-utils
pulseaudio-module-bluetooth
pulseaudio-module-lirc
pulseaudio-module-x11
pulseaudio-module-jack
jack-audio-connection-kit-example-clients
qjackctl
gladish
phonon-backend-gstreamer # Required so ffado does not pull in huge VLC dependency
ffado

# music
mixxx
xwax
giada
sooperlooper
projectM-jack
projectM-pulseaudio

clementine
soundconverter
puddletag

audacity-freeworld
ardour3
hydrogen
guitarix
rakarrack
fmit
# qsynth
# yoshimi
lv2*plugins
-lv2-ambix-plugins # over 400 MiB
ladspa*plugins
# Do not include both LV2 and LADSPA versions of plugins that have packages for both to avoid cluttering menus
-ladspa-calf-plugins
-ladspa-swh-plugins
-ladspa-fil-plugins

projectM-jack
projectM-pulseaudio

# media
gnash-plugin
youtube-dl
gstreamer-plugins-good
gstreamer-plugins-good-extras
gstreamer1-plugins-good
gstreamer1-plugins-good-extras
gstreamer1-plugins-bad-free

vorbis-tools
opus
opus-tools
opusfile
mplayer
smplayer
ffmpeg
faad2
gstreamer-plugins-bad
gstreamer-plugins-ugly
gstreamer1-plugins-bad-freeworld
gstreamer1-plugins-ugly

# CD/DVD
livecd-tools
xorriso
cdrdao
dvd+rw-tools
asunder
gnomebaker

# system rescue
gparted
ddrescue
testdisk
fsarchiver
extundelete
giis
foremost
chntpw
chkrootkit
mate-disk-usage-analyzer

# miscellaneous
screen
htop
grsync
p7zip
unar
isomd5sum
patch

-*-devel
-gigolo

# Remove these Fedora packages to comply with Fedora trademark guidelines:
# https://fedoraproject.org/wiki/Legal:Trademark_guidelines?rd=Legal/TrademarkGuidelines#Distributing_combinations_of_Fedora_software_with_non-Fedora_or_modified_Fedora_software
-fedora-logos
-fedora-release
-fedora-release-notes
-fedora-release-nonproduct
generic-logos
generic-release
generic-release-notes
generic-release-nonproduct
%end

%post --nochroot
VERSION=0.90

cd $INSTALL_ROOT
# Patches for https://bugzilla.redhat.com/show_bug.cgi?id=1149029 to get below script to work
{ patch usr/lib/python2.7/site-packages/imgcreate/creator.py << 'creator'
***************
*** 704,709 ****
--- 704,710 ----
  
              if not s.inChroot:
                  env["INSTALL_ROOT"] = self._instroot
+                 env["KICKSTART_FILE"] = self.ks.ksfilename
                  preexec = None
                  script = path
              else:
creator
}
{ patch usr/lib/python2.7/site-packages/pykickstart/parser.py << 'parser'
***************
*** 472,477 ****
--- 472,478 ----
  
          self._sections = {}
          self.setupSections()
+         self.ksfilename = ""
  
      def _reset(self):
          """Reset the internal variables of the state machine for a new kickstart file."""
***************
*** 717,722 ****
--- 718,725 ----
                  if os.path.exists(os.path.join(self.currentdir[self._includeDepth - 1], f)):
                      f = os.path.join(self.currentdir[self._includeDepth - 1], f)
  
+         if not self.ksfilename: # do not overwrite with %included kickstart filenames
+             self.ksfilename = f
          cd = os.path.dirname(f)
          if not cd.startswith("/"):
              cd = os.path.abspath(cd)
parser
}

if [ -d /usr/lib/grub/x86_64-efi ]; then
	cp -r /usr/lib/grub/x86_64-efi usr/lib/grub
else
	wget https://alt.fedoraproject.org/pub/fedora/linux/releases/22/Everything/x86_64/os/Packages/g/grub2-efi-modules-2.02-0.16.fc22.x86_64.rpm
	rpm2cpio grub2-efi-modules-*.x86_64.rpm | cpio -id
	rm grub2-efi-modules-*.x86_64.rpm
fi

cd "$(dirname "$KICKSTART_FILE")"
shopt -s extglob
cp -r !(LiveOS|isolinux|crossfade*.iso|cache|tmp) $LIVE_ROOT
mkdir -p "${INSTALL_ROOT}/usr/share/crossfade"
cp -r !(LiveOS|isolinux|crossfade*.iso|cache|tmp) "${INSTALL_ROOT}/usr/share/crossfade"
cp crossfade-usb-install crossfade-boot "${INSTALL_ROOT}/usr/bin"
chown root "${INSTALL_ROOT}/usr/bin/crossfade-boot"
chmod 744 "${INSTALL_ROOT}/usr/bin/crossfade-boot"
%end


%post
VERSION=0.90
sed -i "s/Generic release/Crossfade GNU\/Linux $VERSION/g" /etc/fedora-release /etc/issue
cat > /etc/os-release << release
NAME=Crossfade GNU/Linux
VERSION=$VERSION
ID=crossfade
VERSION_ID=$VERSION
release

sed -i 's/base\[NORMAL\] = "#dbdbdb" #Non Gtk apps like Spotify and Opera use this as the entry text-input color. So its better to color the images for the entry background colors#/base[NORMAL] = @base_color #Qt with the GTK theme uses this for some backgrounds/' /usr/share/themes/DeLorean-Dark/gtk-2.0/gtkrc

/usr/sbin/useradd -c "Live System User" liveuser
passwd -d liveuser > /dev/null
passwd -d root > /dev/null
/usr/sbin/usermod -aG jackuser,wheel liveuser > /dev/null

echo 'liveuser - rtprio 99' >> /etc/security/limits.conf
echo 'source /etc/locale.conf' >> /etc/profile
echo 'export PA_ALSA_PLUGHW=1 # Correction for sample rate error when using Mixxx with ALSA' >> /etc/profile
# Prevent initial sudo warning from displaying when using using crossfade-usb-install script
echo 'Defaults !lecture' >> /etc/sudoers


echo 'PRELINKING=no' > /etc/sysconfig/prelink

# add static hostname to work around xauth bug
# https://bugzilla.redhat.com/show_bug.cgi?id=679486
echo "localhost" > /etc/hostname

sed -i 's/^#autologin-user=.*/autologin-user=liveuser/' /etc/lightdm/lightdm.conf
sed -i 's/^#autologin-user-timeout=.*/autologin-user-timeout=0/' /etc/lightdm/lightdm.conf
sed -i 's/^#user-session=.*/user-session=xfce/' /etc/lightdm/lightdm.conf

cd /home/liveuser
cat > .bashrc << bashrc
source /etc/bashrc
# Move cache to RAM to avoid filling up /home and unnecessary I/O. Particularly important for Midori.
export XDG_CACHE_HOME=/tmp/liveuser-cache
bashrc
mkdir -p music/.mixxx-analysis desktop .mixxx .config/autostart .config/Clementine .local/share/applications
# Mixxx library analysis data can be hundreds of MiB, so symlink it to music partition
ln -s ../music/.mixxx-analysis .mixxx/analysis
{ cat > .asoundrc << 'asoundrc'
# asoundrc's from http://www.pogo.org.uk/~mark/linuxdj/
# ALSA devices using hw: devices that do not exist will not show up in Mixxx. That is, if none of these interfaces are plugged in, nothing changes.
#
# Native Instruments Audio 2 DJ
#

# All channels as one device (eg. for use with JACK)

pcm.audio2dj_full {
	type multi

	slaves.a { pcm "hw:Audio2DJ,0,0"; channels 2 }
	slaves.b { pcm "hw:Audio2DJ,0,1"; channels 2 }

	bindings.0 { slave a; channel 0 }
	bindings.1 { slave a; channel 1 }
	bindings.2 { slave b; channel 0 }
	bindings.3 { slave b; channel 1 }
}

# A dummy control device to keep JACK happy

ctl.audio2dj_full {
	type hw
	card 0
}

#
# Native Instruments Audio 4 DJ
#

# All channels as one device (eg. for use with JACK)

pcm.a4dj_full {
	type multi

	slaves.a { pcm "hw:Audio4DJ,0,0"; channels 2 }
	slaves.b { pcm "hw:Audio4DJ,0,1"; channels 2 }

	bindings.0 { slave a; channel 0 }
	bindings.1 { slave a; channel 1 }
	bindings.2 { slave b; channel 0 }
	bindings.3 { slave b; channel 1 }
}

# A dummy control device to keep JACK happy

ctl.a4dj_full {
	type hw
	card 0
}

#
# asoundrc entries for Traktor Audio 6
# Carl Brothers <decibelkaos at gmail.com>
#

# These options will Enable/Disable the passthrough on your Traktor
# Audio 6.  Personally, I just created shortcut buttons with the
# commands, and it works flawlessly.
#
# amixer -c T6 cset numid=1 on   # switch PASSTHRU on channel A
# amixer -c T6 cset numid=2 on   # switch PASSTHRU on channel B
# amixer -c T6 cset numid=3 on   # switch PHONO/LINE on channel A
# amixer -c T6 cset numid=4 on   # switch PHONO/LINE on channel B

pcm.T6_capture {
	type dsnoop
	ipc_key 1646
	slave {
		pcm "hw:T6"
		period_size 0
		buffer_size 65536
		rate 44100
		channels 6
	}
}

pcm.T6_playback {
	type dmix
	ipc_key 1646
	slave {
		pcm "hw:T6"
		period_size 0
		buffer_size 65536
		rate 44100
		channels 6
	}
}

pcm.T6_duplex {
	type asym
	playback.pcm T6_playback
	capture.pcm T6_capture
}

pcm.T6_pair1 {
	type plug
	ttable.0.0 1.0
	ttable.1.1 1.0
	slave.pcm T6_duplex
}

pcm.T6_pair2 {
	type plug
	ttable.0.2 1.0
	ttable.1.3 1.0
	slave.pcm T6_duplex
}

pcm.T6_pair3 {
	type plug
	ttable.0.4 1.0
	ttable.1.5 1.0
	slave.pcm T6_duplex
}

#
# Native Instruments Audio 8 DJ
#

# All channels as one device (eg. for use with JACK)

pcm.a8dj_full {
	type multi

	slaves.a { pcm "hw:Audio8DJ,0,0"; channels 2 }
	slaves.b { pcm "hw:Audio8DJ,0,1"; channels 2 }
	slaves.c { pcm "hw:Audio8DJ,0,2"; channels 2 }
	slaves.d { pcm "hw:Audio8DJ,0,3"; channels 2 }

	bindings.0 { slave a; channel 0 }
	bindings.1 { slave a; channel 1 }
	bindings.2 { slave b; channel 0 }
	bindings.3 { slave b; channel 1 }
	bindings.4 { slave c; channel 0 }
	bindings.5 { slave c; channel 1 }
	bindings.6 { slave d; channel 0 }
	bindings.7 { slave d; channel 1 }
}

# A dummy control device to keep JACK happy

ctl.a8dj_full {
	type hw
	card 0
}

#
# MixVibes U46MK2
#

pcm.u46mk2_capture {
	type dsnoop
	ipc_key 1646
	slave {
		pcm "hw:U46DJ"
		period_size 0
		buffer_size 65536
		rate 44100
		channels 4
	}
}

pcm.u46mk2_playback {
	type dmix
	ipc_key 1646
	slave {
		pcm "hw:U46DJ"
		period_size 0
		buffer_size 65536
		rate 44100
		channels 6
	}
}

pcm.u46mk2_duplex {
	type asym
	playback.pcm u46mk2_playback
	capture.pcm u46mk2_capture
}

pcm.u46mk2_pair1 {
	type plug
	ttable.0.0 1.0
	ttable.1.1 1.0
	slave.pcm u46mk2_duplex
}

pcm.u46mk2_pair2 {
	type plug
	ttable.0.2 1.0
	ttable.1.3 1.0
	slave.pcm u46mk2_duplex
}

pcm.u46mk2_pair3 {
	type plug
	ttable.0.4 1.0
	ttable.1.5 1.0
	slave.pcm u46mk2_duplex
}

#
# ESI Maya 44
#

pcm.maya44_capture {
	type dsnoop
	ipc_key 1647
	slave {
		pcm "hw:USB"
		period_size 0
		buffer_size 65536
		rate 48000
		channels 4
	}
}

pcm.maya44_playback {
	type dmix
	ipc_key 1647
	slave {
		pcm "hw:USB"
		period_size 0
		buffer_size 65536
		rate 48000
		channels 4
	}
}

pcm.maya44_duplex {
	type asym
	playback.pcm maya44_playback
	capture.pcm maya44_capture
}

pcm.maya44_pair1 {
	type plug
	ttable.0.0 1.0
	ttable.1.1 1.0
	slave.pcm maya44_duplex
}

pcm.maya44_pair2 {
	type plug
	ttable.0.2 1.0
	ttable.1.3 1.0
	slave.pcm maya44_duplex
}

#
# M-Audio Delta 1010
#

pcm.ice1712_capture {
	type dsnoop
	ipc_key 1024
	slave {
		pcm "hw:M1010"
		period_size 0
		buffer_size 65536
		rate 44100
		channels 10
	}
}

pcm.ice1712_playback {
	type dmix
	ipc_key 1024
	slave {
		pcm "hw:M1010"
		period_size 0
		buffer_size 65536
		rate 44100
		channels 10
	}
}

pcm.ice1712_duplex {
	type asym
	playback.pcm ice1712_playback
	capture.pcm ice1712_capture
}

pcm.ice1712_ch12 {
	type plug
	ttable.0.0 1
	ttable.1.1 1
	slave.pcm ice1712_duplex
}

pcm.ice1712_ch34 {
	type plug
	ttable.0.2 1
	ttable.1.3 1
	slave.pcm ice1712_duplex
}

pcm.ice1712_ch56 {
	type plug
	ttable.0.4 1
	ttable.1.5 1
	slave.pcm ice1712_duplex
}

pcm.ice1712_ch78 {
	type plug
	ttable.0.6 1
	ttable.1.7 1
	slave.pcm ice1712_duplex
}

pcm.ice1712_ch90 {
	type plug
	ttable.0.8 1
	ttable.1.9 1
	slave.pcm ice1712_duplex
}
asoundrc
}

{ cat > .mixxx/mixxx.cfg << mixxx-cfg
[Playlist]
Directory /home/liveuser/music

[Library]
RescanOnStartup 1
mixxx-cfg
}

cat > /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/startxfce4
DISPLAYMANAGER=/usr/sbin/lightdm
EOF

# disable screensaver locking (#674410)
cat >> /home/liveuser/.xscreensaver << FOE
mode:           off
lock:           False
dpmsEnabled:    False
FOE

{ cd /usr/share/applications
for alsatool in echomixer envy24control hdajackretask hdspconf hdspmixer hwmixvolume lash-panel; do
	# Many of these are text-only applications and none of them will be needed by most users in normal circumstances, so hide them from the applications menu.
	echo 'NoDisplay=True' >> ${alsatool}.desktop
done
sed -i 's/pasuspender\ mixxx/pasuspender\ mixxx || mixxx/' mixxx.desktop
sed -i 's/Name=Midori/Name=Midori Web Browser/' midori.desktop
sed -i 's/Name=Leafpad/Name=Leafpad Text Editor/' midori.desktop
sed -i 's/Name=Clementine/Name=Clementine Music Player/' clementine.desktop
sed -i -e 's/Icon=anaconda/Icon=computer/' -e 's/NoDisplay=true/NoDisplay=false/' liveinst.desktop
sed -i 's/Icon=multimedia-volume-control/Icon=hwmixvolume/' pavucontrol.desktop
sed -i 's/Icon=multimedia-volume-control/Icon=preferences-desktop/' xfce4-mixer.desktop
sed -i '/OnlyShowIn=MATE;/d' mate-disk-usage-analyzer.desktop
cp {mixxx,midori,clementine,pavucontrol,xfce4-mixer}.desktop /home/liveuser/desktop
rm /etc/X11/xinit/xinitrc.d/zz-liveinst.sh # Prevent launcher for Anaconda from being shown on desktop

cd /home/liveuser/desktop
cat > Crossfade-manual.desktop << crossfade-manual
[Desktop Entry]
Name=Crossfade GNU/Linux Manual
Exec=midori /usr/share/crossfade/crossfade-manual.html
Comment=View the Crossfade GNU/Linux $VERSION manual
Type=Application
Icon=help-browser
Categories=Documentation
crossfade-manual
cat > Mixxx-manual.desktop << mixxx-manual
[Desktop Entry]
Name=Mixxx Manual
Exec=atril /usr/share/doc/mixxx/Mixxx-Manual.pdf
Comment=View the Mixxx manual
Type=Application
Icon=help-contents
Categories=Documentation
mixxx-manual
cat > crossfade-usb-install.desktop << crossfade-usb-install
[Desktop Entry]
Name=Install to USB Drive
Exec=bash -c "sudo crossfade-usb-install; bash"
Comment=Install Crossfade GNU/Linux $VERSION to a USB drive
Type=Application
Icon=media-removable
Terminal=true
Categories=System
crossfade-usb-install
cat > music-shortcut.desktop << music-shortcut
[Desktop Entry]
Name=Music
Version=0.90
Type=Application
Exec=exo-open --launch FileManager /home/liveuser/music
Comment=Your music folder
Icon=folder-music
StartupNotify=true
Terminal=false
Categories=Utility;X-XFCE;X-Xfce-Toplevel;
X-XFCE-MimeType=x-scheme-handler/file;
music-shortcut
cp {Crossfade-manual,Mixxx-manual,crossfade-usb-install}.desktop /usr/share/applications
chmod +x /home/liveuser/desktop/*.desktop
}

{ mkdir -p /home/liveuser/.config/xfce4/xfconf/xfce-perchannel-xml
cd /home/liveuser/.config/xfce4
mkdir -p desktop panel/launcher-2 panel/launcher-3

cat > desktop/icons.screen0.rc << icons
[Mixxx]
row=0
col=0

[Mixxx Manual]
row=0
col=1

[Crossfade GNU/Linux Manual]
row=0
col=2

[Audio Mixer]
row=0
col=3


[Clementine Music Player]
row=1
col=0

[Music]
row=1
col=1

[PulseAudio Volume Control]
row=1
col=2


[Midori Web Browser]
row=2
col=0

[Install to USB Drive]
row=2
col=1
icons

cat > panel/whiskermenu-1.rc << menuconfig
favorites=mixxx.desktop,exo-terminal-emulator.desktop,exo-file-manager.desktop,exo-mail-reader.desktop,exo-web-browser.desktop
recent=xfce-settings-manager.desktop
button-title=Applications
button-icon=xfce4-whiskermenu
button-single-row=false
show-button-title=true
show-button-icon=true
launcher-show-name=true
launcher-show-description=true
item-icon-size=2
hover-switch-category=false
category-icon-size=1
load-hierarchy=false
favorites-in-recent=true
display-recent-default=false
position-search-alternate=false
position-commands-alternate=false
position-categories-alternate=true
menu-width=550
menu-height=515
command-settings=xfce4-settings-manager
show-command-settings=true
command-lockscreen=xflock4
show-command-lockscreen=true
command-switchuser=gdmflexiserver
show-command-switchuser=true
command-logout=xfce4-session-logout
show-command-logout=true
command-menueditor=menulibre
show-command-menueditor=true
search-actions=4

[action0]
name=Man Pages
pattern=#
command=exo-open --launch TerminalEmulator man %s
regex=false

[action1]
name=Wikipedia
pattern=!w
command=exo-open --launch WebBrowser https://en.wikipedia.org/wiki/%u
regex=false

[action2]
name=Run in Terminal
pattern=!
command=exo-open --launch TerminalEmulator %s
regex=false

[action3]
name=Open URI
pattern=^(file|http|https):\\/\\/(.*)$
command=exo-open \\0
regex=true
menuconfig

cp /usr/share/applications/exo-file-manager.desktop panel/launcher-2
cp /usr/share/applications/exo-terminal-emulator.desktop panel/launcher-3

cat > panel/battery-9.rc << battery
display_percentage=false
tooltip_disaply_percentage=true
tooltip_display_time=true
battery

cd xfconf/xfce-perchannel-xml

cat > xfce4-panel.xml << panel
<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-panel" version="1.0">
  <property name="configver" type="int" value="2"/>
  <property name="panels" type="array">
    <value type="int" value="1"/>
    <property name="panel-1" type="empty">
      <property name="position" type="string" value="p=8;x=683;y=752"/>
      <property name="length" type="uint" value="100"/>
      <property name="position-locked" type="bool" value="false"/>
      <property name="size" type="uint" value="30"/>
      <property name="plugin-ids" type="array">
        <value type="int" value="1"/>
        <value type="int" value="2"/>
        <value type="int" value="3"/>
        <value type="int" value="4"/>
        <value type="int" value="5"/>
        <value type="int" value="6"/>
        <value type="int" value="7"/>
        <value type="int" value="8"/>
        <value type="int" value="9"/>
        <value type="int" value="10"/>
      </property>
      <property name="mode" type="uint" value="0"/>
      <property name="disable-struts" type="bool" value="false"/>
      <property name="autohide" type="bool" value="false"/>
      
    </property>
  </property>
  <property name="plugins" type="empty">
    <property name="plugin-1" type="string" value="whiskermenu"/>
    <property name="plugin-2" type="string" value="launcher">
      <property name="items" type="array">
        <value type="string" value="exo-file-manager.desktop"/>
      </property>
    </property>
    <property name="plugin-3" type="string" value="launcher">
      <property name="items" type="array">
        <value type="string" value="exo-terminal-emulator.desktop"/>
      </property>
    </property>
    <property name="plugin-4" type="string" value="tasklist">
      <property name="show-labels" type="bool" value="true"/>
      <property name="flat-buttons" type="bool" value="false"/>
      <property name="show-handle" type="bool" value="false"/>
      <property name="grouping" type="uint" value="0"/>
      <property name="include-all-monitors" type="bool" value="false"/>
    </property>
    <property name="plugin-5" type="string" value="separator">
      <property name="expand" type="bool" value="true"/>
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-6" type="string" value="pager">
      <property name="rows" type="uint" value="1"/>
    </property>
    <property name="plugin-7" type="string" value="battery"/>
    <property name="plugin-8" type="string" value="xfce4-clipman-plugin"/>
    <property name="clipman" type="empty">
      <property name="settings" type="empty">
        <property name="max-texts-in-history" type="uint" value="30"/>
      </property>
      <property name="tweaks" type="empty">
        <property name="paste-on-activate" type="uint" value="1"/>
      </property>
    </property>
    <property name="plugin-9" type="string" value="systray">
      <property name="names-visible" type="array">
        <value type="string" value="abrt"/>
        <value type="string" value="networkmanager applet"/>
        <value type="string" value="thunar"/>
        <value type="string" value="clementine"/>
      </property>
    </property>
    <property name="plugin-10" type="string" value="clock">
      <property name="show-frame" type="bool" value="false"/>
      <property name="mode" type="uint" value="2"/>
    </property>
  </property>
</channel>
panel

cat > xfce4-desktop.xml << desktop
<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-desktop" version="1.0">
  <property name="desktop-icons" type="empty">
    <property name="icon-size" type="uint" value="42"/>
    <property name="file-icons" type="empty">
      <property name="show-removable" type="bool" value="false"/>
      <property name="show-trash" type="bool" value="false"/>
      <property name="show-filesystem" type="bool" value="false"/>
      <property name="show-home" type="bool" value="false"/>
    </property>
    <property name="style" type="int" value="2"/>
    <property name="show-thumbnails" type="bool" value="true"/>
    <property name="use-custom-font-size" type="bool" value="false"/>
    <property name="font-size" type="double" value="4.000000"/>
  </property>
</channel>
desktop

cat > xfwm4.xml << xfwm
<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfwm4" version="1.0">
  <property name="general" type="empty">
    <property name="cycle_apps_only" type="bool" value="false"/>
    <property name="cycle_draw_frame" type="bool" value="true"/>
    <property name="cycle_hidden" type="bool" value="true"/>
    <property name="cycle_minimum" type="bool" value="true"/>
    <property name="cycle_workspaces" type="bool" value="false"/>
    <property name="snap_to_border" type="bool" value="true"/>
    <property name="snap_to_windows" type="bool" value="true"/>
    <property name="snap_width" type="int" value="9"/>
    <property name="toggle_workspaces" type="bool" value="false"/>
    <property name="use_compositing" type="bool" value="false"/>
    <property name="workspace_count" type="int" value="4"/>
    <property name="wrap_cycle" type="bool" value="true"/>
    <property name="workspace_names" type="array">
      <value type="string" value="Workspace 1"/>
      <value type="string" value="Workspace 2"/>
      <value type="string" value="Workspace 3"/>
      <value type="string" value="Workspace 4"/>
    </property>
    <property name="wrap_layout" type="bool" value="true"/>
    <property name="wrap_resistance" type="int" value="10"/>
    <property name="wrap_windows" type="bool" value="false"/>
    <property name="wrap_workspaces" type="bool" value="false"/>
  </property>
</channel>
xfwm

cat > xsettings.xml << xsettings
<?xml version="1.0" encoding="UTF-8"?>

<channel name="xsettings" version="1.0">
  <property name="Net" type="empty">
    <property name="ThemeName" type="string" value="DeLorean-Dark"/>
    <property name="IconThemeName" type="string" value="Mist"/>
  </property>
</channel>
xsettings

cat > pointers.xml << pointers
<?xml version="1.0" encoding="UTF-8"?>

<channel name="pointers" version="1.0">
  <property name="SynPS2_Synaptics_TouchPad" type="empty">
    <property name="Properties" type="empty">
      <property name="Synaptics_Tap_Action" type="array">
        <value type="int" value="0"/>
        <value type="int" value="0"/>
        <value type="int" value="0"/>
        <value type="int" value="0"/>
        <value type="int" value="1"/>
        <value type="int" value="3"/>
        <value type="int" value="2"/>
      </property>
    </property>
  </property>
</channel>
pointers

# Show full names of icons on desktop
cat > /home/liveuser/.gtkrc-2.0 << full-icon-names
style "xfdesktop-icon-view" {
	XfdesktopIconView::ellipsize-icon-labels = 0
}
widget_class "*XfdesktopIconView*" style "xfdesktop-icon-view"
full-icon-names

# deactivate xfconf-migration (#683161)
rm -f /etc/xdg/autostart/xfconf-migration-4.6.desktop
}

cd /home/liveuser/.config
cat > Trolltech.conf << qttheme
[Qt]
style=GTK+
qttheme

cat > user-dirs.dirs << 'userdirs'
XDG_DESKTOP_DIR="$HOME/desktop"
XDG_DOWNLOAD_DIR="$HOME"
XDG_TEMPLATES_DIR="$HOME/templates"
XDG_PUBLICSHARE_DIR="$HOME/public"
XDG_DOCUMENTS_DIR="$HOME/documents"
XDG_MUSIC_DIR="$HOME/music"
XDG_PICTURES_DIR="$HOME/pictures"
XDG_VIDEOS_DIR="$HOME/videos"
userdirs

cat > Clementine/Clementine.conf << clementineconf
[LibraryConfig]
last_path=/home/liveuser/music

[LibraryWatcher]
startup_scan=true
monitor=true
cover_art_patterns=front, cover
clementineconf

mkdir -p midori/extensions/libadblock.so
# Identify as Safari so SoundCloud does not block access (it works fine with Midori and also works with Clementine)
{ cat > midori/config << 'midoriconfig'
[settings]
homepage=http://mixxx.org/forums/
default-font-size=14
location-entry-search=https://duckduckgo.com/?q=%s
download-folder=/home/liveuser
user-agent=Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-us) AppleWebKit/538+ (KHTML, like Gecko) Version/5.0 Safari/538.15+ Midori/0.5

[extensions]
libadblock.so=true
libnsplugin-manager.so/libgnashplugin.so=true
midoriconfig

cat > midori/extensions/libadblock.so/config << 'adblockconfig'
[settings]                                                                                                                                                       
filters=https://easylist-downloads.adblockplus.org/easylist.txt;https://easylist-downloads.adblockplus.org/easyprivacy.txt;
adblockconfig
}

{ cat > /home/liveuser/.local/share/applications/mimeapps.list << 'mimes'
[Added Associations]
text/plain=leafpad.desktop;
text/html=midori.desktop;
audio/musepack=clementine.desktop;
application/musepack=clementine.desktop;
application/x-ape=clementine.desktop;
audio/ape=clementine.desktop;
audio/x-ape=clementine.desktop;
audio/x-musepack=clementine.desktop;
application/x-musepack=clementine.desktop;
audio/x-mp3=clementine.desktop;
application/x-id3=clementine.desktop;
audio/mpeg=clementine.desktop;
audio/x-mpeg=clementine.desktop;
audio/x-mpeg-3=clementine.desktop;
audio/mpeg3=clementine.desktop;
audio/mp3=clementine.desktop;
audio/x-m4a=clementine.desktop;
audio/mpc=clementine.desktop;
audio/x-mpc=clementine.desktop;
audio/mp=clementine.desktop;
audio/x-mp=clementine.desktop;
application/ogg=clementine.desktop;
application/x-ogg=clementine.desktop;
audio/vorbis=clementine.desktop;
audio/x-vorbis=clementine.desktop;
audio/ogg=clementine.desktop;
audio/x-ogg=clementine.desktop;
audio/x-flac=clementine.desktop;
application/x-flac=clementine.desktop;
audio/flac=clementine.desktop;

[Default Applications]
text/plain=leafpad.desktop;
text/html=midori.desktop;
audio/musepack=clementine.desktop;
application/musepack=clementine.desktop;
application/x-ape=clementine.desktop;
audio/ape=clementine.desktop;
audio/x-ape=clementine.desktop;
audio/x-musepack=clementine.desktop;
application/x-musepack=clementine.desktop;
audio/x-mp3=clementine.desktop;
application/x-id3=clementine.desktop;
audio/mpeg=clementine.desktop;
audio/x-mpeg=clementine.desktop;
audio/x-mpeg-3=clementine.desktop;
audio/mpeg3=clementine.desktop;
audio/mp3=clementine.desktop;
audio/x-m4a=clementine.desktop;
audio/mpc=clementine.desktop;
audio/x-mpc=clementine.desktop;
audio/mp=clementine.desktop;
audio/x-mp=clementine.desktop;
application/ogg=clementine.desktop;
application/x-ogg=clementine.desktop;
audio/vorbis=clementine.desktop;
audio/x-vorbis=clementine.desktop;
audio/ogg=clementine.desktop;
audio/x-ogg=clementine.desktop;
audio/x-flac=clementine.desktop;
application/x-flac=clementine.desktop;
audio/flac=clementine.desktop;
mimes
}

cat > /etc/systemd/system/crossfade-boot.service << liveservice
[Unit]
Description=Crossfade GNU/Linux boot script

[Service]
ExecStart=/usr/bin/crossfade-boot

[Install]
WantedBy=basic.target
liveservice

systemctl enable crossfade-boot &>/dev/null

# enable tmpfs for /tmp
systemctl enable tmp.mount
# make it so that we don't do writing to the overlay for things which
# are just tmpdirs/caches
# note 
cat >> /etc/fstab << fstab
vartmp   /var/tmp    tmpfs   defaults   0  0
varcacheyum /var/cache/yum  tmpfs   mode=0755,context=system_u:object_r:rpm_var_cache_t:s0   0   0
fstab

# save a little bit of space
rm -f /boot/initramfs*
# make sure there aren't core files lying around
rm -f /core*

# forcibly regenerate fontconfig cache
fc-cache -f

# Speed up boot
for systemdUnit in firstboot-{text,graphical}.service mdmonitor{,-takeover}.service crond.service atd.service remote-fs.target nfs-client.target; do
	systemctl --no-reload disable ${systemdUnit}
done

chown -R liveuser:liveuser /home/liveuser
/usr/sbin/restorecon -R /home/liveuser

/usr/bin/mandb &> /dev/null
/usr/bin/updatedb
# Prevent ldconfig.service from running at boot
/usr/lib/systemd/systemd-update-done
%end