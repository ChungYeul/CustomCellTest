//
//  ProductCell.m
//  CustomCellTest
//
//  Created by In Chung Yeul on 2014. 1. 7..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import "ProductCell.h"

@implementation ProductCell
- (void)setProductInfo:(Product *)item {
    _productName.text = item.name;
    _productPrice.text = item.price;
    _productImage.image = [UIImage imageNamed:item.imageName];
}

- (IBAction)addCart:(id)sender {
    // 셀 객체로 제품식별
    [self.delegate addItem:self];
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
