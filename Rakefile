$pod_name = 'ObjCBSON'

desc "Install development dependencies"
task :install do
  raise unless system "pod install --project-directory=Example"
  puts
  puts "Installing xcpretty gem with sudo."
  puts
  raise unless system "sudo -k gem install xcpretty"
end

desc "Install development dependencies"
task :install_for_ci do
  raise unless system "gem install cocoapods xcpretty --no-rdoc --no-ri --no-document --quiet"
  raise unless system "pod install --project-directory=Example"
end

desc "Run tests on the iOS Simulator"
task :test do
  raise unless system "bash -c 'set -o pipefail && xcodebuild test -workspace Example/#{$pod_name}.xcworkspace -scheme #{$pod_name} -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO | xcpretty -c'"
end

desc "Clean build"
task :clean do
  raise unless system "xcodebuild clean -workspace Example/#{$pod_name}.xcworkspace -scheme #{$pod_name}"
end

