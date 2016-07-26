//
//  JAREuro.h
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 25/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JARMoney.h"

@interface JAREuro : JARMoney


-(JAREuro*) times: (NSInteger) multiplier;

@end
