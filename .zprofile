export JAVA_HOME=/usr/lib/jvm/default
export ANDROID_HOME=~/Android/Sdk
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

export PATH=$PATH:/home/don/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/home/don/.nvm/versions/node/v7.4.0/bin:/home/don/projects/go/bin:/usr/bin/vendor_perl:$GEM_HOME/bin:/home/don/.local/bin

export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# npm modules that should be global:
# - standard
# - react-native-cli
# 
# To install modules to a new node version:
# nvm install v9.2.0 --reinstall-packages-from=v7.4.0
