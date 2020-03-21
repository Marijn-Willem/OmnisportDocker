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
WORKDIR /tmp/sources/TeamCalc
RUN mvn install
WORKDIR /tmp/sources/SportsServlet
RUN mvn install
WORKDIR /tmp/sources/TeamSports
RUN mvn install

FROM tomcat
COPY --from=MAVEN_IMAGE /tmp/sources/TeamSports/target/teamsports*.war $CATALINA_HOME/webapps/teamsports.war

EXPOSE 8080