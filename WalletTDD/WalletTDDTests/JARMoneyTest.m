//
//  JARMoneyTest.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 26/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JARMoney.h"

@interface JARMoneyTest : XCTestCase

@end

@implementation JARMoneyTest

-(void)testThatTimesRaisesException{
    
    JARMoney *money = [[JARMoney alloc] initWithAmount:1];
    XCTAssertThrows([money times:2], @"Should raise an exception");
    
}

@end
