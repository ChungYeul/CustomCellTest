//
//  Cart.m
//  CustomCellTest
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import "Cart.h"
#import "Product.h"
#import "CartItem.h"

@implementation Cart
- (id)init {
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}

// 
- (void)addProduct:(Product *)item {
    CartItem *cartItem = [self cartItemWith:item.code];
    if (cartItem == nil) {
        cartItem = [[CartItem alloc] init];
        cartItem.product = item;
        cartItem.quantity = 1;
        [self.items addObject:cartItem];
    }
    else {
        [self incQuantity:item.code];
    }
}
- (void)incQuantity:(NSString *)productCoed {
    CartItem *item = [self cartItemWith:productCoed];
    item.quantity++;
    
}
- (void)decQuantity:(NSString *)productCoed {
    CartItem *item = [self cartItemWith:productCoed];
    item.quantity--;
    
    if (0 == item.quantity) {
        [self.items removeObject:item];
    }
}

- (CartItem *)cartItemWith:(NSString *)productCode {
    for (CartItem *item in self.items) {
        if ([item.product isEqualToProduct:productCode]) {
            return item;
        }
    }
    return nil;
}
@end