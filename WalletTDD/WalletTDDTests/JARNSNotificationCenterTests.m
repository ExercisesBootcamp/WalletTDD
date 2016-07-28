//
//  JARNSNotificationCenterTests.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 28/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JARWallet.h"
#import "JARFakeNotificationCenter.h"

@interface JARNSNotificationCenterTests : XCTestCase

@end

@implementation JARNSNotificationCenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testThatSubscribesToMemoryWarning{
    
    JARFakeNotificationCenter *fake = [JARFakeNotificationCenter new];
    
    JARWallet *w = [JARWallet new];
    
    [w subscribeToMemoryWarning:(NSNotificationCenter*)fake];
    
    NSDictionary *obs = [fake observers];
    
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, w, @"fake object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
    
    
    
}

@end
