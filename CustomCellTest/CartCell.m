//
//  CartCell.m
//  CustomCellTest
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import "CartCell.h"
#import "Product.h"
#import "CartItem.h"

@interface CartCell()
- (IBAction)plusClicked:(id)sender;
- (IBAction)minusClicked:(id)sender;
@end
@implementation CartCell
- (IBAction)plusClicked:(id)sender {
    [self.delegate incQuantity:self.productCode];
}

- (IBAction)minusClicked:(id)sender {
    [self.delegate decQuantity:self.productCode];
}

- (void)setCartItem:(CartItem *)item {
    self.productCode = item.product.code;
    self.cartName.text = item.product.name;
    self.cartQuantity.text = [NSString stringWithFormat:@"%d 개", item.quantity];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
