//
//  JAREuro.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 25/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import "JAREuro.h"

@interface JAREuro()
@property(nonatomic) NSInteger amount;
@end

@implementation JAREuro

-(id) initWithAmount:(NSInteger) amount{
    
    if (self = [super init]){
        _amount = amount;
    }
    
    return self;
    
}

-(void) times: (NSInteger) multiplier{
    
    self.amount *= multiplier;
    
}

@end
