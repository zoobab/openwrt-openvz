Openwrt-openvz
==============

OpenWRT OpenVZ container

Version
=======

Tested with r34054 (fetched the 1st Nov 2012) of openwrt trunk for x86 arch.

Installation
============

You can copy the openwrt-x86-generic-rootfs.tar.gz in your /var/lib/vz/template/cache/ directory.

A binary is available here:

http://filez.zoobab.com/openwrt/openvz/x86/openwrt-x86-generic-rootfs.tar.gz

And then use:

    * 23:23 root@trogir /home/zoobab# vzctl create 105 --ostemplate openwrt-x86-generic-rootfs

Use
===

Once the container is started, You have to create /dev/pts to be able to do a vzctl enter:

    * 23:23 root@trogir /home/zoobab# vzctl exec 113 mkdir -p /dev/pts            
    * 23:23 root@trogir /home/zoobab# vzctl exec 113 mount -t devpts none /dev/pts
    * 23:23 root@trogir /home/zoobab# vzctl enter 113                             
    entered into CT 113
    
    
    BusyBox v1.19.4 (2012-11-01 19:15:19 GMT) built-in shell (ash)
    Enter 'help' for a list of built-in commands.
    
      _______                     ________        __
     |       |.-----.-----.-----.|  |  |  |.----.|  |_
     |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
     |_______||   __|_____|__|__||________||__|  |____|
              |__| W I R E L E S S   F R E E D O M
     -----------------------------------------------------
     BARRIER BREAKER (Bleeding Edge, r34054)
     -----------------------------------------------------
      * 1/2 oz Galliano         Pour all ingredients into
      * 4 oz cold Coffee        an irish coffee mug filled
      * 1 1/2 oz Dark Rum       with crushed ice. Stir.
      * 2 tsp. Creme de Cacao
     -----------------------------------------------------
    root@owrt3:/#

Bugs
====

1. Some earlier versions of openwrt (such as 12.04 Attitude Adjustment) does not "mount" properly (see https://dev.openwrt.org/ticket/11618)
2. Changing the passwd to have dropbear SSH does not work, still have to investigate why
3. /etc/rc.common complains about accessing /proc/sys/kernel/core_pattern :

    * 23:33 root@trogir /etc/vz/dists/scripts# vzctl restart 113
    Restarting container
    Stopping container ...
    Container was stopped
    Container is unmounted
    Starting container ...
    Container is mounted
    Adding IP address(es): 192.168.20.113
    /etc/rc.common: line 85: can't create /proc/sys/kernel/core_pattern: Permission denied
    Setting CPU units: 1000
    /etc/rc.common: line 85: can't create /proc/sys/kernel/core_pattern: Permission denied
    Container start in progress...

