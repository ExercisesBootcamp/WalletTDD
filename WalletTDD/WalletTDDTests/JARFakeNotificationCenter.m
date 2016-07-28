//
//  JARFakeNotificationCenter.m
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 28/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import "JARFakeNotificationCenter.h"

@implementation JARFakeNotificationCenter

-(id)init{
    if (self = [super init]){
        _observers = [NSMutableDictionary dictionary];
    }
    
    return self;
}

-(void)addObserver:(id)observer selector:(nonnull SEL)aSelector name:(nullable NSString *)aName object:(nullable id)anObject{
    
    [self.observers setObject:observer forKey:aName];
}


@end
