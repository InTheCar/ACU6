# ACU6
## Before you start
The target is to install Docker and run there the SDK for the ACU6.

It's **mandatory** that you have the development **HW** ACU6 from ACTIA and 

an **account** at ACTIA.

The target of this repository is to make the installation easy.

## Installation of Ubuntu
OS          : "Ubuntu Desktop 24.04.3 LTS"

architecture: "x86_64" (ARM is not supported)

hostname    : "ACU6X86DEV"

If the installation of the OS is done, do the following:

```
cd ~
git clone https://github.com/InTheCar/ACU6
cd ACU6
```
Download the SDk Docker container to
```
~/ACU6
```

```
cd ~/ACU6/InstallNeededAPPs/
./1_install.sh
./2_configure.sh
./3_setup NDIS interface.sh
./x_check_installation.sh
sudo reboot
```




