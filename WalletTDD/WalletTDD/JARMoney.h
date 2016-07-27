//
//  JARMoney.h
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 26/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JARMoney;

@protocol JARMoney <NSObject>

-(id)initWithAmount:(NSInteger) amount currency: (NSString *) currency;

-(id<JARMoney>) times: (NSInteger) multiplier;
-(id<JARMoney>) plus: (JARMoney *) other;

@end

@interface JARMoney : NSObject<JARMoney>

@property (nonatomic, strong, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount: (NSInteger) amount;

@end
