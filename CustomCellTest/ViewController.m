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

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CartDelegate> {
    NSMutableArray *cartItems;
//    NSArray *data;
//    NSMutableArray *cart;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController

// 델리게이트 메소드
- (void)addItem:(id)sender {
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    [cartItems addObject:product];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
//    // 제품 찾기 - 셀 객체로 indexPath 얻기
//    UITableViewCell *cell = (UITableViewCell *)sender;
//    NSIndexPath *indexPath = [self.table indexPathForCell:cell];
//    Product *item = data[indexPath.row];
//    
//    // 카드에 상품 추가
//    [cart addObject:item];
//    
//    // 테이블 카트 섹션 리로드
//    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
//    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

// UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return [[Catalog defaultCatalog] numberOfProducts];
//        return [data count];
    }
    else {
        return [cartItems count];
//        return [cart count];
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
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        Product *product = cartItems[indexPath.row];
        cell.textLabel.text = product.name;
        return cell;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    cartItems = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
