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

#import "ObjCBSON.h"

NSString * const BSONErrorDomain = @"BSONErrorDomain";
//NSInteger const BSONKeyNameErrorStartsWithDollar = 101;
//NSInteger const BSONKeyNameErrorHasDot = 102;
NSInteger const BSONDocumentOverflow = -1;
NSInteger const BSONIntegerOverflow = -2;
NSInteger const BSONIsCorrupt = -3;
NSInteger const BSONSerializationUnsupportedClass = -3;
NSInteger const BSONDocumentInitializationError = -4;