FROM        sameeha-sadik
MAINTAINER Sadik-Ali
ARG         cluster_conf
ENV         NODE_ID 1
ENV         MULE_ENV dev
#CMD CD      ./../../../../../ \
ADD        ~/$cluster_conf /opt/mule/.mule/mule-cluster.properties
RUN         sed -i '/wrapper.java.additional.15=-Dorg.quartz.scheduler.skipUpdateCheck=true/a wrapper.java.additional.16=-Dmule.nodeId=%NODE_ID%\nwrapper.java.additional.17=-Dmule.env=%MULE_ENV%' /opt/mule/conf/wrapper.conf
# Hazelcast ports
EXPOSE      5701 54327