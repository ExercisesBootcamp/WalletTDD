//
//  JARWallet.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 27/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import "JARWallet.h"


@interface JARWallet()
@property (nonatomic, strong) NSMutableArray *moneys;
@end

@implementation JARWallet

-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    
    if(self = [super init]){
        JARMoney *money = [[JARMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    
    return self;
    
}

-(id<JARMoney>)plus:(JARMoney *)money{
    
    [self.moneys addObject:money];
    
    return self;
    
}

-(id<JARMoney>)times:(NSInteger)multiplier{
    
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (JARMoney *each in self.moneys) {
        JARMoney *newMoney = [each times:multiplier];
        [newMoneys addObject: newMoney];
    }
    
    self.moneys = newMoneys;
    
    return self;
}

@end
