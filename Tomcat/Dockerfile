FROM gradle:8.0.2-jdk17 AS GRADLE_IMAGE
COPY Sources /tmp/sources
WORKDIR /tmp/sources
RUN gradle war

FROM tomcat:10.1.7-jdk17-temurin
COPY ImportFiles/Darts/PersonMatchImport /usr/tmp/Darts/PersonMatchImport
COPY ImportFiles/Speedskating/EventPersonImport /usr/tmp/Speedskating/EventPersonImport
COPY ImportFiles/Teamsport/TeamMatchAction /usr/tmp/Teamsport/TeamMatchAction

COPY --from=GRADLE_IMAGE /tmp/sources/alcifosports/build/libs/alcifosports.war $CATALINA_HOME/webapps/alcifosports.war
COPY --from=GRADLE_IMAGE /tmp/sources/alias/build/libs/alias.war $CATALINA_HOME/webapps/alias.war
COPY --from=GRADLE_IMAGE /tmp/sources/api/build/libs/api.war $CATALINA_HOME/webapps/api.war
COPY --from=GRADLE_IMAGE /tmp/sources/cyclingroad/build/libs/cyclingroad.war $CATALINA_HOME/webapps/cyclingroad.war
COPY --from=GRADLE_IMAGE /tmp/sources/darts/build/libs/darts.war $CATALINA_HOME/webapps/darts.war
COPY --from=GRADLE_IMAGE /tmp/sources/flush/build/libs/flush.war $CATALINA_HOME/webapps/flush.war
COPY --from=GRADLE_IMAGE /tmp/sources/h2hsports/build/libs/h2hsports.war $CATALINA_HOME/webapps/h2hsports.war
COPY --from=GRADLE_IMAGE /tmp/sources/management/build/libs/management.war $CATALINA_HOME/webapps/management.war
COPY --from=GRADLE_IMAGE /tmp/sources/speedskating/build/libs/speedskating.war $CATALINA_HOME/webapps/speedskating.war
COPY --from=GRADLE_IMAGE /tmp/sources/teamsports/build/libs/teamsports.war $CATALINA_HOME/webapps/teamsports.war

EXPOSE 8080
