//
//  CartItem.h
//  CustomCellTest
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Product;
@interface CartItem : NSObject

@property (weak, nonatomic) Product *product;
@property (nonatomic) int quantity;
@end
