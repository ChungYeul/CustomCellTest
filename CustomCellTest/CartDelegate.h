//
//  CartDelegate.h
//  CustomCellTest
//
//  Created by In Chung Yeul on 2014. 1. 7..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CartDelegate <NSObject>
- (void)addItem:(id)sender;

//
- (void)incQuantity:(NSString *)productCode;
- (void)decQuantity:(NSString *)productCode;
@end
