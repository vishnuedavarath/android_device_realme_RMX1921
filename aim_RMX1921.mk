#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifer: Apache-2.0
#

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/du/config/common_full_phone.mk)

# Inherit from RMX1921 device.
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_DEVICE := RMX1921
PRODUCT_NAME := du_RMX1921
PRODUCT_BRAND := Realme
PRODUCT_MODEL := Realme XT
PRODUCT_MANUFACTURER := Realme
PRODUCT_GMS_CLIENTID_BASE := android-realme

TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sdm710-user 9 PKQ1.190101.001 eng.root.20190718.013112 release-keys"

BUILD_FINGERPRINT := "Realme/RMX1921/RMX1921:9/PKQ1.190101.001/1561987145:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="RMX1921" \
    TARGET_DEVICE="RMX1921"
