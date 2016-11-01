FROM java:8

MAINTAINER Yourtion <yourtion@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
# Everything will be installed in the directory but jdk.
ENV SDK_HOME /usr/local

# Install dependencies
RUN apt-get -qq update && \
    apt-get -qqy install --no-install-recommends \
       unzip \
     && rm -rf /var/lib/apt/lists/*

# Install dependencies
RUN dpkg --add-architecture i386 && \
    apt-get -qq update && \
    apt-get -qqy install libc6:i386 libstdc++6:i386 zlib1g:i386 libncurses5:i386 tar git --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Download and unzip Gradle
ENV GRADLE_VERSION 2.2
ENV GRADLE_SDK_URL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
RUN curl -sSL "${GRADLE_SDK_URL}" -o gradle-${GRADLE_VERSION}-bin.zip  \
  && unzip gradle-${GRADLE_VERSION}-bin.zip -d ${SDK_HOME}  \
  && rm -rf gradle-${GRADLE_VERSION}-bin.zip
ENV GRADLE_HOME ${SDK_HOME}/gradle-${GRADLE_VERSION}
ENV PATH ${GRADLE_HOME}/bin:$PATH

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

RUN echo y | android update sdk --no-ui --all --filter "${ANDROID_COMPONENTS}"
