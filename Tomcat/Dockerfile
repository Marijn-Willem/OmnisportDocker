FROM maven AS MAVEN_IMAGE
COPY Sources /tmp/sources
WORKDIR /tmp/sources/SportsGeneral
RUN mvn install
WORKDIR /tmp/sources/AlcifoCalc
RUN mvn install
WORKDIR /tmp/sources/H2HCalc
RUN mvn install
WORKDIR /tmp/sources/ApiManagement
RUN mvn install
WORKDIR /tmp/sources/SportsWeb
RUN mvn install
WORKDIR /tmp/sources/TeamCalc
RUN mvn install
WORKDIR /tmp/sources/CyclingRoadCalc
RUN mvn install
WORKDIR /tmp/sources/DartsCalc
RUN mvn install
WORKDIR /tmp/sources/SpeedSkatingCalc
RUN mvn install
WORKDIR /tmp/sources/SportsServlet
RUN mvn install
WORKDIR /tmp/sources/AlcifoSports
RUN mvn install
WORKDIR /tmp/sources/Alias
RUN mvn install
WORKDIR /tmp/sources/api
RUN mvn install
WORKDIR /tmp/sources/CyclingRoad
RUN mvn install
WORKDIR /tmp/sources/Darts
RUN mvn install
WORKDIR /tmp/sources/H2HSports
RUN mvn install
WORKDIR /tmp/sources/SpeedSkating
RUN mvn install
WORKDIR /tmp/sources/SportsManagement
RUN mvn install
WORKDIR /tmp/sources/TeamSports
RUN mvn install

FROM tomcat
COPY ImportFiles/Darts/PersonMatchImport /usr/tmp/Darts/PersonMatchImport
COPY ImportFiles/Speedskating/EventPersonImport /usr/tmp/Speedskating/EventPersonImport
COPY ImportFiles/Teamsport/TeamMatchAction /usr/tmp/Teamsport/TeamMatchAction

COPY --from=MAVEN_IMAGE /tmp/sources/AlcifoSports/target/alcifosports*.war $CATALINA_HOME/webapps/alcifosports.war
COPY --from=MAVEN_IMAGE /tmp/sources/Alias/target/alias*.war $CATALINA_HOME/webapps/alias.war
COPY --from=MAVEN_IMAGE /tmp/sources/api/target/api*.war $CATALINA_HOME/webapps/api.war
COPY --from=MAVEN_IMAGE /tmp/sources/CyclingRoad/target/cyclingroad*.war $CATALINA_HOME/webapps/cyclingroad.war
COPY --from=MAVEN_IMAGE /tmp/sources/Darts/target/darts*.war $CATALINA_HOME/webapps/darts.war
COPY --from=MAVEN_IMAGE /tmp/sources/H2HSports/target/h2hsports*.war $CATALINA_HOME/webapps/h2hsports.war
COPY --from=MAVEN_IMAGE /tmp/sources/SpeedSkating/target/speedskating*.war $CATALINA_HOME/webapps/speedskating.war
COPY --from=MAVEN_IMAGE /tmp/sources/SportsManagement/target/management*.war $CATALINA_HOME/webapps/management.war
COPY --from=MAVEN_IMAGE /tmp/sources/TeamSports/target/teamsports*.war $CATALINA_HOME/webapps/teamsports.war

EXPOSE 8080