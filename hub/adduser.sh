set -e

useradd -rm -d /home/$1 -s /bin/bash $1
echo "$1:$1" | chpasswd
