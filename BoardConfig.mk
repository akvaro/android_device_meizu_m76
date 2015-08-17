USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/meizu/mx4pro/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := exynos5
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_SLSI_VARIANT := insignal
TARGET_SOC := exynos5430
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
OVERRIDE_RS_DRIVER := libRSDriverArm.so

USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/meizu/mx4pro/egl.cfg
BOARD_USES_ALSA_AUDIO := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# WiFi
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/etc/firmware/fw_bcmdhd.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

TARGET_BOOTLOADER_BOARD_NAME := m76
TARGET_BOARD_INFO_FILE := device/meizu/mx4pro/board-info.txt

TARGET_NO_RADIOIMAGE := true
TARGET_PREBUILT_KERNEL := device/meizu/mx4pro/kernel
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x26000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x26000000 --tags_offset 0x00000100 --dt device/meizu/mx4pro/dt.img
KERNEL_EXFAT_MODULE_NAME := "exfat"

# Recovery
TARGET_RECOVERY_FSTAB := device/meizu/mx4pro/recovery.fstab
RECOVERY_FSTAB_VERSION := 2

TARGET_BOOTANIMATION_SIZE := 2560x1440

# TWRP
RECOVERY_SDCARD_ON_DATA := true
TW_NO_REBOOT_BOOTLOADER := true
DEVICE_RESOLUTION := 1080x1920
TW_MAX_BRIGHTNESS := 1680
PRODUCT_COPY_FILES += device/meizu/mx4pro/twrp.fstab:recovery/root/etc/twrp.fstab

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28600958976
BOARD_FLASH_BLOCK_SIZE := 131072

# Assert
TARGET_OTA_ASSERT_DEVICE := mx4pro,m76

