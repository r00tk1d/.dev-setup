#!/bin/bash

read -p "Enter your work email: " work_email

git config --global user.name "Michael Hirsch"
git config --global user.email "$work_email"