#!/bin/sh

set -o pipefail

gem install xcpretty
gem install cocoapods

pod --version

(
	cd ObjCBSONSampleApp
	pod install
	xcodebuild -workspace ObjCBSONSampleApp.xcworkspace -scheme ObjCBSONSampleApp -sdk iphonesimulator VALID_ARCHS="armv6 armv7 i386" ONLY_ACTIVE_ARCH=NO | xcpretty -c
)

(
	cd Example
	pod install
	xcodebuild test -workspace ObjCBSON.xcworkspace -scheme ObjCBSON-Example -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO VALID_ARCHS="armv6 armv7 i386" | xcpretty -c
)
