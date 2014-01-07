//
//  ViewController.m
//  CustomCellTest
//
//  Created by In Chung Yeul on 2014. 1. 7..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "Product.h"
#import "CartDelegate.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CartDelegate> {
    NSArray *data;
    NSMutableArray *cart;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController

// 델리게이트 메소드
- (void)addItem:(id)sender {
    // 제품 찾기 - 셀 객체로 indexPath 얻기
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.table indexPathForCell:cell];
    Product *item = data[indexPath.row];
    
    // 카드에 상품 추가
    [cart addObject:item];
    
    // 테이블 카트 섹션 리로드
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

// UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return [data count];
    }
    else {
        return [cart count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return (0 == section) ? @"상품목록" : @"카트";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        
        Product *item = data[indexPath.row];
        [cell setProductInfo:item];
        
        // 뷰 컨트롤러가 셀의 델리게이트 역할을 수행한다.
        cell.delegate = self;
        return cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        Product *item = cart[indexPath.row];
        cell.textLabel.text = item.name;
        return cell;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    data = @[[Product product:@"BaseBall" price:@"100" image:@"baseball.png"],
             [Product product:@"BasketBall" price:@"200" image:@"basketball.png"],
             [Product product:@"FootBall" price:@"250" image:@"football.png"],
             [Product product:@"RugbyBall" price:@"300" image:@"rugbyball.png"],
             [Product product:@"Wilson" price:@"999" image:@"volleyball.png"]];
    cart = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
