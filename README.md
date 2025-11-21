# ACU6
## Before you start
If you are interested in the product which I'm using, here is the link:

https://actia.se/media/2105/acu6-pro-off-highway-produktblad.pdf

There are other products available:

https://actia.se/our-products/

The target is to install Docker and run the SDK for the ACU6 .

It's **mandatory** that you have the development **HW** ACU6 from ACTIA and 

a valid **account** for the ACTIA DM (device manager).

The target of this repository is to make the installation easy 
for my colleges.

At the end this repository "Hello ACU6" from ACTIA should work.

## Installation of Ubuntu
I installed it on a external 1TB SSD. I don't want to get extra challenge if I start to use a virtual machine.

OS          : "Ubuntu Desktop 24.04.3 LTS"

architecture: "x86_64" (**ARM64** is not supported)

hostname    : "ACU6X86DEV"

## Install and configure the environment for the SDK

If the installation of the **OS** is done, **reboot** it and do the following:

git is needed to get this ACU6 repository with the scripts and some directories.

To copy the commands, open this repository on the PC.


```
sudo apt-get install git
```
Download the ACU6 repository to your home directory.
```
cd ~
git clone https://github.com/InTheCar/ACU6
```
Install some APPs:
```
cd ~/ACU6/InstallNeededAPPs/
./1_install.sh
```
If you want to use it in the virtual machine Hyper-V install additional APPs.
```
cd ~/ACU6/InstallNeededAPPs/
./2_install.sh
```

Perform a reboot:
```
sudo reboot
```
Now we need a docker container to keep the ACU 6 awake. For this we need to **download** the SDK from the **ACTIA device 
manager**. The **SDK** is located in the files menu of the device manager.

To this folder:
```
cd ~/ACU6/docker
```
Extract the archive:

```
tar xf acu6-pro-sdk-*.tar.gz
```
Change to the directory which was created by uncompress the archive and build the docker container:

```
cd ~/ACU6/docker/acu6-pro-sdk-*/
make docker-image-latest
```


Keep the acu awake:
```
sudo ~/ACU6/docker/acu6-pro-sdk-*/rundocker.sh utils/onsw.sh on
```
Switch TCU off
```
sudo ~/ACU6/docker/acu6-pro-sdk-*/rundocker.sh utils/onsw.sh off
```



The next script is may be not complete, but it performs some checks. 
You should see that docker is starting a docker container 
named "hello-world". In the output from docker you must see the following:

**Hello from Docker!**

**This message shows that your installation appears to be working correctly.**

```
./x_check_installation.sh
```
## Hello ACU6
Now we can start with the first application for the ACU6.
 It's "Hello ACU6" from ACTIA.

You can find it here:

https://production.connect.actia.se/docs/acu6-pro/latest/getting-started/03_create_linux_distro.html

prepare the folder for "Hello ACU6"
```
~/ACU6/ACU6examples/HelloACU6prepare.sh
```

In the **Device Manager** under Files, you can download the SDK.

The filename is something like this **"acu6-pro-sdk-vx.y.z.tar.gz"**

Move this file to the SDK directory of the project:

