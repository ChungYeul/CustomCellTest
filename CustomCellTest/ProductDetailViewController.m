//
//  ProductDetailViewController.m
//  CustomCellTest
//
//  Created by SDT-1 on 2014. 1. 10..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "Catalog.h"
#import "Product.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    Catalog *catalog = [Catalog defaultCatalog];
    Product *product = [catalog productWithCode:self.productCode];
    
    self.imageView.image = [UIImage imageNamed:product.imageName];
    self.name.text = product.name;
    self.price.text = product.price;
    self.title = product.name;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
