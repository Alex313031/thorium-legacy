#!/bin/bash

# Copyright (c) 2023 Alex313031.

YEL='\033[1;33m' # Yellow
CYA='\033[1;96m' # Cyan
RED='\033[1;31m' # Red
GRE='\033[1;32m' # Green
c0='\033[0m' # Reset Text
bold='\033[1m' # Bold Text
underline='\033[4m' # Underline Text

# Error handling
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "${RED}Failed $*"; }

# --help
displayHelp () {
	printf "\n" &&
	printf "${bold}${GRE}Script to patch Chromium for Windows 7, 8, 8.1, and${c0}\n" &&
	printf "${bold}${GRE} derivatives like Home Server 2011, Server 2008 R2,${c0}\n" &&
	printf "${bold}${GRE} Server 2012, and Server 2012 R2.${c0}\n" &&
	printf "\n"
}
case $1 in
	--help) displayHelp; exit 0;;
esac

# chromium/src dir env variable
if [ -z "${CR_DIR}" ]; then 
    CR_SRC_DIR="$HOME/chromium/src"
    export CR_SRC_DIR
else 
    CR_SRC_DIR="${CR_DIR}"
    export CR_SRC_DIR
fi

# Patch Chromium
cp -v patches/win7-8-8.1-support_thorium.patch ${CR_SRC_DIR}/ &&
cp -v patches/win7-8-8.1-support-in-boringssl.patch ${CR_SRC_DIR}/third_party/boringssl/src/ &&
cp -v patches/win7-8-8.1-support-in-webrtc.patch ${CR_SRC_DIR}/third_party/webrtc/ &&

cd ${CR_SRC_DIR}/ &&

git apply --reject win7-8-8.1-support_thorium.patch &&

cd third_party/boringssl/src/ &&

git apply --reject win7-8-8.1-support-in-boringssl.patch &&

cd ${CR_SRC_DIR}/ &&

cd third_party/webrtc &&

git apply --reject win7-8-8.1-support-in-webrtc.patch &&

printf "${GRE}Done patching Chromium!\n" &&
printf "\n" &&
tput sgr0

exit 0
