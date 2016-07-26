//
//  JARDollar.h
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 26/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JARMoney.h"

@interface JARDollar : JARMoney

-(JARDollar*) times: (NSInteger) multiplier;

@end
