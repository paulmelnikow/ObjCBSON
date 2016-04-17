#!/bin/sh

set -o pipefail

gem install xcpretty

(
	cd Example
	pod install
	xcodebuild test -workspace Example.xcworkspace -scheme ObjCBSON-Example-sdk iphonesimulator ONLY_ACTIVE_ARCH=NO | xcpretty -c
)

(
	cd ObjCBSONSampleApp
	pod install
	xcodebuild test -workspace ObjCBSONSampleApp.xcworkspace -scheme ObjCBSONSampleApp iphonesimulator ONLY_ACTIVE_ARCH=NO | xcpretty -c
)