**~/ACU6apps/HelloACU6/sdk/**

Extract this file.
```
cd ~/ACU6apps/HelloACU6/sdk/
tar xf acu6-pro-sdk-*.tar.gz
```

Write the encrypted **maintenance** password into the file ...
```
nano ~/ACU6apps/HelloACU6/files/device-password.txt
```
Put 

**company-private.pem**

**company_keystore_acu6_dev.bpak**

in the in the directory **~/ACU6apps/HelloACU6/files/**

```
cd ~/ACU6apps/HelloACU6/
make defconfig
```

```
cd ~/ACU6apps/HelloACU6/
make
```
Here is my output when make finifhed:

```
user-bundle/
user-bundle/user_boot.bpak
user-bundle/user_rootfs.bpak
user-bundle/user_keystore.bpak
MANIFEST
Final output provided in /home/luebbo/ACU6apps/HelloACU6/output/images/user-bundle.tar
```



# The rest of this text I have to sort












cd ~/ACU6/
python3 -m venv ACU6venv
source ./ACU6venv/bin/activate
pip install python_ecies

python3 decrypt_password.py pem_file, password_b64














At first, we will create a directory for this application and create the file structure for the project. 
This can also be found here in the chapter "Creating your first application"

https://production.connect.actia.se/docs/acu6-pro/latest/
Create the package folder "led-example"
```
mkdir ~/ACU6apps/HelloWorld/externals/myproj/led-example
```
Creating needed empty files and directories
```
touch ~/ACU6apps/HelloWorld/externals/myproj/led-example/Config.in
mkdir ~/ACU6apps/HelloWorld/externals/myproj/led-example/files/
touch ~/ACU6apps/HelloWorld/externals/myproj/led-example/files/led_example.c
touch ~/ACU6apps/HelloWorld/externals/myproj/led-example/files/Makefile
touch ~/ACU6apps/HelloWorld/externals/myproj/led-example/led-example.mk
```
File the files with content
```
cat >~/ACU6apps/HelloWorld/externals/myproj/led-example/Config.in <<EOL
config BR2_PACKAGE_LED_EXAMPLE
     bool "led-example"
     select BR2_PACKAGE_ACTIA_LIB
     help
             LED example 
EOL

cat >~/ACU6apps/HelloWorld/externals/myproj/led-example/files/led_example.mk <<EOL
################################################################################
#
# led-example
#
################################################################################

LED_EXAMPLE_VERSION = 0.1
LED_EXAMPLE_SITE = $(LED_EXAMPLE_PKGDIR)/files
LED_EXAMPLE_SITE_METHOD = local
LED_EXAMPLE_LICENSE = Actia Software License Agreement
LED_EXAMPLE_LICENSE_FILES = EULA COPYING
LED_EXAMPLE_REDISTRIBUTE = NO
LED_EXAMPLE_INSTALL_TARGET = YES
LED_EXAMPLE_DEPENDENCIES = actia-lib

define LED_EXAMPLE_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $ $(@D)
endef

define LED_EXAMPLE_INSTALL_TARGET_CMDS
    $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR) PREFIX=/usr
endef

$(eval $(generic-package))
EOL

cat >~/ACU6apps/HelloWorld/externals/myproj/led-example/files/led_example.c <<EOL
#include <stdio.h>

int main(void)
{
    printf("Under construction\n");

    return 0;
}
EOL

cat >~/ACU6apps/HelloWorld/externals/myproj/led-example/files/Makefile <<EOL
TARGET_BIN  = led-example

CFLAGS  += -MMD -MP -Wall -Wextra -pedantic -Werror -Wno-error=deprecated-declarations

LIBS    += -lactia

C_SRCS   = led_example.c

OBJS     += $(patsubst %.c, $(BUILD_DIR)/%.o, $(C_SRCS))
OBJS     += $(patsubst %.S, $(BUILD_DIR)/%.o, $(ASM_SRCS))

DEPS = $(OBJS:%.o=%.d)

BUILD_DIR = build

.PHONY: all

all: $(BUILD_DIR)/$(TARGET_BIN)

$(BUILD_DIR)/$(TARGET_BIN): $(OBJS)
	@echo LINK $@ $(LDFLAGS)
	@$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o $@

$(BUILD_DIR)/%.o: %.c
	@echo CC $<
	@mkdir -p $(@D)
	@$(CC) -c $(CFLAGS) $< -o $@

install: all
	@install -m 755 $(BUILD_DIR)/$(TARGET_BIN) $(DESTDIR)/$(PREFIX)/bin

clean:
	@-rm -rf $(BUILD_DIR)/

-include $(DEPS)
EOL

```




# collections
python decrypt_password.py private_key.pem "BASE64_ENCRYPTED_PASSWORD"
https://production.connect.actia.se/docs/acu6-pro/latest/_downloads/be5920c19e4ea120f2d0cc7dfeb0501a/project-template.zip


Python ACU6 venv

  "python-ecies"




