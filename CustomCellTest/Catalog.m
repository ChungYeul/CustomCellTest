//
//  Catalog.m
//  CustomCellTest
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import "Catalog.h"
#import "Product.h"

@implementation Catalog {
    NSArray *_data;
}
static Catalog *_instance = nil;
+ (id)defaultCatalog {
    if (nil == _instance) {
        _instance = [[Catalog alloc] init];
    }
    return _instance;
}

- (id) init {
    self = [super init];
    if (self) {
        _data = @[[Product productWithName:@"BaseBall" code:@"1" price:@"100" image:@"baseball.png"],
                  [Product productWithName:@"BasketBall" code:@"2" price:@"200" image:@"basketball.png"],
                  [Product productWithName:@"FootBall" code:@"3" price:@"250" image:@"football.png"],
                  [Product productWithName:@"RugbyBall" code:@"4" price:@"300" image:@"rugbyball.png"],
                  [Product productWithName:@"Wilson" code:@"5" price:@"999" image:@"volleyball.png"]];
//        _data = @[[Product productWithName:@"BaseBall" withPrice:@"100" withImage:@"baseball.png"],
//                  [Product productWithName:@"BasketBall" withPrice:@"200" withImage:@"basketball.png"],
//                  [Product productWithName:@"FootBall" withPrice:@"250" withImage:@"football.png"],
//                  [Product productWithName:@"RugbyBall" withPrice:@"300" withImage:@"rugbyball.png"],
//                  [Product productWithName:@"Wilson" withPrice:@"999" withImage:@"volleyball.png"]];
    }
    return self;
}
- (id)productAt:(NSInteger)index {
    return [_data objectAtIndex:index];
}
- (NSInteger)numberOfProducts {
    return [_data count];
}
@end
