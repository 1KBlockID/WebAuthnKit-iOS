#!/bin/bash

project="WebAuthnKitDemo"
echo "project name $project"

xcodeproj="${project}.xcodeproj"
echo "xcode project file $xcodeproj"

xcworkspace="${project}.xcworkspace"
echo "xcode workspace file $xcworkspace"

# set scheme
scheme="WebAuthnKit"
echo "xcode scheme set to $scheme"

# set configuration
configuration="release"
echo "xcode configuration set to $configuration"

# set custom path for all xcarchive
# the archive directory is hidden
archivePath="./.xcarchives"
echo "archive path set to $archivePath"

# path to WebAuthnKit.xcframework
xcFrameworkPath="${archivePath}/${scheme}.xcframework"
echo "xcframework path set to $xcFrameworkPath"

# define list of destinations
destinations=("generic/platform=iOS" "generic/platform=iOS Simulator")

# list of platforms
#platforms=("iphoneos" "iphonesimulator")
platforms=("iphoneos" "iphonesimulator")

# clean build
echo "cleaning started"
xcodebuild clean
echo "cleaning finished"

# remove .xcframework directory, if exist
if [ -d "./${scheme}.xcframework" ]; then
    printf '%s\n' "removing ${scheme}.xcframework"
    rm -rf "./${scheme}.xcframework"
fi

# make sure the xcarchives directory exists
mkdir -p "${archivePath}"

index = 0
for destination in "${destinations[@]}"; do
    echo "archiving for "${destination}" started ..."

    xcodebuild archive \
    -workspace "${xcworkspace}" \
    -scheme "${scheme}" \
    -configuration "${configuration}" \
    -destination "${destination}" \
    -archivePath "${archivePath}/${platforms[$((index++))]}.xcarchive" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

    if test $? -eq 0
        then
            echo "... archiving for "${destination}" finished successfully"
        else
            echo "... archiving for "${destination}" failed with error code: ${?}"
        exit $?
    fi
done

echo "archiving for all destinations is completed"
echo "time to create xcframework"

# FIX ME: ready all platforms xcarchive
# and
# generate and append -framework path
xcodebuild -create-xcframework \
-framework "${archivePath}/${platforms[0]}.xcarchive/Products/Library/Frameworks/${scheme}.framework" \
-framework "${archivePath}/${platforms[1]}.xcarchive/Products/Library/Frameworks/${scheme}.framework" \
-output "${xcFrameworkPath}"

cd ${xcFrameworkPath}
find . -name "*.swiftinterface" -exec sed -i -e 's/'${scheme}'\.//g' {} \;

if test $? -eq 0
    then
        echo ":-) YaY, ${scheme} .xcframework created successfully"
    else
        echo ":-( Uh Oh, ${scheme} .xcframework creation failed with error code: ${?}"
        exit $?
fi

# change present working directory
# move to project root directory
cd ../..

# copy WebAuthnKit.xcframework to root project directory
echo "copying ${scheme}.xcframework ..."
cp -r "${xcFrameworkPath}" "./"
echo "... ${scheme}.xcframework copied successfully"

# remove .xcarchives directory
if [ -d "$archivePath" ]; then
    printf '%s\n' "removing ($archivePath)"
    rm -rf "$archivePath"
fi

exit 0
