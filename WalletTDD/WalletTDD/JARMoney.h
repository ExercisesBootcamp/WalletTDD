//
//  JARMoney.h
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 26/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JARMoney : NSObject

-(id)initWithAmount:(NSInteger) amount;

-(JARMoney *) times: (NSInteger) multiplier;

@end
