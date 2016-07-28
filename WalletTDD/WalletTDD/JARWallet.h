//
//  JARWallet.h
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 27/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JARMoney.h"

@interface JARWallet : NSObject<JARMoney>

@property(nonatomic, readonly) NSUInteger count;

@property(nonatomic, readonly) NSArray *currencies; //
@property(nonatomic, readonly) NSUInteger countCurrencies; //


-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency broker:(JARBroker *)broker;


-(void)subscribeToMemoryWarning:(NSNotificationCenter *) nc;
-(NSUInteger)countMoneyForCurrency:(NSUInteger)section;
-(JARMoney *)moneyForIndexPath:(NSIndexPath *)indexPath;

@end
