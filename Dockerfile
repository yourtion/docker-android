FROM java:8

MAINTAINER Yourtion <yourtion@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
# Everything will be installed in the directory but jdk.
ENV SDK_HOME /usr/local

# Install dependencies
RUN dpkg --add-architecture i386 && \
    apt-get -qq update && \
    apt-get -qqy install libc6:i386 libstdc++6:i386 zlib1g:i386 libncurses5:i386 tar git --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Download and untar Android SDK
ENV ANDROID_SDK_VERSION 24.4.1
ENV ANDROID_SDK_URL http://dl.google.com/android/android-sdk_r${ANDROID_SDK_VERSION}-linux.tgz
RUN curl -sSL "${ANDROID_SDK_URL}" | tar --no-same-owner -xz -C ${SDK_HOME}
ENV ANDROID_HOME ${SDK_HOME}/android-sdk-linux
ENV ANDROID_SDK ${SDK_HOME}/android-sdk-linux
ENV PATH ${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools:$PATH

# Install Android SDK components
ENV ANDROID_VERSION 25
ENV ANDROID_TOOLS_VERSION 25.0.0

ENV ANDROID_COMPONENTS platform-tools,build-tools-${ANDROID_TOOLS_VERSION},android-${ANDROID_VERSION}
ENV GOOGLE_COMPONENTS extra-android-m2repository

RUN echo y | android update sdk --no-ui --all --filter "${ANDROID_COMPONENTS}"; \
    echo y | android update sdk --no-ui --all --filter "${GOOGLE_COMPONENTS}"
