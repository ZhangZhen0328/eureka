#!/usr/bin/env bash


killeureka(){
    pid=`ps -ef|grep eureka.jar|grep java|awk '{print $2}'`
    echo "eureka Id list :$pid"
    if [ "$pid" = "" ]
    then
        echo "no eureka pid alive"
    else
        kill -9 $pid
    fi
}

cd $PROJ_PATH/eureka
mvn clean install -Dmaven.test.skip=true

killeureka

# 复制新的工程
cp $PROJ_PATH/eureka/target/eureka.jar /root/eureka/

nohup java -jar /root/eureka/eureka.jar &


