//
//  JAREuro.h
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 25/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JAREuro : NSObject

@property (nonatomic, readonly) NSInteger amount;

-(id) initWithAmount:(NSInteger) amount;

-(void) times: (NSInteger) multiplier;

@end
