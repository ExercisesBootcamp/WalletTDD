//
//  JARControllerTests.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 28/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JARSimpleViewController.h"

@interface JARControllerTests : XCTestCase
@property(nonatomic,strong) JARSimpleViewController *simpleVC;
@property(nonatomic,strong) UIButton *button;
@property(nonatomic,strong) UILabel *label;
@end

@implementation JARControllerTests

- (void)setUp {
    [super setUp];
    // Creamos el entorno de laboratorio

    self.simpleVC = [[JARSimpleViewController alloc]initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    self.simpleVC.displayLabel = self.label;
}

- (void)tearDown {
    // Lo destruimos
    [super tearDown];
    
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

-(void)testThatTextOnLabelIsEqualToTextOnButton{
    
    // Mandamos el mensaje
    [self.simpleVC displayText:self.button];
    
    // Comprobamos que etiqueta y control son el mismo texto.
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same text");
}

@end
