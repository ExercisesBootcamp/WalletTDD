//
//  JARBrokerTests.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 27/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JARMoney.h"
#import "JARBroker.h"

@interface JARBrokerTests : XCTestCase
@property (nonatomic, strong) JARBroker *emptyBroker;
@property (nonatomic, strong) JARMoney *oneDollar;
@end

@implementation JARBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.emptyBroker = [JARBroker new];
    self.oneDollar = [JARMoney dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

- (void)testSimpleReduction{
    
    
    JARMoney *sum = [[JARMoney dollarWithAmount:5]plus:[JARMoney dollarWithAmount:5]];
    
    JARMoney *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
    
}

// $10 = €5 2:1

- (void)testReduction{
    
    
    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    JARMoney *dollars = [JARMoney dollarWithAmount:10];
    JARMoney *euros = [JARMoney euroWithAmount:5];
    
    JARMoney *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"$10 == $5 2:1");
    
}

- (void)testThatNoRateRaisesException{
    
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
    
}

-(void)testThatNilConversionDoesNotChangeMoney{
    
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"], @"A nil conversion should have no effect");
    
}

@end
