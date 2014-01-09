//
//  CartCell.h
//  CustomCellTest
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartDelegate.h"
@class Product;
@class CartItem;
@interface CartCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cartName;
@property (weak, nonatomic) IBOutlet UILabel *cartQuantity;
@property (weak)id<CartDelegate> delegate;
@property (copy, nonatomic) NSString *productCode;
- (void)setCartItem:(CartItem *)item;
@end
