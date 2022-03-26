FROM gradle:7.1.1-jdk16 AS GRADLE_IMAGE
COPY Sources /tmp/sources
WORKDIR /tmp/sources/AlcifoSports
RUN gradle war
WORKDIR /tmp/sources/Alias
RUN gradle war
WORKDIR /tmp/sources/api
RUN gradle war
WORKDIR /tmp/sources/CyclingRoad
RUN gradle war
WORKDIR /tmp/sources/Darts
RUN gradle war
WORKDIR /tmp/sources/Flush
RUN gradle war
WORKDIR /tmp/sources/H2HSports
RUN gradle war
WORKDIR /tmp/sources/SpeedSkating
RUN gradle war
WORKDIR /tmp/sources/SportsManagement
RUN gradle war
WORKDIR /tmp/sources/TeamSports
RUN gradle war

FROM tomcat:10.0-jdk16-temurin
COPY ImportFiles/Darts/PersonMatchImport /usr/tmp/Darts/PersonMatchImport
COPY ImportFiles/Speedskating/EventPersonImport /usr/tmp/Speedskating/EventPersonImport
COPY ImportFiles/Teamsport/TeamMatchAction /usr/tmp/Teamsport/TeamMatchAction

COPY --from=GRADLE_IMAGE /tmp/sources/AlcifoSports/build/libs/alcifosports.war $CATALINA_HOME/webapps/alcifosports.war
COPY --from=GRADLE_IMAGE /tmp/sources/Alias/build/libs/alias.war $CATALINA_HOME/webapps/alias.war
COPY --from=GRADLE_IMAGE /tmp/sources/api/build/libs/api.war $CATALINA_HOME/webapps/api.war
COPY --from=GRADLE_IMAGE /tmp/sources/CyclingRoad/build/libs/cyclingroad.war $CATALINA_HOME/webapps/cyclingroad.war
COPY --from=GRADLE_IMAGE /tmp/sources/Darts/build/libs/darts.war $CATALINA_HOME/webapps/darts.war
COPY --from=GRADLE_IMAGE /tmp/sources/Flush/build/libs/flush.war $CATALINA_HOME/webapps/flush.war
COPY --from=GRADLE_IMAGE /tmp/sources/H2HSports/build/libs/h2hsports.war $CATALINA_HOME/webapps/h2hsports.war
COPY --from=GRADLE_IMAGE /tmp/sources/SpeedSkating/build/libs/speedskating.war $CATALINA_HOME/webapps/speedskating.war
COPY --from=GRADLE_IMAGE /tmp/sources/SportsManagement/build/libs/management.war $CATALINA_HOME/webapps/management.war
COPY --from=GRADLE_IMAGE /tmp/sources/TeamSports/build/libs/teamsports.war $CATALINA_HOME/webapps/teamsports.war

EXPOSE 8080