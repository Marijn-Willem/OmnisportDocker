#!/bin/sh
REPODIR=../../OmniSport

copySourceDir() {
	MODULEDIR=$REPODIR/$1
	
	mkdir -p Sources/$1/src/main
	cp $MODULEDIR/build.gradle Sources/$1
	cp -r $MODULEDIR/src/main/* Sources/$1/src/main
}

rm -f -r Sources
rm -f -r ImportFiles

cd $REPODIR
git checkout master
cd ../OmnisportDocker/Tomcat

mkdir -p Sources
cp $REPODIR/settings.gradle Sources

copySourceDir buildSrc
copySourceDir general
copySourceDir alcifocalc
copySourceDir h2hcalc
copySourceDir web
copySourceDir teamcalc
copySourceDir cyclingroadcalc
copySourceDir dartscalc
copySourceDir speedskatingcalc
copySourceDir cachemanagement
copySourceDir servlet
copySourceDir alcifosports
copySourceDir alias
copySourceDir api
copySourceDir cyclingroad
copySourceDir darts
copySourceDir flush
copySourceDir h2hsports
copySourceDir management
copySourceDir speedskating
copySourceDir teamsports

mkdir -p ImportFiles/Darts/PersonMatchImport
mkdir -p ImportFiles/Speedskating/EventPersonImport
mkdir -p ImportFiles/Teamsport/TeamMatchAction
./CopyImportFiles.sh Darts/PersonMatchImport
./CopyImportFiles.sh Speedskating/EventPersonImport
./CopyImportFiles.sh Teamsport/TeamMatchAction

docker ps -a -q -f "ancestor=mwdf/omnisportweb" | xargs docker container rm
docker build -t mwdf/omnisportweb .
docker images -q -f "dangling=true" | xargs docker rmi

docker push mwdf/omnisportweb
