//
//  Copyright 2014 Paul Melnikow
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <Foundation/Foundation.h>
#import "BSONTypes.h"

@interface BSONDocument : NSObject

/**
 Creates an empty BSON document.
 */
+ (instancetype) document;


/**
 Creates an empty BSON document with the given capacity, which must be
 smaller than INT_MAX.
 */
+ (instancetype) documentWithCapacity:(NSUInteger) bytes;


/**
 Returns a BSON document created using the given data block, which it
 retains and accesses directly.
 
 If <i>data</i> is mutable, it retains a copy instead.
 
 @param data An instance of <code>NSData</code> with the binary data for the new
 document.
 */
+ (instancetype) documentWithData:(NSData *) data;
+ (instancetype) documentWithData:(NSData *) data noCopy:(BOOL) noCopy;

- (NSString *) description;

/**
 Returns an immutable <code>NSData</code> object with a copy of the document's
 BSON data buffer.
 
 The NSData object is guaranteed to remain valid even if the receiver is deallocated.
 
 Invoking -dataValue finalizes the document. You can no longer change it.
 
 @returns An immutable <code>NSData</code> object pointing to the BSON data buffer.
 */
- (NSData *) dataValue;

/**
 Returns a deserialized dictionary for this document.
 */
- (NSDictionary *) dictionaryValueWithError:(NSError **) error;

- (instancetype) copy;

- (BOOL) isEmpty;
- (BOOL) hasField:(NSString *) key;
- (NSComparisonResult) compare:(BSONDocument *) other;
- (BOOL) isEqual:(BSONDocument *) document;

- (BOOL) appendData:(NSData *) value forKey:(NSString *) key;
- (BOOL) appendBool:(BOOL) value forKey:(NSString *) key;
- (BOOL) appendCode:(BSONCode *) value forKey:(NSString *) key;
- (BOOL) appendCodeWithScope:(BSONCodeWithScope *) value forKey:(NSString *) key;
- (BOOL) appendDatabasePointer:(BSONDatabasePointer *) value forKey:(NSString *) key;
- (BOOL) appendDouble:(double) value forKey:(NSString *) key;
- (BOOL) appendEmbeddedDocument:(BSONDocument *) value forKey:(NSString *) key;
- (BOOL) appendInt32:(int32_t) value forKey:(NSString *) key;
- (BOOL) appendInt64:(int64_t) value forKey:(NSString *) key;
- (BOOL) appendMinKeyForKey:(NSString *) key;
- (BOOL) appendMaxKeyForKey:(NSString *) key;
- (BOOL) appendNullForKey:(NSString *) key;
- (BOOL) appendObjectID:(BSONObjectID *) value forKey:(NSString *) key;
- (BOOL) appendRegularExpression:(BSONRegularExpression *) value forKey:(NSString *) key;
- (BOOL) appendString:(NSString *) value forKey:(NSString *) key;
- (BOOL) appendSymbol:(BSONSymbol *) value forKey:(NSString *) key;
- (BOOL) appendDate:(NSDate *) value forKey:(NSString *) key;
- (BOOL) appendTimestamp:(BSONTimestamp *) value forKey:(NSString *) key;
- (BOOL) appendUndefinedForKey:(NSString *) key;

+ (NSUInteger) maximumCapacity;

@end
