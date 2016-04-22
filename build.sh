#!/bin/sh

set -o pipefail

gem install xcpretty
gem install cocoapods

pod --version

(
	cd ObjCBSONSampleApp
	pod install
	xcodebuild -workspace ObjCBSONSampleApp.xcworkspace -scheme ObjCBSONSampleApp -sdk iphonesimulator -arch i386 | xcpretty -c
)

(
	cd Example
	pod install
	xcodebuild test -workspace ObjCBSON.xcworkspace -scheme ObjCBSON-Example -sdk iphonesimulator -arch i386 | xcpretty -c
)
