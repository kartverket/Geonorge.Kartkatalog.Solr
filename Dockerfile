FROM eclipse-temurin:23.0.2_7-jdk-alpine

RUN mkdir -p /solr/server/logs

WORKDIR /solr/server

COPY contexts/ /solr/server/contexts
COPY etc/ /solr/server/etc
COPY lib/ /solr/server/lib
COPY modules/ /solr/server/modules
COPY resources/ /solr/server/resources
COPY scripts/ /solr/server/scripts
COPY solr/ /solr/server/solr
COPY solr-webapp/ /solr/server/solr-webapp
COPY start.jar /solr/server/start.jar

EXPOSE 8983

CMD [ "java", "-DSTOP.KEY=solrrocks", "-DSTOP.PORT=7983", "-DdisableAdminUI=false", "-Dhost=localhost", "-Djava.io.tmpdir=/tmp", "-Djava.security.manager", "-Djava.security.policy=/solr/server/etc/security.policy", "-Djava.security.properties=/solr/server/etc/security.properties", "-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager", "-Djetty.home=/solr/server", "-Djetty.port=8983", "-Dlog4j.configurationFile=/solr/server/resources/log4j2.xml", "-Dsolr.default.confdir=/solr/server/solr/configsets/_default/conf", "-Dsolr.install.dir=/solr", "-Dsolr.install.symDir=/solr", "-Dsolr.internal.network.permission=*", "-Dsolr.jetty.host=0.0.0.0", "-Dsolr.jetty.inetaccess.excludes=", "-Dsolr.jetty.inetaccess.includes=", "-Dsolr.log.dir=/solr/server/logs", "-Dsolr.solr.home=/solr/server/solr", "-Duser.timezone=UTC", "-XX:+AlwaysPreTouch", "-XX:+CrashOnOutOfMemoryError", "-XX:+ExplicitGCInvokesConcurrent", "-XX:+ParallelRefProcEnabled", "-XX:+PerfDisableSharedMem", "-XX:+UseG1GC", "-XX:+UseLargePages", "-XX:-OmitStackTraceInFastThrow", "-XX:ErrorFile=/solr/server/logs/jvm_crash_%p.log", "-XX:MaxGCPauseMillis=250", "-Xlog:gc*:file=/solr/server/logs/solr_gc.log:time,uptime:filecount=9,filesize=20M", "-Xms512m", "-Xmx512m", "-Xss256k", "-jar", "start.jar", "--module=http"]