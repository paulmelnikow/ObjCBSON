//
//  TestBSONDocument.m
//  libbson
//
//  Created by Paul Melnikow on 3/29/14.
//  Copyright (c) 2014 Paul Melnikow. All rights reserved.
//

#import "BSONDocument.h"
#import "BSONTypes.h"

SpecBegin(BSONDocument)

describe(@"BSONDocument", ^{
    
    __block BSONDocument *document = nil;
     
    beforeEach(^{
        document = [BSONDocument document];
    });
    
    describe(@"appending Objective-C types", ^{
    
        it(@"should append bool values", ^{
            [document appendBool:YES forKey:@"testKey"];
            [document appendBool:NO forKey:@"testKey"];
        });

        it(@"should append double values", ^{
            [document appendDouble:0 forKey:@"testKey"];
            [document appendDouble:2.5f forKey:@"testKey"];
        });

        it(@"should append int32 values", ^{
            [document appendInt32:0 forKey:@"testKey"];
            [document appendInt32:42 forKey:@"testKey"];
        });
        
        it(@"should append int64 values", ^{
            [document appendInt32:0 forKey:@"testKey"];
            [document appendInt32:42 forKey:@"testKey"];
        });

        describe(@"appendString", ^{
            
            it(@"should append non-nil NSString", ^{
                [document appendString:@"test value" forKey:@"testKey"];
                [document appendString:@"" forKey:@"testKey"];
            });
            
            it(@"should raise exception on nil", ^{
                expect(^{
                    [document appendString:nil forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });
            
        });
        
        describe(@"NSData", ^{
            
            it(@"should append non-nil NSData", ^{
                [document appendData:[NSData data] forKey:@"testKey"];
            });
            
            it(@"should raise exception on nil", ^{
                expect(^{
                    [document appendData:nil forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });
            
        });

        describe(@"appendDate", ^{
            
            it(@"should append non-nil NSDate", ^{
                [document appendDate:[NSDate date] forKey:@"testKey"];
            });
            
            it(@"should raise exception on nil", ^{
                expect(^{
                    [document appendDate:nil forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });
            
        });
        
    });
    
    describe(@"appending BSON types", ^{
        
        describe(@"regex", ^{

            it(@"should raise exception on nil", ^{
                expect(^{
                    [document appendRegularExpression:nil forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });

            it(@"should raise exception on nil pattern", ^{
                BSONRegularExpression *regex = [[BSONRegularExpression alloc] init];
                
                expect(^{
                    [document appendRegularExpression:regex forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });

            it(@"should raise exception with options and nil pattern", ^{
                BSONRegularExpression *regex = [[BSONRegularExpression alloc] init];
                regex.options = @"i";
                
                expect(^{
                    [document appendRegularExpression:regex forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });
            
            it(@"should append regex with pattern", ^{
                BSONRegularExpression *regex = [[BSONRegularExpression alloc] init];
                regex.options = @"i";
                regex.pattern = @"text";
                
                [document appendRegularExpression:regex forKey:@"testKey"];
            });
            
        });

        describe(@"code", ^{
            
            it(@"should raise exception on nil", ^{
                expect(^{
                    [document appendCode:nil forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });
            
            it(@"should raise exception on nil code", ^{
                BSONCode *code = [[BSONCode alloc] init];
                
                expect(^{
                    [document appendCode:code forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });
            
            it(@"should append with code", ^{
                BSONCode *code = [[BSONCode alloc] init];
                code.code = @"here's some code";
                
                [document appendCode:code forKey:@"testKey"];
            });

        });

        describe(@"codewithscope", ^{
            
            it(@"should raise exception on nil", ^{
                expect(^{
                    [document appendCodeWithScope:nil forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });
            
            it(@"should raise exception on nil code", ^{
                BSONCodeWithScope *codeWithScope = [[BSONCodeWithScope alloc] init];
                codeWithScope.scope = [BSONDocument document];
                
                expect(^{
                    [document appendCodeWithScope:codeWithScope forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });
            
            it(@"should raise exception on nil scope", ^{
                BSONCodeWithScope *codeWithScope = [[BSONCodeWithScope alloc] init];
                codeWithScope.code = @"here's some code";
                
                expect(^{
                    [document appendCodeWithScope:codeWithScope forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });

            it(@"should append with code and scope", ^{
                BSONCodeWithScope *codeWithScope = [[BSONCodeWithScope alloc] init];
                codeWithScope.code = @"here's some code";
                codeWithScope.scope = [BSONDocument document];
                
                [document appendCodeWithScope:codeWithScope forKey:@"testKey"];
            });
            
        });
        
        describe(@"dbref", ^{
            
            it(@"should raise exception on nil", ^{
                expect(^{
                    [document appendDatabasePointer:nil forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });

            it(@"should raise exception on nil objectid", ^{
                BSONDatabasePointer *dbPointer = [[BSONDatabasePointer alloc] init];
                dbPointer.collection = @"ponies";
                
                expect(^{
                    [document appendDatabasePointer:dbPointer forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });
            
            it(@"should raise exception on nil collection", ^{
                BSONDatabasePointer *dbPointer = [[BSONDatabasePointer alloc] init];
                dbPointer.objectID = [BSONObjectID objectID];
                
                expect(^{
                    [document appendDatabasePointer:dbPointer forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });

            it(@"should append with collection and objectid", ^{
                BSONDatabasePointer *dbPointer = [[BSONDatabasePointer alloc] init];
                dbPointer.collection = @"ponies";
                dbPointer.objectID = [BSONObjectID objectID];
                
                [document appendDatabasePointer:dbPointer forKey:@"testKey"];
            });
            
        });
        
        describe(@"objectid", ^{
            
            it(@"should raise exception on nil", ^{
                expect(^{
                    [document appendObjectID:nil forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });

            it(@"should append non-nil objectid", ^{
                [document appendObjectID:[BSONObjectID objectID] forKey:@"testKey"];
            });

        });
        
        describe(@"symbol", ^{
            
            it(@"should raise exception on nil", ^{
                expect(^{
                    [document appendSymbol:nil forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });
            
            it(@"should raise exception on nil symbol", ^{
                BSONSymbol *symbol = [[BSONSymbol alloc] init];
                
                expect(^{
                    [document appendSymbol:symbol forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });
            
            it(@"should append with symbol", ^{
                BSONSymbol *symbol = [[BSONSymbol alloc] init];
                symbol.symbol = @"example_symbol";
                
                [document appendSymbol:symbol forKey:@"testKey"];
            });
            
        });
        
        describe(@"timestamp", ^{
            
            it(@"should raise exception on nil", ^{
                expect(^{
                    [document appendTimestamp:nil forKey:@"testKey"];
                }).to.raise(@"NSInvalidArgumentException");
            });
            
            it(@"should append non-nil timestamp", ^{
                [document appendTimestamp:[[BSONTimestamp alloc] init] forKey:@"testKey"];
            });
            
        });

        it(@"should append minkey", ^{
            [document appendMinKeyForKey:@"testKey"];
        });

        it(@"should append maxkey", ^{
            [document appendMaxKeyForKey:@"testKey"];
        });

        it(@"should append null", ^{
            [document appendNullForKey:@"testKey"];
        });

        it(@"should append undefined", ^{
            [document appendUndefinedForKey:@"testKey"];
        });

    });
    
    describe(@"appending embedded document", ^{
        
        it(@"should raise exception on nil", ^{
            expect(^{
                [document appendEmbeddedDocument:nil forKey:@"testKey"];
            }).to.raise(@"NSInvalidArgumentException");
        });
        
        it(@"should append non-nil document", ^{
            [document appendEmbeddedDocument:[BSONDocument document] forKey:@"testKey"];
        });
        
    });
    
    describe(@"appending wrong object types", ^{
        
        expect(^{
            [document appendString:(id) @42 forKey:@"testKey"];
        }).to.raise(@"NSInvalidArgumentException");

        expect(^{
            [document appendData:(id) @"a string" forKey:@"testKey"];
        }).to.raise(@"NSInvalidArgumentException");

        expect(^{
            [document appendCode:(id) @"a string" forKey:@"testKey"];
        }).to.raise(@"NSInvalidArgumentException");

        expect(^{
            [document appendCodeWithScope:(id) @"a string" forKey:@"testKey"];
        }).to.raise(@"NSInvalidArgumentException");

        expect(^{
            [document appendDatabasePointer:(id) @"a string" forKey:@"testKey"];
        }).to.raise(@"NSInvalidArgumentException");

        expect(^{
            [document appendEmbeddedDocument:(id) @"a string" forKey:@"testKey"];
        }).to.raise(@"NSInvalidArgumentException");

        expect(^{
            [document appendObjectID:(id) @"a string" forKey:@"testKey"];
        }).to.raise(@"NSInvalidArgumentException");

        expect(^{
            [document appendRegularExpression:(id) @"a string" forKey:@"testKey"];
        }).to.raise(@"NSInvalidArgumentException");

        expect(^{
            [document appendSymbol:(id) @"a string" forKey:@"testKey"];
        }).to.raise(@"NSInvalidArgumentException");

        expect(^{
            [document appendDate:(id) @"a string" forKey:@"testKey"];
        }).to.raise(@"NSInvalidArgumentException");

        expect(^{
            [document appendTimestamp:(id) @"a string" forKey:@"testKey"];
        }).to.raise(@"NSInvalidArgumentException");

    });

    describe(@"isEmpty", ^{
        
        it(@"should return true for empty document", ^{
            expect([[BSONDocument document] isEmpty]).to.beTruthy();
        });
        
        it(@"should return false for non-empty document", ^{
            BSONDocument *document = [BSONDocument document];
            [document appendString:@"test string" forKey:@"testKey"];
            
            expect([document isEmpty]).to.beFalsy();
        });
        
    });
    
    describe(@"hasField", ^{

        it(@"should return false for a key that's not present", ^{
            expect([document hasField:@"testKey"]).to.beFalsy();
            expect([document hasField:@"bogusKey"]).to.beFalsy();
        });
        
        it(@"should return true for a key that's present", ^{
            [document appendString:@"a" forKey:@"testKey"];
            
            expect([document hasField:@"testKey"]).to.beTruthy();
            expect([document hasField:@"bogusKey"]).to.beFalsy();
        });
        
    });
    
    describe(@"compare", ^{
        
        BSONDocument *a1 = [BSONDocument document];
        [a1 appendString:@"a" forKey:@"testKey"];
        
        BSONDocument *a2 = [BSONDocument document];
        [a2 appendString:@"a" forKey:@"testKey"];
        
        BSONDocument *b = [BSONDocument document];
        [b appendString:@"b" forKey:@"testKey"];
        
        expect([a1 compare:a2]).to.equal(NSOrderedSame);
        expect([a2 compare:a1]).to.equal(NSOrderedSame);
        expect([a2 compare:b]).to.equal(NSOrderedAscending);
        expect([b compare:a2]).to.equal(NSOrderedDescending);
        
    });
    
});

SpecEnd
