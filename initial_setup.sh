#!/bin/bash
set -e

source "build/envsetup.sh";
source "vendor/blaze/build/envsetup.sh";

# Build kernel with KernelSU from main branch
cd kernel/xiaomi/sm8450
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -s main
git add --all
git commit -m "Build kernel with KernelSU from main branch"

cd ../../..
