//
//  JARDollar.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 26/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import "JARDollar.h"

@interface JARDollar()
@property(nonatomic) NSInteger amount;
@end

@implementation JARDollar

-(id) initWithAmount:(NSInteger) amount{
    
    if (self = [super init]){
        _amount = amount;
    }
    
    return self;
    
}

-(JARDollar*) times: (NSInteger) multiplier{
    
    JARDollar *newDollar = [[JARDollar alloc]initWithAmount:self.amount * multiplier];
    
    return newDollar;
    
}

#pragma mark - Overwritten

-(BOOL)isEqual:(id)object{
    
    return [self amount] == [object amount];
    
}

@end
