#!/bin/bash

# Copyright (c) 2024 Alex313031.

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
	printf "${bold}${GRE}Script to copy Thorium for WinXP source files over the Chromium source tree.${c0}\n" &&
	printf "${bold}${YEL}Use the --sse2 flag for 32 bit SSE2 Builds.${c0}\n" &&
	printf "${bold}${YEL}Use the --sse3 flag for 32 bit SSE3 Builds.${c0}\n" &&
	printf "${bold}${YEL}Use the --sse4 flag for 32 bit SSE4.1 Builds.${c0}\n" &&
	printf "${bold}${YEL}Use the --sse3-64 flag for 64 bit SSE3 Builds.${c0}\n" &&
	printf "${bold}${YEL}Use the --sse4-64 flag for 64 bit SSE4.1 Builds.${c0}\n" &&
	printf "${bold}${YEL}The 64 bit flags are for 64 bit Windows XP/Windows Server 2003.${c0}\n" &&
	printf "${bold}${YEL}use the --help flag to show this help.${c0}\n" &&
	printf "\n" &&
	printf "${bold}${YEL}NOTE: The \`CR_DIR\` env variable can be used to override the location of \"chromium/src\".${c0}\n" &&
	printf "${bold}${YEL} The default is $HOME/chromium/src${c0}\n" &&
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

printf "\n" &&
printf "${bold}${GRE}Script to copy Thorium for WinXP source files over the Chromium source tree.${c0}\n" &&
printf "${bold}${YEL}Use the --sse2 flag for 32 bit SSE2 Builds.${c0}\n" &&
printf "${bold}${YEL}Use the --sse3 flag for 32 bit SSE3 Builds.${c0}\n" &&
printf "${bold}${YEL}Use the --sse4 flag for 32 bit SSE4.1 Builds.${c0}\n" &&
printf "${bold}${YEL}Use the --sse3-64 flag for 64 bit SSE3 Builds.${c0}\n" &&
printf "${bold}${YEL}Use the --sse4-64 flag for 64 bit SSE4.1 Builds.${c0}\n" &&
printf "${bold}${YEL}The 64 bit flags are for 64 bit Windows XP/Windows Server 2003.${c0}\n" &&
printf "${bold}${YEL}use the --help flag to show this help.${c0}\n" &&
printf "\n" &&
printf "${bold}${YEL}NOTE: The \`CR_DIR\` env variable can be used to override the location of \"chromium/src\".${c0}\n" &&
printf "${bold}${YEL} The default is $HOME/chromium/src${c0}\n" &&
printf "\n" &&

patchFFMPEG () {
	cp -v other/add-hevc-ffmpeg-decoder-parser.patch ${CR_SRC_DIR}/third_party/ffmpeg/ &&
	cp -v other/ffmpeg_hevc_ac3.patch ${CR_SRC_DIR}/third_party/ffmpeg/ &&
	cp -v other/fix-policy-templates.patch ${CR_SRC_DIR}/ &&

	printf "\n" &&
	printf "${YEL}Patching FFMPEG for HEVC...${c0}\n" &&
	cd ${CR_SRC_DIR}/third_party/ffmpeg &&
	git apply --reject ./add-hevc-ffmpeg-decoder-parser.patch &&

	printf "\n" &&
	printf "${YEL}Patching FFMPEG for AC3/EAC3...${c0}\n" &&
	cd ${CR_SRC_DIR}/third_party/ffmpeg &&
	git apply --reject ./ffmpeg_hevc_ac3.patch &&

	printf "\n" &&
	printf "${YEL}Patching policy templates...${c0}\n" &&
	cd ${CR_SRC_DIR} &&
	git apply --reject ./fix-policy-templates.patch
}
[ -f ${CR_SRC_DIR}/third_party/ffmpeg/add-hevc-ffmpeg-decoder-parser.patch ] || patchFFMPEG;

