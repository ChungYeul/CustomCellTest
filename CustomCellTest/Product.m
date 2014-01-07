//
//  Product.m
//  CustomCellTest
//
//  Created by In Chung Yeul on 2014. 1. 7..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import "Product.h"

@implementation Product

+ (id)product:(NSString *)name price:(NSString *)price image:(NSString *)image {
    Product *item = [[Product alloc] init];
    item.name = name;
    item.price = price;
    item.imageName = image;
    return item;
}
@end
