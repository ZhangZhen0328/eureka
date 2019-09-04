#!/usr/bin/env bash

killEureka(){
    pid=`ps -ef|grep eureka.jar`
    echo "tomcat Id list :$pid"
    if [ "$pid" = "" ]
    then
        echo "no eureka pid alive"
    else
        kill -9 $pid
    fi
}

cd $PROJ_PATH/eureka
mvn clean install

#杀死eureka的服务
killEureka

# 复制新的工程
cp $PROJ_PATH/eureka/target/eureka.jar /root/eureka/

nohup java -jar /root/eureka/eureka.jar &


