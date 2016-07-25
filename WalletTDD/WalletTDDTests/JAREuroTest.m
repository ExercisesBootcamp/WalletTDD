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
    [euro times:2];
    
    XCTAssertEqual(euro.amount, 10, @"5*2 should be 10");
    
}

@end
