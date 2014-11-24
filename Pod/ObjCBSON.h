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

FOUNDATION_EXPORT NSString * const BSONErrorDomain;
FOUNDATION_EXPORT NSInteger const BSONKeyNameErrorStartsWithDollar;
FOUNDATION_EXPORT NSInteger const BSONKeyNameErrorHasDot;
FOUNDATION_EXPORT NSInteger const BSONDocumentOverflow;
FOUNDATION_EXPORT NSInteger const BSONIntegerOverflow;
FOUNDATION_EXPORT NSInteger const BSONIsCorrupt;
FOUNDATION_EXPORT NSInteger const BSONSerializationUnsupportedClass;
FOUNDATION_EXPORT NSInteger const BSONDocumentInitializationError;