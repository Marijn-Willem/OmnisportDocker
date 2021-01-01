#!/bin/sh
copySourceDir() {
	BASEDIR=../../$1
	mkdir -p Sources/$1/src/main
	cp $BASEDIR/pom.xml Sources/$1
	cp -r $BASEDIR/src/main/* Sources/$1/src/main
}

rm -f -r Sources
rm -f -r ImportFiles

copySourceDir SportsGeneral
copySourceDir AlcifoCalc
copySourceDir H2HCalc
copySourceDir ApiManagement
copySourceDir TeamCalc
copySourceDir DartsCalc
copySourceDir SpeedSkatingCalc
copySourceDir SportsServlet
copySourceDir AlcifoSports
copySourceDir Alias
copySourceDir api
copySourceDir CyclingRoad
copySourceDir Darts
copySourceDir H2HSports
copySourceDir SpeedSkating
copySourceDir SportsManagement
copySourceDir TeamSports

mkdir -p ImportFiles/Darts/PersonMatchImport
mkdir -p ImportFiles/Speedskating/EventPersonImport
mkdir -p ImportFiles/Teamsport/TeamMatchAction
./CopyImportFiles.sh Darts/PersonMatchImport
./CopyImportFiles.sh Speedskating/EventPersonImport
./CopyImportFiles.sh Teamsport/TeamMatchAction

docker build -t mwdf/omnisportweb .
docker container prune -f
docker images -q -f "dangling=true" | xargs docker rmi

docker push mwdf/omnisportweb
