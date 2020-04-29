#!/bin/sh

# This script downloads the arduino tarball
# extracts the tarball
# installs arduino
# installs ardublock
# installs the library
# removes the tarball
# removes the install files

ARDUINO_ARM='arduino-1.8.12-linuxarm.tar.xz'

if [ ! -f "$HOME/Downloads/$ARDUINO_ARM" ]; then
    echo 'grabbing tar file...\n'
    wget -P $HOME/Downloads https://downloads.arduino.cc/$ARDUINO_ARM
fi

if [ ! -f "$HOME/arduino-1.8.12/install.sh" ]; then
    echo 'extracing tar file...\n'
    tar -xvf $HOME/Downloads/arduino-1.8.12-linuxarm.tar.xz -C $HOME
fi

echo 'changing directory.. '
cd $HOME/arduino-1.8.12/
echo 'running install'
sudo ./install.sh

TOOL_DIR='$HOME/Arduino/tools/ArduBlockTool/tool'

if [ ! -f "$TOOL_DIR/ardublock-all-withNewPing.jar" ]; then
    echo 'grabbing ardublock and installing...\n'
    mkdir -p $TOOL_DIR
    wget -P $TOOL_DIR \
        https://raw.githubusercontent.com/BarnabasRobotics/BarnabasRoboticsArdublock-2019/master/bin/ardublock-all-withNewPing.jar
fi

if [ ! -d "$HOME/arduino-1.8.12/libraries/NewPing" ]; then
    echo 'grabbing NewPing from Tim Eckel and installing..'
    wget -P $HOME/Downloads https://bitbucket.org/teckel12/arduino-new-ping/downloads/NewPing_v1.9.1.zip
    echo '.. \n'
    xarchiver -x $HOME/arduino-1.8.12/libraries $HOME/Downloads/NewPing_v1.9.1.zip
fi

echo "$(tput setaf 2)Done! 
$(tput dim)To uninstall run: 
$(tput setaf 3)cd ~/arduino-1.8.12 ; 
sudo . ./uninstall$(tput sgr0)"

echo "$(tput setaf 6)
# It might happen that, you will get an error “Error opening serial port”
# while uploading a sketch after you have selected your board and the serial port.
# To fix this error, run the following command

# sudo usermod -a -G dialout $USER
$(tput sgr0)"