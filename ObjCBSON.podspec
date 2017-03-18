Pod::Spec.new do |s|
  s.name             = "ObjCBSON"
  s.version          = "0.2.1"
  s.summary          = "High-performance BSON serialization and deserialization in Objective-C"
  s.description      = "High-performance BSON serialization and deserialization in Objective-C"
  s.homepage         = "https://github.com/paulmelnikow/ObjCBSON"
  s.license          = "Apache License, Version 2.0"
  s.author           = "Paul Melnikow"
  s.source           = { :git => "https://github.com/paulmelnikow/ObjCBSON.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/paulmelnikow'

  s.requires_arc = true

  s.source_files = 'Pod'
  s.private_header_files = 'Pod/*-private.h'

  # Because users need to import our public headers and our public headers
  # need to import "bson.h", and we want this to work across all possible
  # build types.
  s.user_target_xcconfig = { "USER_HEADER_SEARCH_PATHS" => "$(PODS_ROOT)/libbson/src/bson" }

  s.dependency 'libbson', '1.6.1-cocoapods-rc1'
  s.dependency 'OrderedDictionary', '~> 1.2'

  s.osx.deployment_target = "10.7"
  s.ios.deployment_target = "6.0"
end
