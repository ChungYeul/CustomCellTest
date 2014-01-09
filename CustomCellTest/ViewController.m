//
//  ViewController.m
//  CustomCellTest
//
//  Created by In Chung Yeul on 2014. 1. 7..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "Catalog.h"
#import "Product.h"
#import "CartDelegate.h"
#import "Cart.h"
#import "CartCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CartDelegate> {
}
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Cart *cart;
@end

@implementation ViewController

// 델리게이트 메소드
- (void)addItem:(id)sender {
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    // 핵심
    [self.cart addProduct:product];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)incQuantity:(NSString *)productCode {
    [self.cart incQuantity:productCode];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)decQuantity:(NSString *)productCode {
    [self.cart decQuantity:productCode];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

// UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return [[Catalog defaultCatalog] numberOfProducts];
    }
    else {
        return self.cart.items.count;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return (0 == section) ? @"Product" : @"Items in Cart";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        cell.delegate = self;
        
        Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
        [cell setProductInfo:product];
        return cell;
    }
    else {
        CartCell *cell = (CartCell *)[tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        cell.delegate = self;
        CartItem *cartItem = self.cart.items[indexPath.row];
        [cell setCartItem:cartItem];
        return cell;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cart = [[Cart alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
