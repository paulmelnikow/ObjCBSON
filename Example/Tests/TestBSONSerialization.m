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

#import "BSONSerialization.h"

SpecBegin(BSONSerialization)

describe(@"BSONSerialization", ^{
    
    sharedExamplesFor(@"serializes and deserializes", ^(NSDictionary *data) {
        
        id obj = data[@"object"];
        
        it(@"should serialize and deserialize", ^{
            
            NSError *error = nil;
            NSData *data = [BSONSerialization BSONDataWithDictionary:obj error:&error];
            
            // Sanity
            expect(data).notTo.beNil();
            expect(error).to.beNil();
            
            NSDictionary *result = [BSONSerialization dictionaryWithBSONData:data error:&error];
            
            // Sanity
            expect(data).notTo.beNil();
            expect(error).to.beNil();
            
            expect(result).to.equal(obj);
            
        });
        
    });
    
    itShouldBehaveLike(@"serializes and deserializes",
        @{
            @"object": @{
                @"one": @1,
                @"two": @(2.0f),
                @"three": @"3",
                @"five": @YES,
            },
        });
    
    itShouldBehaveLike(@"serializes and deserializes",
        @{
            @"object": @{
                @"four": @[ @"zero", @"one", @"two", @"three" ],
            },
        });

    itShouldBehaveLike(@"serializes and deserializes",
        @{
            @"object": @{
                @"one": @1,
                @"two": @(2.0f),
                @"three": @"3",
                @"five": @YES,
            },
        });
    
    sharedExamplesFor(@"serializes and deserializes value", ^(NSDictionary *data) {
        
        id value = data[@"value"];
        
        it(@"should serialize and deserialize", ^{
            
            NSDictionary *obj = @{@"testKey": value};
            
            NSError *error = nil;
            NSData *data = [BSONSerialization BSONDataWithDictionary:obj error:&error];
            
            // Sanity
            expect(data).notTo.beNil();
            expect(error).to.beNil();
            
            NSDictionary *result = [BSONSerialization dictionaryWithBSONData:data error:&error];
            
            // Sanity
            expect(data).notTo.beNil();
            expect(error).to.beNil();
            
            expect([result objectForKey:@"testKey"]).to.equal(value);
            
        });
        
    });
    
    itShouldBehaveLike(@"serializes and deserializes value",
        @{
            @"value": @"test string",
        });

    sharedExamplesFor(@"serializes and deserializes number", ^(NSDictionary *data) {
        
        id number = data[@"number"];
        NSString *inType = data[@"inType"];
        NSString *outType = data[@"outType"];
        
        it(@"should serialize and deserialize", ^{
            
            expect(number).to.haveObjCType([inType UTF8String]);
            
            NSDictionary *obj = @{@"testKey": number};
            
            NSError *error = nil;
            NSData *data = [BSONSerialization BSONDataWithDictionary:obj error:&error];
            
            // Sanity
            expect(data).notTo.beNil();
            expect(error).to.beNil();
            
            NSDictionary *result = [BSONSerialization dictionaryWithBSONData:data error:&error];
            
            // Sanity
            expect(data).notTo.beNil();
            expect(error).to.beNil();
            
            NSNumber *resultNumber = [result objectForKey:@"testKey"];
            
            expect(resultNumber).to.equal(number);
            expect(resultNumber).to.haveObjCType([outType UTF8String]);
            
        });
        
    });
    
    describe(@"booleans", ^{
    
        itShouldBehaveLike(@"serializes and deserializes number",
                           @{
                             @"number": @YES,
                             @"inType": @"c",
                             @"outType": @"c",
                             });
        
        itShouldBehaveLike(@"serializes and deserializes number",
                           @{
                             @"number": (id)kCFBooleanTrue,
                             @"inType": @"c",
                             @"outType": @"c",
                             });
        
    });
    
    describe(@"numberWithChar", ^{
    
        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithChar:-42],
                @"inType": @"c",
                @"outType": @"i",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithChar:CHAR_MIN],
                @"inType": @"c",
                @"outType": @"i",
            });
        
        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithChar:CHAR_MAX],
                @"inType": @"c",
                @"outType": @"i",
            });
    });
    
    describe(@"numberWithDouble", ^{

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithDouble:-42.5],
                @"inType": @"d",
                @"outType": @"d",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithDouble:DBL_MIN],
                @"inType": @"d",
                @"outType": @"d",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithDouble:DBL_MAX],
                @"inType": @"d",
                @"outType": @"d",
            });
        
    });
    
    describe(@"numberWithFloat", ^{

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithFloat:-42.5],
                @"inType": @"f",
                @"outType": @"d",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithFloat:FLT_MIN],
                @"inType": @"f",
                @"outType": @"d",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithFloat:FLT_MAX],
                @"inType": @"f",
                @"outType": @"d",
            });
        
    });
    
    describe(@"numberWithInt", ^{

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithInt:-42],
                @"inType": @"i",
                @"outType": @"i",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithInt:INT_MAX],
                @"inType": @"i",
                @"outType": @"i",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithInt:INT_MIN],
                @"inType": @"i",
                @"outType": @"i",
            });
        
    });
    
    describe(@"numberWithInteger", ^{

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithInteger:42],
                @"inType": @"q", // "q" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithInteger:NSIntegerMax],
                @"inType": @"q", // "q" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithInteger:NSIntegerMin],
                @"inType": @"q", // "q" == long
                @"outType": @"q",
            });
        
    });
    
    describe(@"numberWithLong", ^{

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithLong:42],
                @"inType": @"q", // "q" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithLong:LONG_MAX],
                @"inType": @"q", // "q" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithLong:LONG_MIN],
                @"inType": @"q", // "q" == long
                @"outType": @"q",
            });
    
    });
    
    describe(@"numberWithLongLong", ^{

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithLongLong:42],
                @"inType": @"q", // "q" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithLongLong:LONG_LONG_MAX],
                @"inType": @"q", // "q" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithLongLong:LONG_LONG_MIN],
                @"inType": @"q", // "q" == long
                @"outType": @"q",
            });
    
    });
    
    describe(@"numberWithShort", ^{

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithShort:42],
                @"inType": @"s", // "s" == short
                @"outType": @"i",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithShort:SHRT_MAX],
                @"inType": @"s", // "s" == short
                @"outType": @"i",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithShort:SHRT_MIN],
                @"inType": @"s", // "s" == short
                @"outType": @"i",
            });
    
    });
    
    describe(@"numberWithUnsignedChar", ^{

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedChar:42],
                @"inType": @"s", // "s" == short
                @"outType": @"i",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedChar:UCHAR_MAX],
                @"inType": @"s", // "s" == short
                @"outType": @"i",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedChar:0],
                @"inType": @"s", // "s" == short
                @"outType": @"i",
            });
    
    });
    
    describe(@"numberWithUnsignedInt", ^{

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedInt:42],
                @"inType": @"q", // "q" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedInt:UINT_MAX],
                @"inType": @"q", // "q" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedInt:0],
                @"inType": @"q", // "q" == long
                @"outType": @"q",
            });
        
    });

    sharedExamplesFor(@"overflow BSON signed capacity", ^(NSDictionary *data) {
        
        NSNumber *number = data[@"number"];
        
        it(@"should overflow", ^{
            
            NSDictionary *obj = @{@"testKey": number};
            
            NSError *error = nil;
            NSData *data = [BSONSerialization BSONDataWithDictionary:obj error:&error];
            
            expect(data).to.beNil();
            expect([error localizedDescription]).to.equal(@"Unsigned integer value overflows BSON signed integer capacity");
            
        });
        
    });
    
    describe(@"numberWithUnsignedInteger", ^{

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedInteger:42],
                @"inType": @"q", // "s" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedInteger:NSIntegerMax],
                @"inType": @"q", // "s" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedInteger:0],
                @"inType": @"q", // "s" == long
                @"outType": @"q",
            });
        
        itShouldBehaveLike(@"overflow BSON signed capacity",
            @{
                @"number": [NSNumber numberWithUnsignedInteger:NSIntegerMax + 1],
            });
        
    });
    
    describe(@"numberWithUnsignedLong", ^{

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedLong:42],
                @"inType": @"q", // "s" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedLong:LONG_MAX],
                @"inType": @"q", // "s" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedLong:0],
                @"inType": @"q", // "s" == long
                @"outType": @"q",
            });
        
        itShouldBehaveLike(@"overflow BSON signed capacity",
            @{
                @"number": [NSNumber numberWithUnsignedLong:LONG_MAX + 1],
            });
        
    });
    
    describe(@"numberWithUnsignedLongLong", ^{

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedLongLong:42],
                @"inType": @"q", // "s" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedLongLong:LONG_LONG_MAX],
                @"inType": @"q", // "s" == long
                @"outType": @"q",
            });

        itShouldBehaveLike(@"serializes and deserializes number",
            @{
                @"number": [NSNumber numberWithUnsignedLongLong:0],
                @"inType": @"q", // "s" == long
                @"outType": @"q",
            });
        
        itShouldBehaveLike(@"overflow BSON signed capacity",
            @{
                @"number": [NSNumber numberWithUnsignedLongLong:LONG_LONG_MAX + 1],
            });
        
    });

    describe(@"numberWithUnsignedShort", ^{
        
        itShouldBehaveLike(@"serializes and deserializes number",
                           @{
                             @"number": [NSNumber numberWithUnsignedShort:42],
                             @"inType": @"i",
                             @"outType": @"i",
                             });
        
        itShouldBehaveLike(@"serializes and deserializes number",
                           @{
                             @"number": [NSNumber numberWithUnsignedShort:USHRT_MAX],
                             @"inType": @"i",
                             @"outType": @"i",
                             });
        
        itShouldBehaveLike(@"serializes and deserializes number",
                           @{
                             @"number": [NSNumber numberWithUnsignedShort:0],
                             @"inType": @"i",
                             @"outType": @"i",
                             });
        
    });

});

SpecEnd
