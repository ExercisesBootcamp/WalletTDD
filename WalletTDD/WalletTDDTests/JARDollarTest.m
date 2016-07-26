//
//  JARDollarTest.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 26/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JARDollar.h"

@interface JARDollarTest : XCTestCase

@end

@implementation JARDollarTest

-(void)testMultiplication{
    
    JARDollar *five = [[JARDollar alloc] initWithAmount: 5];
    JARDollar *total = [five times:2];
    
    JARDollar *ten = [[JARDollar alloc] initWithAmount: 10];
    
    XCTAssertEqualObjects(ten, total, @"5$*2 = 10$");
    
}

-(void) testEquality{
    
    JARDollar *five = [[JARDollar alloc] initWithAmount:5];
    JARDollar *total = [five times:2];
    JARDollar *ten = [[JARDollar alloc]initWithAmount:10];
    
    XCTAssertEqualObjects(total, ten, @"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five], @"Non Equivalent objects should not be equal");
    
}

-(void)testHash{
    
    JARDollar *a = [[JARDollar alloc] initWithAmount:2];
    JARDollar *b = [[JARDollar alloc] initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    
}

@end
