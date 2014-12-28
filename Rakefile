task :install do
  raise unless system "sudo -k gem install xcpretty"
end

task :test do
  raise unless system "bash -c 'set -o pipefail && xcodebuild test -workspace Example/ObjCBSON.xcworkspace -scheme ObjCBSON -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO | xcpretty -c'"
end

task :clean do
  raise unless system "xcodebuild clean -workspace Example/ObjCBSON.xcworkspace -scheme ObjCBSON"
end

