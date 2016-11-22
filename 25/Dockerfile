FROM yourtion/android:core

# Install Android SDK components
ENV ANDROID_VERSION 25
ENV ANDROID_TOOLS_VERSION 25.0.0

ENV ANDROID_COMPONENTS platform-tools,build-tools-${ANDROID_TOOLS_VERSION},android-${ANDROID_VERSION}
ENV GOOGLE_COMPONENTS extra-android-m2repository

RUN echo y | android update sdk --no-ui --all --filter "${ANDROID_COMPONENTS}"; \
    echo y | android update sdk --no-ui --all --filter "${GOOGLE_COMPONENTS}"
