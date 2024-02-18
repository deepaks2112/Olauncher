#!/bin/bash

signing_artifacts_path=$1

echo "Checking for signing_artifacts_path at ${signing_artifacts_path}"
if [ -n $signing_artifacts_path ]
then
    echo "Copying signing artifacts for signed release specified at ${signing_artifacts_path}"
    cp -r $signing_artifacts_path/* ./app/
fi

echo "Starting to create release"
./gradlew clean assembleRelease


RELEASE_VERSION=$(date -Iminutes)
echo "Release version is $RELEASE_VERSION"

echo "Renaming release directory to release version"
mv ./app/build/outputs/apk/release ./app/build/outputs/apk/$RELEASE_VERSION

echo "Creating release_outputs directory"
mkdir -p /app/release_outputs

echo "Copying release output to release_outputs"
cp -r ./app/build/outputs/apk release_outputs

echo "Build successful"