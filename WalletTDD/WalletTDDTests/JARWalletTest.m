//
//  JARWalletTest.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 27/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JARMoney.h"
#import "JARBroker.h"
#import "JARWallet.h"

@interface JARWalletTest : XCTestCase

@end

@implementation JARWalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// €40 + $20 = $100 2:1
-(void)testAdditionWithReduction{
    
    JARBroker *broker = [JARBroker new];
    [broker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    JARWallet *wallet = [[JARWallet alloc] initWithAmount: 40 currency:@"EUR"];
    [wallet plus:[JARMoney dollarWithAmount: 20]];
    
    JARMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [JARMoney dollarWithAmount:100], @"€40 + $20 = $100 2:1");
    
}

@end
