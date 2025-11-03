# ACU6
## Before you start
The target is to install Docker and run there the SDK for the ACU6.

It's **mandatory** that you have the development **HW** ACU6 from ACTIA and 

an **account** a valid account for the ACTIA DM (device manager).

The target of this repository is to make the installation easy.

At the end the example "Hell World" from ACTIA should work.

## Installation of Ubuntu
OS          : "Ubuntu Desktop 24.04.3 LTS"

architecture: "x86_64" (ARM is not supported)

hostname    : "ACU6X86DEV"

If the installation of the OS is done, boot it and do the following:

git is needed to get the ACU6 repository.

```
sudo apt-get install git
```
Download the ACU6 repository to your home directory.
```
cd ~
git clone https://github.com/InTheCar/ACU6
cd ACU6
```
```
cd ~/ACU6/InstallNeededAPPs/
./1_install.sh
./2_configure.sh
./3_setup NDIS interface.sh
./x_check_installation.sh
sudo reboot
```

```
cd ~/ACU6sdk/
tar xf acu6-pro-sdk-vx.y.z.tar.gz
cd acu6-pro-sdk-vx.y.z
sudo make docker-image-latest

```


# collections
python decrypt_password.py private_key.pem "BASE64_ENCRYPTED_PASSWORD"

Download the SDK Docker container to
```
mkdir ~/ACU6sdk
cd ~/ACU6sdk
```




