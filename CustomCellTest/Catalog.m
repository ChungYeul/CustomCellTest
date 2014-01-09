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
        _data = @[[Product product:@"BaseBall" price:@"100" image:@"baseball.png"],
                  [Product product:@"BasketBall" price:@"200" image:@"basketball.png"],
                  [Product product:@"FootBall" price:@"250" image:@"football.png"],
                  [Product product:@"RugbyBall" price:@"300" image:@"rugbyball.png"],
                  [Product product:@"Wilson" price:@"999" image:@"volleyball.png"]];
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
