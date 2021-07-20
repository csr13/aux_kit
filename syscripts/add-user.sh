#!/bin/bash
# status ~> untested
# +~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+
# A script to help us onboard devs to
# development servers.
# +~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+


if [ "$#" -ne 1 ]; then
    echo "[!] usage ~> add-user.sh <username>"
    exit 1
fi


user=$1
user_dir=/home/$user


(
    groupadd $user && \
    useradd -s /bin/bash -d $user_dir $user && \
    mkdir -p $user_dir && \
    chown $user:$user -R $user_dir
)


echo "[!] set new password for $user -- make it funky"
passwd $user

