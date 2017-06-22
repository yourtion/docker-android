# docker-android

[![android](http://dockeri.co/image/yourtion/android)](https://hub.docker.com/r/yourtion/android/)

Docker for android project for GitLab-CI or others.

## Included

* Debian jessie
* Java 8
* Android SDK
* Android Support Libraries

## Download

```shell
docker pull yourtion/android
```

## Usage

```shell
sudo docker run -t -i yourtion/android:latest /bin/shell
```

## Env

```shell
ENV SDK_HOME /usr/local
ENV ANDROID_HOME ${SDK_HOME}/android-sdk-linux
ENV ANDROID_SDK ${SDK_HOME}/android-sdk-linux
```

## Install more tools

```shell
# Google API
echo y | android update sdk --no-ui --all --filter extra-google-m2repository extra-google-google_play_services

# Google Play
echo y | android update sdk --no-ui --all --filter extra-google-google_play_services

# Build tools
# Please keep these in descending order!
echo y | android update sdk --no-ui --all --filter build-tools-25.0.2 | grep 'package installed'
echo y | android update sdk --no-ui --all --filter build-tools-25.0.1 | grep 'package installed'
echo y | android update sdk --no-ui --all --filter build-tools-25.0.0 | grep 'package installed'
echo y | android update sdk --no-ui --all --filter build-tools-24.0.3 | grep 'package installed'
echo y | android update sdk --no-ui --all --filter build-tools-24.0.2 | grep 'package installed'
echo y | android update sdk --no-ui --all --filter build-tools-24.0.1 | grep 'package installed'
echo y | android update sdk --no-ui --all --filter build-tools-23.0.3 | grep 'package installed'
echo y | android update sdk --no-ui --all --filter build-tools-23.0.2 | grep 'package installed'
echo y | android update sdk --no-ui --all --filter build-tools-23.0.1 | grep 'package installed'

# SDKs
# Please keep these in descending order!
echo y | android update sdk --no-ui --all --filter android-25 | grep 'package installed'
echo y | android update sdk --no-ui --all --filter android-24 | grep 'package installed'
echo y | android update sdk --no-ui --all --filter android-23 | grep 'package installed'
echo y | android update sdk --no-ui --all --filter android-18 | grep 'package installed'
echo y | android update sdk --no-ui --all --filter android-16 | grep 'package installed'
```
