//
//  JARWalletTableViewController.h
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 28/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JARWallet;

@class JARBroker; //

#define EUR_SEC 0 //
#define USD_SEC 1 //

@interface JARWalletTableViewController : UITableViewController


- (id) initWithModel: (JARWallet *)model;
@end
