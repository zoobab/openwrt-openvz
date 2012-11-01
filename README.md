Openwrt-openvz
==============

OpenWRT OpenVZ container

Version
=======

Tested with r34054 of openwrt trunk for x86 arch.

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

1. Some earlier versions of openwrt does not "mount" properly
2. Changing the passwd to have dropbear SSH does not work, still have to investigate why
