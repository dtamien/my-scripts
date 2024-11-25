#!/bin/bash
# Description: Set Git user name and email globally

GIT_USER="dtamien"
GIT_EMAIL="mail"

git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_EMAIL"