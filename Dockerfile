# See https://github.com/zephyrproject-rtos/docker-image
#
# NOTE: The Docker image v0.26.7 is only available for x86 because the AArch64 Zephyr SDK build is currently unavailable
# due to CI runner issues. A follow-up release with AArch64 build will be provided once the runner issue is fixed.
FROM zephyrprojectrtos/ci:v0.26.9

ARG ZEPHYR_VERSION=v3.6.0
ARG ZEPHYR_PROJECT=/home/user/zephyrproject

USER user

RUN west init --mr ${ZEPHYR_VERSION} ${ZEPHYR_PROJECT}
RUN cd ${ZEPHYR_PROJECT} && west update && west zephyr-export

WORKDIR ${ZEPHYR_PROJECT}
