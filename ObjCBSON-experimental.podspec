Pod::Spec.new do |s|
  s.name             = "ObjCBSON-experimental"
  s.version          = "0.1.0"
  s.summary          = "A short description of ObjCBSON-experimental."
  s.description      = <<-DESC
                       An optional longer description of ObjCBSON-experimental

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/paulmelnikow/ObjCBSON-experimental"
  s.license          = "Apache License, Version 2.0"
  s.author           = { "Paul Melnikow" => "email@paulmelnikow.com" }
  s.source           = { :git => "https://github.com/paulmelnikow/ObjCBSON-experimental.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/paulmelnikow'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'ObjCBSON-experimental' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'libbson', '~> 1.0.2'
end
