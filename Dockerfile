FROM openjdk:8-jdk

ENV ANDROID_COMPILE_SDK=27 \
    ANDROID_BUILD_TOOLS=27.0.3 \
    ANDROID_HOME=/opt/android-sdk-linux

RUN curl -o /opt/android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip &&\
    unzip -q /opt/android-sdk.zip -d "${ANDROID_HOME}" &&\
    rm /opt/android-sdk.zip

RUN mkdir "${ANDROID_HOME}/licenses" &&\
    printf "\nd56f5187479451eabf01fb78af6dfcb131a6481e" > "${ANDROID_HOME}/licenses/android-sdk-license" &&\
    mkdir -p ~/.android &&\
    touch ~/.android/repositories.cfg &&\
    "${ANDROID_HOME}/tools/bin/sdkmanager" --update &&\
    "${ANDROID_HOME}/tools/bin/sdkmanager" \
        "platforms;android-${ANDROID_COMPILE_SDK}" \
        "build-tools;${ANDROID_BUILD_TOOLS}" \
        "extras;google;m2repository" \
        "extras;android;m2repository"

ENV PATH="${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/build-tools/${ANDROID_BUILD_TOOLS}"
