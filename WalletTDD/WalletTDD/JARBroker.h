//
//  JARBroker.h
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 27/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JARMoney.h"
@interface JARBroker : NSObject


-(id<JARMoney>)reduce: (JARMoney*) money toCurrency:(NSString *)currency;
-(void)addRate: (NSInteger) rate fromCurrency:(NSString *)fromCurrency toCurrency: (NSString *)toCurrency;

@end
