#!/bin/sh

# This script downloads the arduino tarball
# extracts the tarball
# installs arduino
# installs ardublock
# installs the library
# removes the tarball
# removes the install files

wget -P $HOME/Downloads https://downloads.arduino.cc/arduino-1.8.12-linuxarm.tar.xz
tar -xvf $HOME/Downloads/arduino-1.8.12-linuxarm.tar.xz -C $HOME
cd $HOME/arduino-1.8.12/
sudo ./install.sh

mkdir -p $HOME/Arduino/tools/ArduBlockTool/tool
wget -P $HOME/Arduino/tools/ArduBlockTool/tool \
  https://raw.githubusercontent.com/BarnabasRobotics/BarnabasRoboticsArdublock-2019/master/bin/ardublock-all-withNewPing.jar

wget -P $HOME/Downloads https://bitbucket.org/teckel12/arduino-new-ping/downloads/NewPing_v1.9.1.zip
xarchiver -x $HOME/arduino-1.8.12/libraries $HOME/Downloads/NewPing_v1.9.1.zip

# It might happen that, you will get an error “Error opening serial port”
# while uploading a sketch after you have selected your board and the serial port.
# To fix this error, run the following command

# sudo usermod -a -G dialout $USER
