//
//  JARMoney.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 26/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import "JARMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "JARBroker.h"

@interface JARMoney()
@property (nonatomic, strong) NSNumber *amount;
@end

@implementation JARMoney

+(id) euroWithAmount:(NSInteger) amount{
    
    return [[JARMoney alloc] initWithAmount:amount currency:@"EUR"];
    
}

+(id) dollarWithAmount: (NSInteger) amount{
    
    return [[JARMoney alloc] initWithAmount:amount currency:@"USD"];
}


-(id)initWithAmount:(NSInteger) amount currency:(NSString *) currency{
    
    if(self = [super init]){
        _amount = @(amount);
        _currency = currency;
    }
    return self;
    
}

-(id<JARMoney>) times: (NSInteger) multiplier{
    
    // No se debería llamar, sino que se debería de usa el de la subclase
    
    JARMoney *newMoney = [[JARMoney alloc]initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
        
    return newMoney;
        

}

-(id<JARMoney>) plus: (JARMoney *) other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    JARMoney *total = [[JARMoney alloc] initWithAmount:totalAmount currency:self.currency];

    return total;
}

-(id<JARMoney>) reduceToCurrency:(NSString*)currency withBroker:(JARBroker*) broker{
    
    JARMoney *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency toCurrency:currency]]doubleValue];
    
    // Comprobamos que divisa de origen y destino son la misma
    if ([self.currency isEqual:currency]){
        result = self;
    } else if (rate ==0){
        // No hay tasa de conversión, excepción que te crió
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@", self.currency, currency];
    } else {
        // Tenemos conversion
        
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[JARMoney alloc] initWithAmount:newAmount currency:currency];
    }
    
    return result;
    
}

#pragma mark - Overwritten
-(NSString *)description{
    
    return [NSString stringWithFormat:@"<%@: %@ %@>",[self class],self.currency, self.amount];
    
}

-(BOOL)isEqual:(id)object{
    
    if([self.currency isEqual:[object currency]]){
        return [self amount] == [object amount];
    } else {
        return NO;
    }
    
    
}

- (NSUInteger) hash{
    
    return [self.amount integerValue];
    
}


@end
