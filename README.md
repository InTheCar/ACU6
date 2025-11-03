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
Install some APPs:
```
cd ~/ACU6/InstallNeededAPPs/
./1_install.sh
```
This step is to configure the NDIS interface. Herefor it's 
necessary to have the ACU6 HW. This step can be skipped til the 
HW is on your desk.
```
./2_setup NDIS interface.sh
```
The next script is may be not complete, but it performs some checks. 
After this perform a reboot.
```
./x_check_installation.sh
sudo reboot
```
Now we can start with the first application for the ACU6.
 It's "Hello World" from ACTIA.

At first, we will create a directory for this application.
```
mkdir ~/ACU6apps/HelloWorld
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

Python ACU6 venv

  "python-ecies"




