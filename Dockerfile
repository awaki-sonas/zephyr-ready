# See https://github.com/zephyrproject-rtos/docker-image
FROM zephyrprojectrtos/ci:latest

ARG ZEPHYR_VERSION=v3.5.0
ARG ZEPHYR_PROJECT=/home/user/zephyrproject

USER user

RUN west init --mr ${ZEPHYR_VERSION} ${ZEPHYR_PROJECT}
RUN cd ${ZEPHYR_PROJECT} && west update && west zephyr-export

WORKDIR ${ZEPHYR_PROJECT}
