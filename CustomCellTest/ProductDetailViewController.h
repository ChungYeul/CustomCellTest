//
//  ProductDetailViewController.h
//  CustomCellTest
//
//  Created by SDT-1 on 2014. 1. 10..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (strong) NSString *productCode;
@end
