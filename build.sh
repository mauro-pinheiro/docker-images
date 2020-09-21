#!/bin/bash

export SSHPRI=$(cat ~/.ssh/id_rsa)
export SSHPUB=$(cat ~/.ssh/id_rsa.pub)
export GITGLO=$(cat ~/.gitconfig)

docker-compose build

unset SSHPRI
unset SSHPUB
unset GITGLO