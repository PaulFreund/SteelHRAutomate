# Withings Steel HR hack

This is the second version of my modifications to Health Mate that allow it to show notifications for everything on the watch. This hack is based by changing the intent Health Mate is watching for to show SMS notifications.

I will not upload the APK directly. At the moment this guide is targeted at advanced users but can be improved in the future.

# What you need

* Noikia Health Mate app apk (com.withings.wiscale2) for example from apkmirror.com (3.6.0 was tested)
* Java JDK (jdk1.8.0_131 in my case)
* APKTool.jar (apktool_2.2.4.jar in my case)
* (Optional) ADB
* Tasker or Automate or similar app

# Steps

1. Unpack downloaded apk with: java -jar apktool.jar d com.withings.wiscale2.apk
2. There will be a folder called com.withings.wiscale2
3. Get the files from this repository
4. In the folder com.withings.wiscale2 replace the AndroidManifest.xml file
5. In the folder com.withings.wiscale2\smali\com\withings\wiscale2\ans replace the SmsReceiver.smali file
6. Pack the apk again with: java -jar apktool.jar b com.withings.wiscale2 -o com.withings.wiscale2_modified.apk
7. Create a keystore with: keytool.exe -genkey -v -keystore my.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias app (choose any password, keytool.exe is part of the jdk)
8. Sign the apk with: jarsigner.exe -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my.keystore com.withings.wiscale2_modified.apk app (jarsigner.exe is part of the jdk)
9. Optionally install the app with ADB or copy it to phone and install it after allowing unverified sources
10. After installing you can send the intent action "android.intent.action.STEELHR" to the Health Mate app and set the Data URI to the text you want to have displayed, 18 characters is the limit
11. With an app like Tasker or Automate you can generate a Script that runs in the background, watches for all notifications and sends the trigger to the Health Mate app. the "Steel HR Notify.flo" file in this repository is an example for the app Automate
12. Additionally there is to file "Steel HR Alarm.flo" which notifies every second on the set alarm time so in contrast to the alarm of the Health Mate app it does not stop until you go to your phone and accept it. I have overslept too many times from the weak vibrations and the alarm that stops after about 20 seconds.
