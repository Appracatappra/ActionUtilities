# Action Utilities for macOS

This folder contains any macOS specific implementations of the **Action Utilities** library. And is contained in two Targets: **ActionUtilities macOS** & **Package macOS**.

## Action Utilities macOS

Is a standard build target for the macOS version of the library built against Swift 4. This can be used for testing and including the library directly in another macOS app.

## Package macOS

Builds a stand alone framework version from the library for macOS using two build scripts under the **Build Phases** tab: **Make Library** & **Build API Documentation**.

### Make Library

Uses the following shell script to build a ibrary that will run on a macOS device. This script was derived from the [Build a Universal Framework for iOS using Swift] (https://medium.com/swiftindia/build-a-custom-universal-framework-on-ios-swift-549c084de7c8) article by **swiftindia**:

```sh
#!/bin/sh

# Define Macros
RELEASE_TYPE="01.01"
UNIVERSAL_TARGET="macOS"
DEVICE_OS="macosx"
UNIVERSAL_FRAMEWORKFOLDER=${PROJECT_NAME}Frameworks${RELEASE_TYPE}/${UNIVERSAL_TARGET}
FRAMEWORK_VERSION="TRIAL_VERSION"

# Make sure the output directories exists
mkdir -p "${UNIVERSAL_FRAMEWORKFOLDER}"

# Step 1. Build Device and Simulator versions
# See: https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/xcodebuild.1.html
xcodebuild -target "${PROJECT_NAME} ${UNIVERSAL_TARGET}" ONLY_ACTIVE_ARCH=NO -configuration ${CONFIGURATION} -sdk ${DEVICE_OS}  BUILD_DIR="${BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}" OTHER_SWIFT_FLAGS="-D ${FRAMEWORK_VERSION}" clean build


# Step 2. Copy the framework structure (from iphoneos build) to the universal folder
cp -R "${BUILD_DIR}/${CONFIGURATION}/${PROJECT_NAME}.framework" "${UNIVERSAL_FRAMEWORKFOLDER}/"

# Step 3. Convenience step to open the project's directory in Finder
# open "${UNIVERSAL_FRAMEWORKFOLDER}/"
```

### Build API Documentation

Uses the shell script to build API documentation with [Jazzy](https://github.com/realm/jazzy). APPCODA has an excellent article on [Documenting Your Swift Code in Xcode Using Markdown](https://www.appcoda.com/swift-markdown/):

```sh
#!/bin/sh

# Define macros
API_TARGET="macOS"
API_OUTPUT="${PROJECT_DIR}/API/${API_TARGET}"
DEVICE_OS="macosx"
ROOT_URL="http://appracatappra.com/api/actionutilities/macos/"

# Make sure the output directory exists
mkdir -p "${API_OUTPUT}"

# Move to project directory
cd "${PROJECT_DIR}"

# Create documentation with Jazzy
jazzy --output "${API_OUTPUT}" --sdk ${DEVICE_OS} --clean --xcodebuild-arguments -target,"${PROJECT_NAME} ${API_TARGET}" --module ${PROJECT_NAME} --author "Appracatappra, LLC" --root-url "${ROOT_URL}"

# Open project directory
# open "${API_OUTPUT}"
```



