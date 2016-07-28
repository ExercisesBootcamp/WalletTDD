//
//  JARFakeNotificationCenter.h
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 28/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JARFakeNotificationCenter : NSObject
@property(nonatomic,strong) NSMutableDictionary *observers;

-(void)addObserver:(id)observer selector:(nonnull SEL)aSelector name:(nullable NSString *)aName object:(nullable id)anObject;
@end
