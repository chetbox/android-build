FROM openjdk:8-jdk
ADD install-android-sdk /opt/install-android-sdk
RUN /opt/install-android-sdk
ENV ANDROID_HOME=/opt/android-sdk-linux
ENV PATH="${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools"
