Pod::Spec.new do |s|
  s.name             = "ObjCBSON"
  s.version          = "0.2.0"
  s.summary          = "High-performance BSON serialization and deserialization in Objective-C"
  s.description      = <<-DESC
                       NSError **error = nil;
                       NSDictionary *doc = [BSONSerialization dictionaryWithBSONData:data error:error];

                       NSError **error = nil;
                       NSData *data = [BSONSerialization BSONDataWithDictionary:dictionary error:error];
                       DESC
  s.homepage         = "https://github.com/paulmelnikow/ObjCBSON"
  s.license          = "Apache License, Version 2.0"
  s.author           = "Paul Melnikow"
  s.source           = { :git => "https://github.com/paulmelnikow/ObjCBSON.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/paulmelnikow'

  s.requires_arc = true

  s.source_files = 'Pod'
  s.private_header_files = 'Pod/*-private.h'

  s.dependency 'libbson', '~> 1.1.0'
  s.dependency 'OrderedDictionary', '~> 1.2'
end
