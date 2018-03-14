# Action Utilities for tvOS

This folder contains any tvOS specific implementations of the **Action Utilities** library. And is contained in two Targets: **ActionUtilities tvOS** & **Package tvOS**.

## Action Utilities tvOS

Is a standard build target for the tvOS version of the library built against Swift 4. This can be used for testing and including the library directly in another tvOS app.

## Package tvOS

Builds a stand alone framework version from the library for tvOS using two build scripts under the **Build Phases** tab: **Make Universal Library** & **Build API Documentation**.

### Make Universal Library

Uses the following shell script to build a universal library that will run on both an tvOS Device and the tvOS Simulator. This script was derived from the [Build a Universal Framework for iOS using Swift] (https://medium.com/swiftindia/build-a-custom-universal-framework-on-ios-swift-549c084de7c8) article by **swiftindia**:

```sh
#!/bin/sh

# Define Macros
RELEASE_TYPE="01.01"
UNIVERSAL_OUTPUTFOLDER=${BUILD_DIR}/${CONFIGURATION}-universal-iOS
UNIVERSAL_TARGET="tvOS"
UNIVERSAL_FRAMEWORKFOLDER=${PROJECT_NAME}Frameworks${RELEASE_TYPE}/${UNIVERSAL_TARGET}
DEVICE_OS="appletvos"
DEVICE_SIMULATOR="appletvsimulator"

# Make sure the output directories exists
mkdir -p "${UNIVERSAL_OUTPUTFOLDER}"
mkdir -p "${UNIVERSAL_FRAMEWORKFOLDER}"

# Step 1. Build Device and Simulator versions
# See: https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/xcodebuild.1.html
xcodebuild -target "${PROJECT_NAME} ${UNIVERSAL_TARGET}" ONLY_ACTIVE_ARCH=NO -configuration ${CONFIGURATION} -sdk ${DEVICE_OS}  BUILD_DIR="${BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}" clean build
xcodebuild -target "${PROJECT_NAME} ${UNIVERSAL_TARGET}" VALID_ARCHS="x86_64 i386" -configuration ${CONFIGURATION} -sdk ${DEVICE_SIMULATOR} ONLY_ACTIVE_ARCH=NO BUILD_DIR="${BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}" clean build

# Step 2. Copy the framework structure (from iphoneos build) to the universal folder
cp -R "${BUILD_DIR}/${CONFIGURATION}-${DEVICE_OS}/${PROJECT_NAME}.framework" "${UNIVERSAL_OUTPUTFOLDER}/"

# Step 3. Copy Swift modules from iphonesimulator build (if it exists) to the copied framework directory
SIMULATOR_SWIFT_MODULES_DIR="${BUILD_DIR}/${CONFIGURATION}-${DEVICE_SIMULATOR}/${PROJECT_NAME}.framework/Modules/${PROJECT_NAME}.swiftmodule/."
if [ -d "${SIMULATOR_SWIFT_MODULES_DIR}" ]; then
cp -R "${SIMULATOR_SWIFT_MODULES_DIR}" "${UNIVERSAL_OUTPUTFOLDER}/${PROJECT_NAME}.framework/Modules/${PROJECT_NAME}.swiftmodule"
fi

# Step 4. Create universal binary file using lipo and place the combined executable in the copied framework directory
lipo -create -output "${UNIVERSAL_OUTPUTFOLDER}/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${BUILD_DIR}/${CONFIGURATION}-${DEVICE_SIMULATOR}/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${BUILD_DIR}/${CONFIGURATION}-${DEVICE_OS}/${PROJECT_NAME}.framework/${PROJECT_NAME}"

# Step 5. Convenience step to copy the framework to the project's directory
cp -R "${UNIVERSAL_OUTPUTFOLDER}/${PROJECT_NAME}.framework" "${UNIVERSAL_FRAMEWORKFOLDER}/"

# Step 6. Convenience step to open the project's directory in Finder
# open "${UNIVERSAL_FRAMEWORKFOLDER}/"

# KKM - Testing
# open "${UNIVERSAL_OUTPUTFOLDER}"
```

### Build API Documentation

Uses the shell script to build API documentation with [Jazzy](https://github.com/realm/jazzy). APPCODA has an excellent article on [Documenting Your Swift Code in Xcode Using Markdown](https://www.appcoda.com/swift-markdown/):

```sh
#!/bin/sh

# Define macros
API_TARGET="tvOS"
API_OUTPUT="${PROJECT_DIR}/API/${API_TARGET}"
DEVICE_OS="appletvos"
ROOT_URL="http://appracatappra.com/api/actionutilities/tvos/"

# Make sure the output directory exists
mkdir -p "${API_OUTPUT}"

# Move to project directory
cd "${PROJECT_DIR}"

# Create documentation with Jazzy
jazzy --output "${API_OUTPUT}" --sdk ${DEVICE_OS} --clean --xcodebuild-arguments -target,"${PROJECT_NAME} ${API_TARGET}" --module ${PROJECT_NAME} --author "Appracatappra, LLC" --root-url "${ROOT_URL}"

# Open project directory
# open "${API_OUTPUT}"
```



