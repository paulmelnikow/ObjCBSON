#!/bin/sh

set -o pipefail

gem install xcpretty
gem install cocoapods --pre

pod --version

(
	cd Example
	pod install
	xcodebuild test -workspace ObjCBSON.xcworkspace -scheme ObjCBSON-Example ONLY_ACTIVE_ARCH=NO | xcpretty -c
)

(
	cd ObjCBSONSampleApp
	pod install
	xcodebuild -workspace ObjCBSONSampleApp.xcworkspace -scheme ObjCBSONSampleApp ONLY_ACTIVE_ARCH=NO | xcpretty -c
)
