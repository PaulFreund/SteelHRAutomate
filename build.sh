#!/bin/bash
if [ -z "${1}" ]; then
    echo "usage: build.sh APK-FILE";
    exit 1;
fi
command -v apktool >/dev/null 2>&1 || { echo >&2 "I require apktool but it's not installed.  Aborting."; exit 1; }
command -v keytool >/dev/null 2>&1 || { echo >&2 "I require keytool but it's not installed.  Aborting."; exit 1; }
command -v jarsigner >/dev/null 2>&1 || { echo >&2 "I require jarsigner but it's not installed.  Aborting."; exit 1; }
filename=$1
target_filename="$filename-modified.apk"
folder=${filename%.*}

apktool -o $folder d $filename

cp SteelHRAutomate/AndroidManifest.xml $folder
cp SteelHRAutomate/SmsReceiver.smali $folder/smali_classes2/com/withings/wiscale2/ans

apktool b $folder -o $target_filename

if [ ! -f my.keystore ]; then
	keytool -genkey -v -keystore my.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias app 
fi

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my.keystore $target_filename app

