//
//  CartViewController.m
//  CustomCellTest
//
//  Created by SDT-1 on 2014. 1. 13..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import "CartViewController.h"
#import "CartDelegate.h"
#import "Cart.h"
#import "CartCell.h"
@interface CartViewController ()<UITableViewDataSource, UITableViewDelegate, CartCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation CartViewController
// Cart Delegate
- (void)incQuantity:(NSString *)productCode {
    [[Cart defaultCart] incQuantity:productCode];
    [self.table reloadData];
}

- (void)decQuantity:(NSString *)productCode {
    [[Cart defaultCart] decQuantity:productCode];
    [self.table reloadData];
}

// TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[Cart defaultCart] numberOfItems];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
//    cell.textLabel.text = @"a";
    
    CartCell *cell = (CartCell *)[tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
    cell.delegate = self;
    
    CartItem *item = [[Cart defaultCart] cartItemAtIndex:indexPath.row];
    [cell setCartItem:item];
    
    return cell;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.table reloadData];
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
