---
---

**Fix boot order on external SD card**

> To force a boot from SD you need to remove power from the board completely, hold down S2 and then re-apply power. Keep holding the button until the four leds start turning on. You have to do this at power on, and once you've done it the board will continue to boot from SD on a reboot or reset, only removing power will change the behaviour. You could also move R68 to R93 if you want to make the board boot from SD by default.

> Also note the boot sequence in the table on page 6 of the schematics, by default if MLO can't be found on the eMMC, it'll look for it on the SD card. So deleting MLO normally causes the board to boot from SD if the appropriate files are present.


