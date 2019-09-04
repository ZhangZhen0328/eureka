#!/usr/bin/env bash

killtomcat(){
    pid=`ps -ef|grep tomcat|grep java|awk '${print $2}'`
    echo "tomcat Id list :$pid"
    if [ "$pid" = "" ]
    then
        echo "no tomcat pid alive"
    else
        kill -9 $pid
    fi
}
cd $PROJ_PATH/eureka
mvn clean install

#停止tomcat
killtomcat

# 删除原有工程
rm -rf $TOMCAT_APP_PATH/webapps/ROOT
rm -f $TOMCAT_APP_PATH/webapps/ROOT.jar
rm -f $TOMCAT_APP_PATH/webapps/eureka.jar

# 复制新的工程
cp $PROJ_PATH/eureka/target/eureka.war $TOMCAT_APP_PATH/webapps/

cd $TOMCAT_APP_PATH/webapps/
mv order.war ROOT.war

# 启动tomcat
cd $TOMCAT_APP_PATH/
sh bin/startup.sh

