#!/bin/bash

echo "starting task: git-work-setup"

read -p "Enter your work email: " work_email

git config --global user.name "Michael Hirsch"
git config --global user.email "$work_email"

echo "finished task: git-work-setup"

