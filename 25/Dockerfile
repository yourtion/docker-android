FROM yourtion/android:core

# Install Android SDK components
ENV ANDROID_VERSION 25 \
    ANDROID_TOOLS_VERSION 25.0.2 \
    
    ANDROID_COMPONENTS platform-tools,build-tools-${ANDROID_TOOLS_VERSION},android-${ANDROID_VERSION} \
    GOOGLE_COMPONENTS extra-android-m2repository,extra-android-support

RUN echo y | android update sdk --no-ui --all --filter "${ANDROID_COMPONENTS}"; \
    echo y | android update sdk --no-ui --all --filter "${GOOGLE_COMPONENTS}"
