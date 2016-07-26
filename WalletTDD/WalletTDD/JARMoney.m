//
//  JARMoney.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 26/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import "JARMoney.h"
#import "NSObject+GNUStepAddons.h"

@interface JARMoney()
@property (nonatomic) NSInteger amount;
@end

@implementation JARMoney

-(id)initWithAmount:(NSInteger) amount{
    
    if(self = [super init]){
        _amount = amount;
    }
    return self;
    
}

-(JARMoney *) times: (NSInteger) multiplier{
    
    // No se debería llamar, sino que se debería de usa el de la subclase
    
    return [self subclassResponsibility:_cmd];
    
}

#pragma mark - Overwritten
-(NSString *)description{
    
    return [NSString stringWithFormat:@"<%@ %ld>",[self class], [self amount]];
    
}

-(BOOL)isEqual:(id)object{
    
    return [self amount] == [object amount];
    
}

- (NSUInteger) hash{
    
    return (NSUInteger) self.amount;
    
}


@end
