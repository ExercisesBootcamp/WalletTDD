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

-(void) testCurrencies{
    
    XCTAssertEqualObjects(@"EUR", [[JARMoney euroWithAmount:1]currency], @"The currency of euros should be EUR");
    
    XCTAssertEqualObjects(@"USD", [[JARMoney dollarWithAmount:1]currency], @"The currency of dollar should be USD");
    
}

-(void)testMultiplication{
    
    JARMoney *euro = [JARMoney euroWithAmount:5];
    JARMoney *ten = [JARMoney euroWithAmount:10];
    JARMoney *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten , @"5 *2 Should be 10");
    
}

-(void)testEquality{
    
    JARMoney *five = [JARMoney euroWithAmount:5];
    JARMoney *ten = [JARMoney euroWithAmount:10];
    
    JARMoney *total = [five times:2];
    
    XCTAssertEqualObjects(total, ten, @"Equivalent objects should be equal");
    XCTAssertEqualObjects([JARMoney dollarWithAmount:4], [[JARMoney dollarWithAmount:2] times:2], @"Equivalent objects should be equal");
    
}

-(void)testDifferentCurrencies{
    
    JARMoney *euro = [JARMoney euroWithAmount:1];
    JARMoney *dollar = [JARMoney dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Different currencies should not be equal");
    
}

-(void)testHash{
    
    JARMoney *a = [JARMoney euroWithAmount:2];
    JARMoney *b = [JARMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    XCTAssertEqual([[JARMoney dollarWithAmount:1] hash], [[JARMoney dollarWithAmount:1] hash], @"Equal objects must have same hash");
    
}

-(void)testAmountStorage{
    
    JARMoney *euro = [JARMoney euroWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"The value retrieved shoud be the same as the stored");
    
    XCTAssertEqual(2, [[[JARMoney dollarWithAmount:2] performSelector:@selector(amount)]integerValue], @"The value retrieved shoud be the same as the stored");
#pragma clang diagnostic pop
    
}

-(void) testSimpleAdddition{
    XCTAssertEqualObjects([[JARMoney dollarWithAmount:5] plus:
                             [JARMoney dollarWithAmount:5]],
                             [JARMoney dollarWithAmount:10],
                             @"$5 + $5 = $10");
}

- (void)testThatHashIsAmount{
    
    JARMoney *one = [JARMoney dollarWithAmount:1];
    
    XCTAssertEqual([one hash], 1, @"The hash must be the same as amount");
    
}

-(void)testDescription{
    
    JARMoney *one = [JARMoney dollarWithAmount:1];
    NSString *desc = @"<JARMoney: USD 1>";
    
    XCTAssertEqualObjects(desc, [one description], @"Description must match the template");
    
}

@end
