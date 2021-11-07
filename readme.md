## Requirements
1. Raspberry Pi (from model 1B up to 4B, 3A+, 3B+ or Zero including Zero W)
2. SD card with at least 1GB, or at least 128MB for USB root install (without customization)
3. Ethernet or wireless LAN with a working internet connection

## Format SD card
1. Format SD card or [Restore USB Drive if it has been used before](https://github.com/daljitdokal/raspberry-pi-server-minimal-setup/blob/ubuntu-server/restore-usb-drive.org)


# Steps
Create the bootable SD Card with a minimal install of Ubuntu Server 20.04 x64, which is a free and open source operating system based on Debian.

## Step 1: Download sd card imaging
- To simplify the sd card creation process we can use the open source rpi-imager utility, the code snippet below will download the latest release:
```bash
export GET_USER="Dalji" # $USER
echo Downloading latest release zip from github
curl -s https://api.github.com/repos/raspberrypi/rpi-imager/releases/latest \
      | grep "browser_download_url.*exe" \
      | cut -d : -f 2,3 \
      | tr -d \" \
      | wget -O /mnt/c/Users/$GET_USER/Downloads/imager.exe -i -

echo Checking file is now present
ls -l /mnt/c/Users/$GET_USER/Downloads/imager.exe
```
- With the software downloaded, let’s fire it up the installer and get it setup.
```bash
cmd.exe /mnt/c/Users/$GET_USER/Downloads/imager.exe
```

## Step 3: Build image to SD card
- Put the 'SD' card and begin the imaging process.

- First select an Operating System: 
  - `CHOOSE OS` –> 
  - `Other general purpose OS` –> 
  - `Ubuntu` ->
  - `Ubuntu Server 20.04.X LTS x64`

- Select the storage (USB)

Once you’ve selected the operating system and sd card, click `WRITE`. The process will take a few minutes to complete.

## Step 4: Custom configration
Our next step is to copy the custom `user-data` and `network-config` files included in this repository to the newly created SD Card.

Note: The code block below assumes the SD Card boot partition will be `D:\`. You may need to adjust for your environment.
```bash
echo Mount the new partition in wsl
sudo mkdir /mnt/d
sudo mount -t drvfs d: /mnt/d/

echo Copy the contents of installer to sd
cp network-config /mnt/d/
cp user-data /mnt/d/
cp cmdline.txt /mnt/d/

# We need to wait before we can eject
sudo umount /mnt/d
```
