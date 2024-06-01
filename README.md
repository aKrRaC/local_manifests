![IMG_20240330_224359](https://github.com/ProjectBlaze/manifest/assets/87426352/1e62709a-d474-4ced-adad-5155801d1fe8)
Getting Started:
===============

To get started with Project Blaze, you'll need to get familiar with [Repo](https://source.android.com/source/using-repo.html) and Version Control with [Git](https://source.android.com/source/version-control.html).

To initialize your local repository, use a command like this:

```bash
repo init --depth=1 -u https://github.com/ProjectBlaze/manifest -b 14-QPR2
```

Then to sync up:

```
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune
```

---------------------------------------------------------------------------------------
 Compilation of ProjectBlaze:
 ==================

To make the necessary changes to build, copy the initial_setup.sh to the root of your build directory, then run

```bash
$ ./initial_setup.sh
```

From root directory of Project, perform following commands in terminal

```bash
$ . build/envsetup.sh
$ lunch blaze_$device-userdebug
$ make bacon
```

For signed builds, follow the below steps after repo sync
  
- On root of the build directory, execute the generate_certs.sh script to generate the certificates using the below command
  
```bash
$ ./generate_certs.sh
```
  
- To build and sign, execute the build_and_sign.sh script using the below command
  
```bash
$ ./build_and_sign.sh
```
NOTE:
If building for your device, adapt your tree to our configurations. Use this [commit](https://github.com/ProjectBlaze-Devices/device_xiaomi_onclite/commit/4a4dee0f51f21bb3c45b8b9e77639b43ae0eb556) as a reference.
---------------------------------------------------------------------------------------

# Credits:

 * [**LineageOS**](https://github.com/LineageOS)
 * [**ProtonAOSP**](https://github.com/ProtonAOSP)
 * [**PixelExperience**](https://github.com/PixelExperience)
 