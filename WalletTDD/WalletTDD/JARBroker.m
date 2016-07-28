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

#pragma mark - Rates

-(void) parseJSONRates: (NSData *) json{
    
    NSError *err = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:json
                                             options:NSJSONReadingAllowFragments
                                               error:&err];
    
    if(obj != nil) {
        
        // Pillamos los rates y los vamos añadiendo al broker
        
    } else {
        // No hemos recibido nada: la cagamos
        [NSException raise:@"NoRatesInJSONException"
                    format: @"JSON must carry some data"];
        
    }
    
}


@end
