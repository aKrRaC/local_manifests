#!/bin/bash
set -e

source "build/envsetup.sh";
source "vendor/awaken/build/envsetup.sh";

# Reference/Source: https://xdaforums.com/t/development-of-lineageos-and-oss-kernel-for-xiaomi-sm-gen-4-5-10-devices.4589247/

# vendor/awaken
changes=(
367044 # android: merge_dtbs: Respect miboard-id while merging
)
repopick -g 'https://review.lineageos.org' -P vendor/awaken ${changes[@]}&

# device/qcom/sepolicy_vndr/sm8450
changes=(
383884 # sepolicy_vndr: update sepolicy for health HAL service
)
repopick -g 'https://review.lineageos.org' -P device/qcom/sepolicy_vndr/sm8450 ${changes[@]}&

# Build kernel with KernelSU from main branch
cd kernel/xiaomi/sm8450
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -s main
git add --all
git commit -m "Build kernel with KernelSU from main branch"

cd ../../..
