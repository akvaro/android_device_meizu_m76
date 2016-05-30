# inherit from the proprietary version
-include vendor/meizu/m76/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := exynos5
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_SLSI_VARIANT := cm
TARGET_SOC := exynos5430
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
OVERRIDE_RS_DRIVER := libRSDriverArm.so

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

# frameworks/native/services/surfaceflinger
# Android keeps 2 surface buffers at all time in case the hwcomposer
# misses the time to swap buffers (in cases where it takes 16ms or
# less). Use 3 to avoid timing issues.
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
    DONT_DEXPREOPT_PREBUILTS := true
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
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/fw_bcmdhd.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/meizu/m76/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/meizu/m76/bluetooth/vnd_mx4pro.txt

# RIL
BOARD_PROVIDES_LIBRIL := true

# NFC
NFC_NXP_CHIP_TYPE := PN547C2

TARGET_BOOTLOADER_BOARD_NAME := m76
TARGET_BOARD_INFO_FILE := device/meizu/m76/board-info.txt

TARGET_NO_RADIOIMAGE := true
BOARD_KERNEL_CMDLINE := console=ttyFIQ2,115200 vmalloc=512M ess_setup=0x26000000 ramoops_setup reset_reason_setup noexec=on earlyprintk no_console_suspend
BOARD_KERNEL_BASE := 0x26000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x26000000 --tags_offset 0x00000100
KERNEL_EXFAT_MODULE_NAME := "exfat"

TARGET_KERNEL_SOURCE := kernel/meizu/m76
TARGET_KERNEL_CONFIG := mx4pro_defconfig

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/meizu/m76/include

# SLSI
BOARD_USES_VIRTUAL_DISPLAY := true
BOARD_HDMI_INCAPABLE := true
BOARD_USE_ALP_AUDIO := true
BOARD_USE_SEIREN_AUDIO := true
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_NON_CACHED_GRAPHICBUFFER := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_CSC_HW := true
BOARD_USE_QOS_CTRL := false
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_VP8ENC_SUPPORT := true
BOARD_USES_SKIA_FIMGAPI := true
BOARD_USES_HWC_SERVICES := true
BOARD_USES_SCALER := true
BOARD_USES_TRUST_KEYMASTER := true
BOARD_BACK_CAMERA_ROTATION := 0
BOARD_FRONT_CAMERA_ROTATION := 0
BOARD_BACK_CAMERA_SENSOR := SENSOR_NAME_IMX220
BOARD_FRONT_CAMERA_SENSOR := SENSOR_NAME_OV5693

# Recovery
TARGET_RECOVERY_FSTAB := device/meizu/m76/recovery.fstab
RECOVERY_FSTAB_VERSION := 2

TARGET_BOOTANIMATION_SIZE := 1440x814

# TWRP
RECOVERY_SDCARD_ON_DATA := true
TW_ALWAYS_RMRF := true
TW_NO_REBOOT_BOOTLOADER := true
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28600958976
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_FLASH_BLOCK_SIZE := 131072

# Assert
TARGET_OTA_ASSERT_DEVICE := mx4pro

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/meizu/m76
