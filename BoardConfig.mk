#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include device/lge/gproj-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/lge/e975/include

LOCAL_C_INCLUDES := $(kernel_includes)

BOARD_KERNEL_CMDLINE := vmalloc=600M console=null lpj=67677 user_debug=31 msm_rtb.filter=0x0 ehci-hcd.park=3 coresight-etm.boot_enable=0 androidboot.hardware=geehrc
TARGET_KERNEL_CONFIG := gproj_defconfig

# F2FS Support
TARGET_USERIMAGES_USE_F2FS := true

BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

TARGET_BOOTLOADER_BOARD_NAME := geehrc
TARGET_BOOTLOADER_NAME=e975

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/e975/bluetooth

# FIXME: HOSTAPD-derived wifi driver
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2097152000 # 2000M. Actually 2048, but hold some in reserve

-include vendor/lge/e975/BoardConfigVendor.mk

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_SEPOLICY_DIRS += \
        device/lge/e975/sepolicy

#TWRP config
DEVICE_RESOLUTION := 720x1280
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_REAL_SDCARD := true
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
#TW_INCLUDE_JB_CRYPTO := true
TW_FLASH_FROM_STORAGE := true
TW_NO_USB_STORAGE := true
HAVE_SELINUX := true

TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/usb-otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
TARGET_RECOVERY_INITRC := device/lge/e975/recovery/init.rc
TW_BRIGHTNESS_PATH := /sys/class/backlight/lm3530/brightness
TW_MAX_BRIGHTNESS := 255

TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#TARGET_RECOVERY_FSTAB = device/lge/e975/recovery/twrp.fstab
TARGET_RECOVERY_FSTAB = device/lge/e975/fstab.geehrc

PRODUCT_COPY_FILES += device/lge/e975/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

#MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/lge/e975/mr_init_devices.c
MR_RD_ADDR := 0x82500000
MR_DPI := hdpi
MR_DPI_FONT := 240
MR_FSTAB := device/lge/e975/recovery/twrp.fstab
MR_KEXEC_MEM_MIN := 0x85000000
MR_INFOS := device/lge/e975/mrom_infos

## We need this for FM support
#TARGET_QCOM_AUDIO_VARIANT := caf

BOARD_HARDWARE_CLASS += device/lge/e975/cmhw
