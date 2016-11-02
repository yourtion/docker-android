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
