//
//  Product.h
//  CustomCellTest
//
//  Created by In Chung Yeul on 2014. 1. 7..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *code;
+ (id)productWithName:(NSString *)name withPrice:(NSString *)price withImage:(NSString *)image;
+ (id)productWithName:(NSString *)name code:(NSString *)code price:(NSString *)price image:(NSString *)image;

- (BOOL)isEqualToProduct:(NSString *)productCode;
@end