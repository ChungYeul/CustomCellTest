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
//#import "CartDelegate.h"
#import "Cart.h"
//#import "CartCell.h"
#import "ProductDetailViewController.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CartDelegate, UIAlertViewDelegate> {
}
@property (weak, nonatomic) IBOutlet UITableView *table;
//@property (strong, nonatomic) Cart *cart;
@end

@implementation ViewController

// 델리게이트 메소드
- (void)addItem:(id)sender {
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    [[Cart defaultCart] addProduct:product];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"알림" message:@"카트에 들어갔습니다" delegate:self cancelButtonTitle:@"닫기" otherButtonTitles:@"확인", nil];
    [alert show];
    
    // 핵심
//    [self.cart addProduct:product];
    
//    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
//    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

//- (void)incQuantity:(NSString *)productCode {
//    [self.cart incQuantity:productCode];
//    
//    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
//    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
//}
//
//- (void)decQuantity:(NSString *)productCode {
//    [self.cart decQuantity:productCode];
//    
//    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
//    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
//}

// UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[Catalog defaultCatalog] numberOfProducts];
//    if (0 == section) {
//        return [[Catalog defaultCatalog] numberOfProducts];
//    }
//    else {
//        return self.cart.items.count;
//    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return (0 == section) ? @"Product" : @"Items in Cart";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
    cell.delegate = self;
    
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    [cell setProductInfo:product];
    return cell;
//    if (0 == indexPath.section) {
//        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
//        cell.delegate = self;
//        
//        Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
//        [cell setProductInfo:product];
//        return cell;
//    }
//    else {
//        CartCell *cell = (CartCell *)[tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
//        cell.delegate = self;
//        CartItem *cartItem = self.cart.items[indexPath.row];
//        [cell setCartItem:cartItem];
//        return cell;
//    }
}

// UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    alertView.cancelButtonIndex
//    alertView.firstOtherButtonIndex
    if (alertView.firstOtherButtonIndex == buttonIndex) {
        [self.tabBarController setSelectedIndex:1];
        
        // 강제로 리로드
        // 무식한 방법
        // 단점
        // 1. CartViewController를 import해야 한다
        // 2. CartViewController클래스 안에 forceReloadTable()함수를 정의해야한다
        // NSArray *controllers = self.tabBarController.viewControllers;
        // CartViewController *cartController = (CartViewController *)controllers[1];
        // [cartController forceReloadTable];
        
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ProductDetailViewController *detailVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *selectedProduct = [[Catalog defaultCatalog] productAt:indexPath.row];
    detailVC.productCode = selectedProduct.code;
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.cart = [[Cart alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
