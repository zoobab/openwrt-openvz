Openwrt-openvz
==============

OpenWRT OpenVZ container

Version
=======

Tested with r42625 of openwrt release Barrier Breaker 14.07 for x86 (32bits, 64bits has not been released yet) arch.

Installation
============

You can copy the openwrt-x86-generic-Generic-rootfs.tar.gz in your /var/lib/vz/template/cache/ directory.

A binary is available here:

https://downloads.openwrt.org/barrier_breaker/14.07/x86/generic/openwrt-x86-generic-Generic-rootfs.tar.gz

And then use:

    # vzctl create 105 --ostemplate openwrt-x86-generic-Generic-rootfs

Use
===
    # vzct enter 105

Todo
====

1. Some processes inside openwrt consumes 99% CPU when doing a vzctl stop?
2. Disable useless services inside a container:
    /etc/init.d/sysntpd disable

Fixed
=====

1. Some earlier versions of openwrt (such as 12.04 Attitude Adjustment) does not "mount" properly (see https://dev.openwrt.org/ticket/11618), this is fixed in the barrier breaker release.
2. /etc/rc.common complains about accessing /proc/sys/kernel/core_pattern :

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

To fix this issue, you need to comment this line in /etc/init.d/network:

    init.d/network:#                echo '/tmp/%e.%p.%s.%t.core' > /proc/sys/kernel/core_pattern 

3. This pts bug has been fixed in the release "Barrier Breaker 14.07".

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
