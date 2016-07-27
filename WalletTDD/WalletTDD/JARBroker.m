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

@property(nonatomic,strong) NSMutableDictionary *rates;
@end

@implementation JARBroker

-(id) init{
    if(self= [super init]){
        _rates = [@{}mutableCopy];
    }
    
    return self;
}

-(id<JARMoney>)reduce: (JARMoney*) money toCurrency:(NSString *)currency{
    
    JARMoney *result;
    double rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency toCurrency:currency]]doubleValue];
    
    // Comprobamos que divisa de origen y destino son la misma
    if ([money.currency isEqual:currency]){
        result = money;
    } else if (rate ==0){
        // No hay tasa de conversión, excepción que te crió
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@", money.currency, currency];
    } else {
        // Tenemos conversion
        double rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency toCurrency:currency]]doubleValue];
        
        NSInteger newAmount = [money.amount integerValue] * rate;
        
        result = [[JARMoney alloc] initWithAmount:newAmount currency:currency];
    }
    
    return result;
    
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
