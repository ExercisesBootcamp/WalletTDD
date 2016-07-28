//
//  JARWalletTableViewController.h
//  WalletTDD
//
//  Created by Juan Arillo Ruiz on 28/7/16.
//  Copyright © 2016 Juan Arillo Ruiz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JARWallet;
@interface JARWalletTableViewController : UITableViewController


- (id) initWithModel: (JARWallet *)model;
@end
