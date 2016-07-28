//
//  JARWallet.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 27/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import "JARWallet.h"
#import "JARBroker.h"
@import UIKit;

@interface JARWallet()
@property (nonatomic, strong) NSMutableArray *moneys;
@property (nonatomic, strong) JARBroker *broker;
@end

@implementation JARWallet

-(NSUInteger) count{
    
    return [self.moneys count];
    
}

-(NSUInteger) countCurrencies{
    
    return [self.currencies count];
    
}

-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    
    if(self = [super init]){
        JARMoney *money = [[JARMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    
    return self;
    
}

-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency broker:(JARBroker *)broker {
    
    if (self = [super init]) {
        
        JARMoney *money = [[JARMoney alloc]initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
        
        _broker = broker;
    }
    
    return self;
}

-(id<JARMoney>)plus:(JARMoney *)money{
    
    [self.moneys addObject:money];
    
    return self;
    
}

-(id<JARMoney>)times:(NSInteger)multiplier{
    
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (JARMoney *each in self.moneys) {
        JARMoney *newMoney = [each times:multiplier];
        [newMoneys addObject: newMoney];
    }
    
    self.moneys = newMoneys;
    
    return self;
}

-(id<JARMoney>)reduceToCurrency:(NSString *)currency withBroker:(JARBroker *)broker{
    
    JARMoney *result = [[JARMoney alloc] initWithAmount:0 currency:currency];
    
    for (JARMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
                  
    }
    
    return result;

}

-(NSUInteger)countMoneyForCurrency:(NSUInteger)section{
    
    return [self moneysForCurrency:section].count;
    
} //

-(NSArray *)moneysForCurrency:(NSUInteger)section {
    
    if (section >= [self.currencies count]) {
        
        return @[];
    }
   
    NSMutableArray *moneys = [[NSMutableArray alloc]init];
    
    for (JARMoney *money in self.moneys) {
        if (self.currencies[section] == money.currency) {
            [moneys addObject:money];
        }
    }
    return moneys;
} //

-(JARMoney *)moneyForIndexPath:(NSIndexPath *)indexPath {
    
    // Si nos piden la seccion TOTAL
    if (indexPath.section >= [self.currencies count]) {
        
        JARMoney *total = [[JARMoney alloc] init];
        
        for (JARMoney *money in self.moneys) {
            
            total = [total plus:[money reduceToCurrency:@"EUR" withBroker:self.broker]];
        }
        
        
        return total;
    }
    NSArray *moneys = [self moneysForCurrency:indexPath.section];
    
    if (indexPath.row >= moneys.count ) {
        
        return [self subtotal:indexPath.section];
    }
    JARMoney *money = moneys[indexPath.row];
    
    return money;
}

-(JARMoney *)subtotal:(NSUInteger)forSection {
    
    //Devolvemos la suma de los elementos del array
    JARMoney *subtotal = [[JARMoney alloc]init];
    NSArray *moneys = [self moneysForCurrency:forSection];
    
    for (JARMoney *money in moneys) {
        subtotal = [subtotal plus:money];
    }
    
    return subtotal;
}

#pragma mark - Notifications

-(void)subscribeToMemoryWarning:(NSNotificationCenter *) nc{
    
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
    
}

-(void)dumpToDisk:(NSNotification *)notification{
    
    //
    
}
@end
