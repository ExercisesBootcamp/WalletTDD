//
//  JARBroker.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 27/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import "JARBroker.h"
#import "JARMoney.h"

@interface JARBroker()


@end

@implementation JARBroker

-(id) init{
    if(self= [super init]){
        _rates = [@{}mutableCopy];
    }
    
    return self;
}

-(id<JARMoney>)reduce: (JARMoney*) money toCurrency:(NSString *)currency{
    
    // Double Dispatch
    return [money reduceToCurrency:currency withBroker:self];
   
    
}

-(void)addRate: (NSInteger) rate
  fromCurrency:(NSString *)fromCurrency
    toCurrency: (NSString *)toCurrency{
    
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    
    [self.rates setObject:@(1.0/rate) forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
    
}

#pragma mark - utils

-(NSString *) keyFromCurrency:(NSString *)fromCurrency toCurrency: (NSString *)toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
    
}

@end
