#!/usr/bin/env bash

cd $PROJ_PATH/eureka
mvn clean install -Dmaven.test.skip=true

# 复制新的工程
cp $PROJ_PATH/eureka/target/eureka.jar /root/eureka/

nohup java -jar /root/eureka/eureka.jar &


