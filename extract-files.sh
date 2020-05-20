#!/bin/bash
#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

# Required!
export DEVICE=RMX1921
export DEVICE_COMMON=sdm710-common
export VENDOR=realme

export DEVICE_BRINGUP_YEAR=2019

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

LINEAGE_ROOT="${MY_DIR}"/../../..

HELPER="${LINEAGE_ROOT}/vendor/aim/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

SECTION=
KANG=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

# Initialize the helper for common device
setup_vendor "${DEVICE_COMMON}" "${VENDOR}" "${LINEAGE_ROOT}" true "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" \
        "${KANG}" --section "${SECTION}"

if [ -s "${MY_DIR}/../${DEVICE}/proprietary-files.txt" ]; then
    # Reinitialize the helper for device
    source "${MY_DIR}/../${DEVICE}/extract-files.sh"
    setup_vendor "${DEVICE}" "${VENDOR}" "${LINEAGE_ROOT}" false "${CLEAN_VENDOR}"

    extract "${MY_DIR}/../${DEVICE}/proprietary-files.txt" "${SRC}" \
            "${KANG}" --section "${SECTION}"
fi

"${MY_DIR}/setup-makefiles.sh"
