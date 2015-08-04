#
# Copyright (C) 2014 The Android Open-Source Project
# Copyright (C) 2015 Tatsuyuki Ishi
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
DEVICE_PACKAGE_OVERLAYS := device/meizu/mx4pro/overlay

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libmarvell-ril.so

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

PRODUCT_PACKAGES := \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4335/device-bcm.mk)

PRODUCT_PACKAGES += \
    lights.m76
