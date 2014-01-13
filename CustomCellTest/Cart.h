//
//  Cart.h
//  CustomCellTest
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Product;
@class CartItem;

@interface Cart : NSObject
+ (Cart *)defaultCart;
- (NSInteger)numberOfItems;
-(CartItem *)cartItemAtIndex:(NSInteger)index;
- (void)addProduct:(Product *)item;
- (void)incQuantity:(NSString *)productCoed;
- (void)decQuantity:(NSString *)productCoed;
- (CartItem *)cartItemWith:(NSString *)productCode;
@property NSMutableArray *items;
@end
