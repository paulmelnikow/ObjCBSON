//
//  EqualCString.m
//  ObjCBSON-experimental
//
//  Created by Paul Melnikow on 11/23/14.
//  Copyright (c) 2014 Paul Melnikow. All rights reserved.
//

#import "EXPMatchers+haveObjCType.h"

EXPMatcherImplementationBegin(haveObjCType, (const char * expected)) {
    BOOL actualIsNil = (actual == nil);
    BOOL actualRespondsToObjCType = [actual respondsToSelector:@selector(objCType)];
    BOOL expectedIsNull = (expected == NULL);
    
    prerequisite(^BOOL {
        return !actualIsNil && actualRespondsToObjCType && !expectedIsNull;
    });
    
    match(^ BOOL {
        return 0 == strcmp([(NSNumber *) actual objCType], expected);
    });
    
    failureMessageForTo(^ NSString * {
        if (actualIsNil)
            return @"the actual value is nil/null";
        if (!actualRespondsToObjCType)
            return @"the actual value does not respond to -objCType";
        if (expectedIsNull)
            return @"the expected value is null";
        
        return [NSString
                stringWithFormat:@"expected: %s, got: %s",
                expected, [actual objCType]];
    });
    
    failureMessageForNotTo(^ NSString * {
        return [NSString
                stringWithFormat:@"expected: not %s, got: %s",
                expected, [actual objCType]];
    });
}

EXPMatcherImplementationEnd
