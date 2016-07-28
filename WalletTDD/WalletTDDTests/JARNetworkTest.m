//
//  JARNetworkTest.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 28/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JARBroker.h"

@interface JARNetworkTest : XCTestCase

@end

@implementation JARNetworkTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testThatEmptyRatesRaisesException{
    
    JARBroker *broker = [JARBroker new];
    NSData *jsonData = nil;
    
    XCTAssertThrows([broker parseJSONRates:jsonData],@"An empty JSON should raise exception");
    
    
}

@end