copyThorSrc () {
	printf "\n" &&
	printf "${YEL}Creating build output directory...${c0}\n" &&

	mkdir -v -p ${CR_SRC_DIR}/out/thorium/ &&

	printf "\n" &&
	printf "${YEL}Copying Thorium source files over the Chromium tree...${c0}\n" &&

	# Copy libjxl src
	cd ~/thorium-win7 &&
	cp -r -v thorium-libjxl/src/. ${CR_SRC_DIR}/ &&

	# Copy Thorium sources
	cp -r -v src/BUILD.gn ${CR_SRC_DIR}/ &&
	cp -r -v src/ash ${CR_SRC_DIR}/ &&
	cp -r -v src/build ${CR_SRC_DIR}/ &&
	cp -r -v src/chrome ${CR_SRC_DIR}/ &&
	cp -r -v src/chromeos ${CR_SRC_DIR}/ &&
	cp -r -v src/components ${CR_SRC_DIR}/ &&
	cp -r -v src/content ${CR_SRC_DIR}/ &&
	cp -r -v src/extensions ${CR_SRC_DIR}/ &&
	cp -r -v src/media ${CR_SRC_DIR}/ &&
	cp -r -v src/net ${CR_SRC_DIR}/ &&
	cp -r -v src/sandbox ${CR_SRC_DIR}/ &&
	cp -r -v src/services ${CR_SRC_DIR}/ &&
	cp -r -v src/third_party ${CR_SRC_DIR}/ &&
	cp -r -v src/tools ${CR_SRC_DIR}/ &&
	cp -r -v src/ui ${CR_SRC_DIR}/ &&
	cp -r -v src/v8 ${CR_SRC_DIR}/ &&

	cp -r -v thorium_shell/. ${CR_SRC_DIR}/out/thorium/ &&
	cp -r -v pak_src/binaries/pak ${CR_SRC_DIR}/out/thorium/ &&
	cp -r -v pak_src/binaries/pak-win/. ${CR_SRC_DIR}/out/thorium/ &&

	printf "\n" &&
	echo "Copying other files to \`out/thorium\`" &&

	# Add default_apps dir for Google Docs Offline extension.
	mkdir -v -p ${CR_SRC_DIR}/out/thorium/default_apps &&
	cp -r -v infra/default_apps/. ${CR_SRC_DIR}/out/thorium/default_apps/ &&

	# Add initial preferences file to open Thorium welcome page on first run.
	cp -v infra/initial_preferences ${CR_SRC_DIR}/out/thorium/ &&
	cp -v infra/thor_ver ${CR_SRC_DIR}/out/thorium/ &&

	# Copy NT 5.x files
	printf "\n" &&
	printf "${YEL}Copying NT 5.x Installer/Uninstaller files...${c0}\n" &&
	cp -r -v other/XP/chrome/* ${CR_SRC_DIR}/chrome/ &&
	cp -v other/XP/dist/THORIUM_PORTABLE.bat ${CR_SRC_DIR}/out/thorium/ &&
	cp -v other/XP/dist/INSTALL_THORIUM.cmd ${CR_SRC_DIR}/out/thorium/ &&
	cp -v other/XP/dist/REMOVE_THORIUM.cmd ${CR_SRC_DIR}/out/thorium/ &&
	cp -v other/XP/dist/HKCR.reg ${CR_SRC_DIR}/out/thorium/ &&
	cp -v other/XP/dist/HKLM.reg ${CR_SRC_DIR}/out/thorium/ &&
	cp -v other/XP/dist/thorium.ico ${CR_SRC_DIR}/out/thorium/ &&
	cp -v other/XP/dist/README.txt ${CR_SRC_DIR}/out/thorium/ &&

	cd ~/thorium-win7
}

cd ~/thorium-win7 &&

postCopy () {
	printf "${GRE}Done!\n" &&
	printf "\n" &&

	printf "${YEL}Exporting variables and setting handy aliases...${c0}\n" &&

	. ~/thorium-win7/aliases &&

	printf "\n" &&
	printf "export ${CYA}NINJA_SUMMARIZE_BUILD=1${c0}\n" &&
	printf "export ${CYA}EDITOR=nano${c0}\n" &&
	printf "export ${CYA}VISUAL=nano${c0}\n" &&
	printf "\n" &&
	printf "alias ${YEL}origin${c0} = ${CYA}git checkout -f origin/main${c0}\n" &&
	printf "alias ${YEL}gfetch${c0} = ${CYA}git fetch --tags${c0}\n" &&
	printf "alias ${YEL}rebase${c0} = ${CYA}git rebase-update${c0}\n" &&
	printf "alias ${YEL}gsync${c0} = ${CYA}gclient sync --with_branch_heads --with_tags -f -R -D${c0}\n" &&
	printf "alias ${YEL}args${c0} = ${CYA}gn args out/thorium${c0}\n" &&
	printf "alias ${YEL}gnls${c0} = ${CYA}gn ls out/thorium${c0}\n" &&
	printf "alias ${YEL}show${c0} = ${CYA}git show-ref${c0}\n" &&
	printf "alias ${YEL}runhooks${c0} = ${CYA}gclient runhooks${c0}\n" &&
	printf "alias ${YEL}pgo${c0} = ${CYA}python3 tools/update_pgo_profiles.py --target=linux update --gs-url-base=chromium-optimization-profiles/pgo_profiles${c0}\n" &&
	printf "alias ${YEL}pgow${c0} = ${CYA}python3 tools/update_pgo_profiles.py --target=win64 update --gs-url-base=chromium-optimization-profiles/pgo_profiles${c0}\n" &&
	printf "alias ${YEL}pgom${c0} = ${CYA}python3 tools/update_pgo_profiles.py --target=mac update --gs-url-base=chromium-optimization-profiles/pgo_profiles${c0}\n" &&
	printf "alias ${YEL}pgomac-arm${c0} = ${CYA}python3 tools/update_pgo_profiles.py --target=mac-arm update --gs-url-base=chromium-optimization-profiles/pgo_profiles${c0}\n" &&
	printf "\n" &&

	cat logos/thorium_ascii_art.txt &&

	printf "${GRE}Done. ${YEL}You can now run \'./patch_xp.sh\'\n"
	printf "\n"
}

copySSE2 () {
	printf "\n" &&
	printf "${YEL}Copying Windows XP 32-bit SSE2 build files...${c0}\n" &&
	cp -r -v other/SSE2/build/config/* ${CR_SRC_DIR}/build/config/ &&
	cp -r -v other/SSE2/v8/* ${CR_SRC_DIR}/v8/ &&
	cp -r -v other/XP/SSE2/build/config/* ${CR_SRC_DIR}/build/config/ &&
	cp -v other/XP/SSE2/thor_ver ${CR_SRC_DIR}/out/thorium/ &&
	printf "\n" &&
	printf "${YEL}Copying progwrp x86 files...${c0}\n" &&
	cp -v patches/progwrp/progwrp_32/progwrp.dll ${CR_SRC_DIR}/out/thorium/ &&
	printf "\n"
}
case $1 in
	--sse2) copyThorSrc; copySSE2; postCopy;
esac

copySSE3 () {
	printf "\n" &&
	printf "${YEL}Copying Windows XP 32-bit SSE3 build files...${c0}\n" &&
	cp -r -v other/SSE3/build/config/* ${CR_SRC_DIR}/build/config/ &&
	cp -r -v other/SSE3/v8/* ${CR_SRC_DIR}/v8/ &&
	cp -r -v other/XP/SSE3/build/config/* ${CR_SRC_DIR}/build/config/ &&
	cp -v other/XP/SSE3/thor_ver ${CR_SRC_DIR}/out/thorium/ &&
	printf "\n" &&
	printf "${YEL}Copying progwrp x86 files...${c0}\n" &&
	cp -v patches/progwrp/progwrp_32/progwrp.dll ${CR_SRC_DIR}/out/thorium/ &&
	printf "\n"
}
case $1 in
	--sse3) copyThorSrc; copySSE3; postCopy;
esac

copySSE4 () {
	printf "\n" &&
	printf "${YEL}Copying Windows XP 32-bit SSE4.1 build files...${c0}\n" &&
	cp -r -v other/SSE4.1/build/config/* ${CR_SRC_DIR}/build/config/ &&
	cp -r -v other/SSE4.1/v8/* ${CR_SRC_DIR}/v8/ &&
	cp -r -v other/XP/SSE4.1/build/config/* ${CR_SRC_DIR}/build/config/ &&
	cp -v other/XP/SSE4.1/thor_ver ${CR_SRC_DIR}/out/thorium/ &&
	printf "\n" &&
	printf "${YEL}Copying progwrp x86 files...${c0}\n" &&
	cp -v patches/progwrp/progwrp_32/progwrp.dll ${CR_SRC_DIR}/out/thorium/ &&
	printf "\n"
}
case $1 in
	--sse4) copyThorSrc; copySSE4; postCopy;
esac

copyXP64SSE3 () {
	printf "\n" &&
	printf "${YEL}Copying Windows XP 64-bit SSE3 build files...${c0}\n" &&
	cp -r -v other/SSE3/build/config/* ${CR_SRC_DIR}/build/config/ &&
	cp -r -v other/SSE3/v8/* ${CR_SRC_DIR}/v8/ &&
	cp -r -v other/XP64/SSE3/build/config/* ${CR_SRC_DIR}/build/config/ &&
	cp -v other/XP64/SSE3/thor_ver ${CR_SRC_DIR}/out/thorium/ &&
	printf "\n" &&
	printf "${YEL}Copying progwrp x64 files...${c0}\n" &&
	cp -v patches/progwrp/progwrp_64/progwrp.dll ${CR_SRC_DIR}/out/thorium/ &&
	printf "\n"
}
case $1 in
	--sse3-64) copyThorSrc; copyXP64SSE3; postCopy;
esac

copyXP64SSE4 () {
	printf "\n" &&
	printf "${YEL}Copying Windows XP 64-bit SSE4.1 build files...${c0}\n" &&
	cp -r -v other/SSE4.1/build/config/* ${CR_SRC_DIR}/build/config/ &&
	cp -r -v other/SSE4.1/v8/* ${CR_SRC_DIR}/v8/ &&
	cp -r -v other/XP64/SSE4.1/build/config/* ${CR_SRC_DIR}/build/config/ &&
	cp -v other/XP64/SSE4.1/thor_ver ${CR_SRC_DIR}/out/thorium/ &&
	printf "\n" &&
	printf "${YEL}Copying progwrp x64 files...${c0}\n" &&
	cp -v patches/progwrp/progwrp_64/progwrp.dll ${CR_SRC_DIR}/out/thorium/ &&
	printf "\n"
}
case $1 in
	--sse4-64) copyThorSrc; copyXP64SSE4; postCopy;
esac

tput sgr0
