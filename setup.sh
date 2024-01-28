#! /bin/bash

if ! command -v python3 &> /dev/null
then
	echo "python3 command not found, installing it..."
	sudo apt install python3-full
	sudo apt install python3-kubernetes
	echo
fi

if ! command -v pipx  &> /dev/null
then
	echo "pipx command not found, installing it..."
	sudo apt install pipx
	pipx ensurepath
	echo
fi

if ! command -v ansible &> /dev/null
then
	echo "ansible command not found, installing it..."
	pipx install --include-deps ansible
	echo
fi

echo "Generating your ssh key..."
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
echo
echo "You need to copy you ssh id to all your nodes VM like this:"
echo -e "\tssh-copy-id ansible-admin@<node-ip>\n"