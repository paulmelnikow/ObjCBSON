//
//  ViewController.m
//  ObjCBSONSampleApp
//
//  Created by Wojciech Adam Koszek (h) on 16/04/2016.
//  Copyright © 2016 Wojciech Adam Koszek (h). All rights reserved.
//

#import "ViewController.h"
#import "ObjCBSON/BSONSerialization.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bsonExample];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)bsonExample {
    NSError *error = nil;

    // BSON encode dictionary `sampleDict` to `NSData *` instance `bsonEncodedData`
    NSDictionary *sampleDict = @{ @"sampleKey" : @"sampleValue" };
    NSData *bsonEncodedData = [BSONSerialization BSONDataWithDictionary:sampleDict error:&error];
    NSLog(@"bsonEncodedData=%@ error=%@", bsonEncodedData, [error localizedDescription]);

    // ...end perform decording from BSON back to `NSDictionary *`
    NSDictionary *bsonDict = [BSONSerialization dictionaryWithBSONData:bsonEncodedData error:&error];
    NSLog(@"bsonDict=%@, error=%@", bsonDict, [error localizedDescription]);
}

@end
