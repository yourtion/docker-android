FROM java:8

MAINTAINER Yourtion <yourtion@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN dpkg --add-architecture i386 && \
    apt-get -qq update && \
    apt-get -qqy install libc6:i386 libstdc++6:i386 zlib1g:i386 libncurses5:i386 tar git --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Everything will be installed in the directory but jdk.
ENV SDK_HOME /usr/local \
    ANDROID_SDK_VERSION 25.2.4 \
    ANDROID_SDK_URL http://dl.google.com/android/repository/tools_r${ANDROID_SDK_VERSION}-linux.zip \

    ANDROID_HOME ${SDK_HOME}/android-sdk-linux \
    ANDROID_SDK ${SDK_HOME}/android-sdk-linux \
    PATH ${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools:$PATH

RUN curl -L "${ANDROID_SDK_URL}" > android-sdk.zip && \
    unzip android-sdk.zip -d ${SDK_HOME}/android-sdk-linux && \
    rm android-sdk.zip && \

    mkdir -p "$ANDROID_SDK/licenses" && \
    echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_SDK/licenses/android-sdk-license" && \
    echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_SDK/licenses/android-sdk-preview-license"
