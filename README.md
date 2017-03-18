ObjCBSON
========

High-performance BSON serialization and deserialization in Objective-C.


[![CI Status](http://img.shields.io/travis/paulmelnikow/ObjCBSON.svg?style=flat)](https://travis-ci.org/paulmelnikow/ObjCBSON)
[![Version](https://img.shields.io/cocoapods/v/ObjCBSON.svg?style=flat)](http://cocoadocs.org/docsets/ObjCBSON)
[![License](https://img.shields.io/cocoapods/l/ObjCBSON.svg?style=flat)](http://cocoadocs.org/docsets/ObjCBSON)
[![Platform](https://img.shields.io/cocoapods/p/ObjCBSON.svg?style=flat)](http://cocoadocs.org/docsets/ObjCBSON)


Installation
------------

ObjCBSON is available through [CocoaPods][]. It depends on [libbson][], which
is installed automatically, however two of its build dependences are not.

First, install those:

```sh
brew install automake libtool
```

Then, add the following line to your Podfile:

```rb
pod 'ObjCBSON'
```

[cocoapods]: http://cocoapods.org/pods/ObjCBSON
[libbson]: http://cocoapods.org/pods/libbson


Example
-------

```objc
#import "BSONSerialization.h"


- (void) bsonExample {
    NSError *error = nil;

    // BSON encode dictionary `sampleDict` to `NSData *` instance `bsonEncodedData`
    NSDictionary *sampleDict = @{ @"sampleKey" : @"sampleValue" };
    NSData *bsonEncodedData = [BSONSerialization BSONDataWithDictionary:sampleDict error:&error];
    NSLog(@"bsonEncodedData=%@ error=%@", bsonEncodedData, [error localizedDescription]);

    // ...end perform decording from BSON back to `NSDictionary *`
    NSDictionary *bsonDict = [BSONSerialization dictionaryWithBSONData:bsonEncodedData error:&error];
    NSLog(@"bsonDict=%@, error=%@", bsonDict, [error localizedDescription]);
}
```

Development
-----------

To develop on the library and run the unit tests, clone the repo, run `pod install`
from the Example directory, and open the xcworkspace.


Contribute
----------

- Issue Tracker: https://github.com/paulmelnikow/ObjCBSON/issues
- Source Code: https://github.com/paulmelnikow/ObjCBSON


License
-------

The project is licensed under the Apache 2.0 license.

