#!/bin/sh
echo "Please enter your GitHub username."
read GIT_USER
echo "Please enter your GitHub email address."
read GIT_MAIL

git config --global user.name "$(GIT_USER)"
git config --global user.email "$(GIT_MAIL)"
