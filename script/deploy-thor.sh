#!/bin/bash

set -v

if [ "x${TRAVIS_BRANCH}" != "xdev" ]; then
  echo "We are not on dev branch, don't upload build."
  exit 0
fi

DEPLOYTARGET=jamomabuild@thor.bek.no:/Volumes/ThorData/WebServer/Jamoma/nanoc-website/output/download/JamomaMax/nightly-builds

if [ "x${DEPLOYTARGET}" = "x" ]; then
 echo "no deploy target defined; skipping deployment"
 exit 0
fi
DEPLOYHOST="${DEPLOYTARGET##*@}"
DEPLOYHOST="${DEPLOYHOST%%/*}"
DEPLOYHOST="${DEPLOYHOST%%:*}"

echo "DEPLOYTARGET ${DEPLOYTARGET}"
echo "DEPLOYHOST ${DEPLOYHOST}"

KEYFILE=${HOME}/.ssh/id_rsa

# check if there is an ssh keyfile
# if not, try to decrypt one; if that fails stop
if [ ! -e "${KEYFILE}" ]; then
 mkdir -p ${HOME}/.ssh
 openssl aes-256-cbc -K $encrypted_key -iv $encrypted_iv -in ${0%/*}/id_rsa.enc -out "${KEYFILE}" -d
fi
if [ ! -e "${KEYFILE}" ]; then
 echo "couldn't find ${KEYFILE}; skipping deployment"
 exit 0
fi

## config done

## password-less authentication to deploy host

# make sure our remote host is known
# (so we are not asked to accept it)
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan -H ${DEPLOYHOST} >> ~/.ssh/known_hosts
echo "ssh-keyscanned ${DEPLOYHOST}"

# and use the (encrypted) auth key
if [ -e "${KEYFILE}" ]; then
 chmod 600 "${KEYFILE}"
 ssh-add "${KEYFILE}"
 echo "ssh-added ${KEYFILE}"
else
 echo "missing ${KEYFILE}"
fi

if [ "x${TRAVIS_OS_NAME}" = "xLinux" ]; then
  ARCHIVE_NAME="JamomaMax-Windows-mingw-${TRAVIS_COMMIT:0:7}-${TRAVIS_TAG}.tgz"
else
  ARCHIVE_NAME="JamomaMax-OSX-${TRAVIS_COMMIT:0:7}-${TRAVIS_TAG}.tgz"
fi

cd ${TRAVIS_BUILD_DIR}/build
cmake -DCMAKE_INSTALL_COMPONENT=JamomaMax -P cmake_install.cmake

cd ${TRAVIS_BUILD_DIR}/JamomaInstall/JamomaMax/
tar czf "${TRAVIS_BUILD_DIR}/${ARCHIVE_NAME}" Jamoma/

cd ${TRAVIS_BUILD_DIR}
scp ${ARCHIVE_NAME} ${GITDEPLOYTARGET}
