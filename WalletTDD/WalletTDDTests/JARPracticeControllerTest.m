//
//  JARPracticeControllerTest.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 28/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JARWallet.h"
#import "JARBroker.h"
#import "JARWalletTableViewController.h"


@interface JARPracticeControllerTest : XCTestCase

@property (strong, nonatomic)JARWalletTableViewController *walletVC;
@property (strong, nonatomic)JARWallet *wallet;
@property (strong, nonatomic)JARBroker *broker;

@end

@implementation JARPracticeControllerTest

- (void)setUp {
    [super setUp];
    
    self.broker = [JARBroker new];
    [self.broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    self.wallet = [[JARWallet alloc] initWithAmount:1 currency:@"USD" broker:self.broker];
    [self.wallet plus:[JARMoney euroWithAmount:1]];
    [self.wallet plus:[JARMoney euroWithAmount:3]];
    [self.wallet plus:[JARMoney dollarWithAmount:10]];
    
    self.walletVC = [[JARWalletTableViewController alloc] initWithModel:self.wallet];
    
    
}

- (void)tearDown {
    
    [super tearDown];
    
    self.wallet = nil;
    self.walletVC = nil;
    self.broker = nil;
}


//-(void)testThatTableHasOneSection {
//
//    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
//
//    XCTAssertEqual(sections, 1, @"Solo debe haber una seccion");
//}

// Si hay n divisas en el modelo, el dataSource devuelve n + 1 secciones
-(void)testThatNumberOfSectionsIsNumberOfCurrenciesPlusOne {
    
    NSUInteger currencies = [self.wallet countCurrencies] +1;
    
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(currencies, sections, @"Numero de secciones = divisas + 1");
    
}

// Si hay n moneys en una divisa, el data source debe de devolver n + 1 celdas para esa sección
-(void)testThatNumberOfCellsForCurrencieIsNumberOfMoneysForCurrenciePlusOne {
    
    NSUInteger numberOfMoneysForCurrency = [self.wallet countMoneyForCurrency:EUR_SEC];
    
    NSUInteger rows = [self.walletVC tableView:self.walletVC numberOfRowsInSection:EUR_SEC];
    
    XCTAssertEqual(numberOfMoneysForCurrency +1, rows, @"Numero de celdas = numero de moneys + 1");
}




@end
