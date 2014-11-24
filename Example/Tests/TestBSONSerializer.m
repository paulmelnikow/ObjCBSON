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

#import "BSONSerializer.h"

SpecBegin(BSONSerializer)

describe(@"BSONDocument", ^{
    
    __block BSONSerializer *serializer = nil;
    
    beforeEach(^{
        serializer = [BSONSerializer serializer];
    });
    
    sharedExamplesFor(@"serialize value", ^(NSDictionary *data) {
        
        id value = data[@"value"];
        
        it(@"should serialize", ^{
            
            NSError *error = nil;
            BOOL success = [serializer appendObject:value forKey:@"testKey" error:&error];
            
            expect(success).to.beTruthy();
            expect(error).to.beNil();
            
        });
        
    });
    
    itShouldBehaveLike(@"serialize value", @{@"value": @"test string"});
    itShouldBehaveLike(@"serialize value", @{@"value": [NSDate date]});
    itShouldBehaveLike(@"serialize value", @{@"value": [NSData data]});
    itShouldBehaveLike(@"serialize value", @{@"value": [NSNumber numberWithBool:YES]});
    itShouldBehaveLike(@"serialize value", @{@"value": [NSNumber numberWithDouble:2.5]});
    itShouldBehaveLike(@"serialize value", @{@"value": [NSNumber numberWithInt:42]});
    itShouldBehaveLike(@"serialize value", @{@"value": [NSNumber numberWithInteger:42]});
    
});

SpecEnd
