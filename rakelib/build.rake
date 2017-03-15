# origin: https://github.com/paulmelnikow/pod-template-rake

scheme_args = "-workspace Example/#{$pod_name}.xcworkspace -scheme #{$pod_name}-Example"
scheme2_args = "-workspace #{$pod_name}SampleApp/#{$pod_name}SampleApp.xcworkspace -scheme #{$pod_name}SampleApp"

desc "Run tests on the iOS Simulator"
task :test do
  raise unless system "bash -c 'set -o pipefail && xcodebuild test #{scheme_args} -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO | xcpretty -c'"
  raise unless system "bash -c 'set -o pipefail && xcodebuild test #{scheme2_args} -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO | xcpretty -c'"
end

desc "Clean build"
task :clean do
  raise unless system "xcodebuild clean #{scheme_args}"
  raise unless system "xcodebuild clean #{scheme2_args}"
end
