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
