#!/bin/sh
REPODIR=../../OmniSport

copySourceDir() {
	MODULEDIR=$REPODIR/$1
	
	if [[ -e $MODULEDIR ]]
	then
		mkdir -p Sources/$1/src/main
		cp $MODULEDIR/build.gradle Sources/$1		
		cp -r $MODULEDIR/src/main/* Sources/$1/src/main
	fi
}

rm -f -r Sources
rm -f -r ImportFiles

cd $REPODIR
git checkout master
cd ../OmnisportDocker/Tomcat

mkdir -p Sources
cp $REPODIR/settings.gradle Sources

copySourceDir buildSrc

for i in $(grep -E -o "'[a-z0-9]+'" Sources/settings.gradle)
do
	copySourceDir ${i:1:-1}
done

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
