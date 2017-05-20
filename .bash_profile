. /Users/berny/torch/install/bin/torch-activate

test(){
	cd ~/Documents/"$1"
}

test2(){
	echo Esteban es puto
}

myip(){
    ipconfig getifaddr en1;
}
gitpublish(){
    git add ./
    git commit -m "$1"
    git push -u origin master 
}
#-----------Apache--------
apach(){
    cd /etc/apache2;
}

apachosts(){
    vim /etc/hosts;
}

#-----------C++----------
exc(){
    g++ -o output "$1"
    ./output "$2"    
}
newc(){
    mkdir "$1"
    cp -R /Users/berny/Documents/workspace-dev/C++/prototype/ "$1"
    cd "$1"
    mv prototype.cpp "$1".cpp
    cd ..
}

#----------Python-------------

expy(){
    python ./"$1".py
}
#-----------PHP-------------
exph(){
    php "$1".php|php -R 'echo strip_tags($argn)."\n";'
}

newp5(){
    cp -R /Users/berny/Documents/workspace-dev/Javascript/P5js/prototype/ "$1"
    open -a atom "$1"
    cd "$1"
    open -a safari index.html
}
#-----------Java--------------
newj(){
    mkdir "$1"
    cd "$1"
    vim "$1".java
}
exj(){ 
    javac "$1".java
    java "$1"
}
exjio(){
    javac "$1".java 
    java "$1"; < "$2" > "$3"
}
#-----------JavaScript-------------
newthree(){
    cp -R /Users/berny/Documents/workspace-dev/Javascript/Three.js/protoThree.js "$1"
    open -a atom "$1"
    cd "$1"
    open -a safari index.html
}
search(){
    find /Users/berny -name *"$1"*
}
getLocation(){
    adb shell dumpsys location > location.txt;
    grep -A 3 'Last Known Locations' location.txt | grep -m 1 'gps:' > coordinate.txt;
    x=$(cat coordinate.txt | cut -c 33-42);
    y=$(cat coordinate.txt | cut -c 23-31);
    echo -n $x','$y;
    echo 
    rm coordinate.txt;
    rm location.txt;
}
alias c='cd ~/Documents/workspace-dev/C++/'
alias wrk='cd ~/Documents/workspace-dev'
alias py='cd ~/Documents/workspace-dev/Python/'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#export PATH=$PATH:/Users/berny/anaconda2/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/Users/berny/Library/Android/sdk/platform-tools 
export PATH=$PATH:/Users/berny/Documents/workspace-dev/macvim/src/MacVim
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:/Users/berny/ycm_extra_conf.py
export PATH=$PATH:/Users/berny/eclipse/Eclipse.app/Contents/Eclipse
export PATH=$PATH:/Applications/GIMP.app/Contents/MacOS
export PATH=$PATH:/Users/berny/Documents/workspace/C++/average_grade/ctags_with_dep.sh
export PATH=$HOME/wpilib/simulation:$PATH
#export PATH=$PATH:/Applications/Android\ Studio.app/Contents/gradle/
# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
#export PATH


# added by Anaconda2 4.0.0 installer
#export PATH="/Users/berny/anaconda2/bin:$PATH"

# added by Anaconda2 4.0.0 installer
#export PATH="//anaconda/bin:$PATH"

# added by Anaconda2 4.0.0 installer
#export PATH="/Users/berny/anaconda/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/qt5/bin:$PATH"
export GAZEBO_MODEL_PATH="/Users/berny/wpilib/simulation/models:$GAZEBO_MODEL_PATH" 
#----------------------ROS------------------------
#source ~/ros_catkin_ws/install_isolated/setup.bash

# added by Anaconda2 4.3.1 installer
#export PATH="/Users/berny/anaconda2/bin:$PATH"

# added by Anaconda2 4.1.0 installer
#export PATH="/Users/berny/anaconda/bin:$PATH"

export PATH=/Users/berny/anaconda2/bin:"$PATH"
