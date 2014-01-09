//
//  Catalog.h
//  CustomCellTest
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Catalog : NSObject
+ (id)defaultCatalog;

- (id)productAt:(NSInteger)index;
- (NSInteger)numberOfProducts;
@end
