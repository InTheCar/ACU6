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
You should see that docker is starting a docker container 
named "hello-world". In the output from docker you must see the following:

**Hello from Docker!**

**This message shows that your installation appears to be working correctly.**

```
./x_check_installation.sh
```
Perform a reboot.
```
sudo reboot
```
Now we can start with the first application for the ACU6.
 It's "Hello World" from ACTIA.

At first, we will create a directory for this application and create the file structure for the project. 
This can also be found here in the chapter "Creating your first application"

https://production.connect.actia.se/docs/acu6-pro/latest/
```
mkdir -p ~/ACU6apps/HelloWorld
cd ~/ACU6apps/HelloWorld
wget "https://production.connect.actia.se/docs/acu6-pro/latest/_downloads/be5920c19e4ea120f2d0cc7dfeb0501a/project-template.zip"
```
Extract the template.
```
unzip project-template.zip
```
In the Device Manager under Files, you can download the SDK.

The filename is something like this "acu6-pro-sdk-vx.y.z.tar.gz"

Move this file to the SDK directory of the project:

~/ACU6apps/HelloWorld/sdk/

Extract this file.
```
cd ~/ACU6apps/HelloWorld/sdk/
tar xf acu6-pro-sdk-vx.y.z.tar.gz
```
Now some secret :-)

Put the following files

**company-private.pem**

**company_keystore_acu6_dev.bpak**

here:

~/ACU6apps/HelloWorld/files/

# lth 

The next step is to put the device password in the file **device-password.txt**
```
nano ~/ACU6apps/HelloWorld/files/device-password.txt
```
make Docker environment.
```
cd ~/ACU6apps/HelloWorld/
sudo make docker-image-latest
```
Reset Configuration to Default
```
cd ~/ACU6apps/HelloWorld/
sudo make defconfig
```
Create the package folder "led-example"
```
mkdir ~/ACU6apps/HelloWorld/externals/package/led-example
```



# collections
python decrypt_password.py private_key.pem "BASE64_ENCRYPTED_PASSWORD"


Python ACU6 venv

  "python-ecies"




