//
//  JAREuroTest.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 25/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JAREuro.h"

@interface JAREuroTest : XCTestCase

@end

@implementation JAREuroTest

-(void)testMultiplication{

    JAREuro *euro = [[JAREuro alloc] initWithAmount:5];
    JAREuro *ten = [[JAREuro alloc]initWithAmount:10];
    JAREuro *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten , @"5 *2 Should be 10");
    
}

-(void)testEquality{

    JAREuro *five = [[JAREuro alloc] initWithAmount:5];
    JAREuro *ten = [[JAREuro alloc] initWithAmount:10];
    
    JAREuro *total = [five times:2];
    
    XCTAssertEqualObjects(total, ten, @"Equivalent objects should be equal");
    
}

@end
