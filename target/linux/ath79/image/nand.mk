include ./common-netgear.mk

define Device/glinet_ar300m_nand
  ATH_SOC := qca9533
  DEVICE_TITLE := GL-AR300M (NAND)
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-storage kmod-usb-ledtrig-usbport
  KERNEL_SIZE := 2048k
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  VID_HDR_OFFSET := 512
  IMAGES := factory.ubi sysupgrade.tar
  IMAGE/sysupgrade.tar := sysupgrade-tar
  IMAGE/factory.ubi := append-kernel | pad-to $$$$(KERNEL_SIZE) | append-ubi
endef
TARGET_DEVICES += glinet_ar300m_nand

define Device/netgear_wndr4300
  ATH_SOC := ar9344
  DEVICE_TITLE := NETGEAR WNDR4300 (NAND)
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
  NETGEAR_KERNEL_MAGIC := 0x33373033
  KERNEL := kernel-bin | append-dtb | lzma -d20 | netgear-uImage lzma
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma -d20 | netgear-uImage lzma
  NETGEAR_BOARD_ID := WNDR4300
  NETGEAR_HW_ID := 29763948+0+128+128+2x2+3x3
  MTD_PARTS := ar934x-nfc:256k(u-boot)ro,256k(u-boot-env)ro,256k(caldata)ro,512k(pot),2048k(language),512k(config),3072k(traffic_meter),2048k(kernel),23552k(ubi),25600k@0x6c0000(firmware),256k(caldata_backup),-(reserved)
  KERNEL_SIZE := 4096k
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  VID_HDR_OFFSET := 512
  IMAGES := factory.ubi sysupgrade.tar
  IMAGE/sysupgrade.tar := sysupgrade-tar
  IMAGE/factory.ubi := append-kernel | pad-to $$$$(KERNEL_SIZE) | append-ubi | netgear-dni
endef
TARGET_DEVICES += netgear_wndr4300
