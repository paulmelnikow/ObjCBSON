//
//  TestBSONSerializer.m
//  libbson
//
//  Created by Paul Melnikow on 3/30/14.
//  Copyright (c) 2014 Paul Melnikow. All rights reserved.
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
