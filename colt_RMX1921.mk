#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifer: Apache-2.0
#

# Inherit some common colt stuff.
$(call inherit-product, vendor/colt/config/common_full_phone.mk)

# Inherit from RMX1921 device.
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 1080X2340

# Device identifier. This must come after all inclusions.
PRODUCT_DEVICE := RMX1921
PRODUCT_NAME := colt_RMX1921
PRODUCT_BRAND := Realme
PRODUCT_MODEL := Realme XT
PRODUCT_MANUFACTURER := Realme
PRODUCT_ARCH := arm64

PRODUCT_GMS_CLIENTID_BASE := android-realme

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="unknown-user 10 QKQ1.190918.001 unknown release-keys"

BUILD_FINGERPRINT := "realme/RMX1921/RMX1921:10/QKQ1.190918.001/1579185288:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="RMX1921" \
    TARGET_DEVICE="RMX1921"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.colt.maintainer="VishnuJith"