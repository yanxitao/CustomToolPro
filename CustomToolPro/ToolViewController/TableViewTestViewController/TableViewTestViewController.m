//
//  TableViewTestViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/12/4.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#pragma mark -----------------tableView子视图重叠解决方式、子View不通过代理跳转页面

#import "TableViewTestViewController.h"
#import "FirstCell.h"
#import "SecondCell.h"

@interface TableViewTestViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    float                   cellHeight;
    NSArray                 *tests;
}
@property (weak, nonatomic) IBOutlet UITableView *testTableView;

@end

@implementation TableViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initWithTableView];
}

- (void)initWithTableView {
    
    cellHeight = 350;
    self.testTableView.delegate = self;
    self.testTableView.dataSource = self;
    [self.testTableView registerNib:[UINib nibWithNibName:@"FirstCell" bundle:nil] forCellReuseIdentifier:@"firstCell"];
    [self.testTableView registerNib:[UINib nibWithNibName:@"SecondCell" bundle:nil] forCellReuseIdentifier:@"secondCell"];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2 == 0) {

        return 100;

    }else {
        
        return 150;
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    //出现cell子控件重合
//    static NSString *CellIdentifier = @"cell1";
//    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    UILabel *labelTest = [[UILabel alloc] init];
//    [labelTest setFrame:CGRectMake(2, 2, 200, 40)];
//    [labelTest setBackgroundColor:[UIColor clearColor]]; //之所以这里背景设为透明，就是为了后面让大家看到cell上叠加的label.
//    [labelTest setTag:1];
//    [[cell contentView]addSubview:labelTest];
//    [labelTest setText:[NSString stringWithFormat:@"这是第%ld个Cell", indexPath.row]];
//    return cell;
    
    //解决cell子控件重合一
    static NSString *CellIdentifier = @"cell1";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }else {
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    UILabel *labelTest = [[UILabel alloc] init];
    [labelTest setFrame:CGRectMake(2, 2, 200, 40)];
    [labelTest setBackgroundColor:[UIColor clearColor]]; //之所以这里背景设为透明，就是为了后面让大家看到cell上叠加的label.
    [labelTest setTag:1];
    [[cell contentView]addSubview:labelTest];
    [labelTest setText:[NSString stringWithFormat:@"这是第%ld个Cell", indexPath.row]];
    return cell;

//    //解决cell子控件重合二
//    static NSString *CellIdentifier = @"cell1";
//    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        UILabel *labelTest = [[UILabel alloc]init];
//        [labelTest setFrame:CGRectMake(2, 2, 200, 40)];
//        [labelTest setBackgroundColor:[UIColor clearColor]];
//        [labelTest setTag:1];
//        [[cell contentView]addSubview:labelTest];
//    }
//    UILabel *label1 = (UILabel*)[cell viewWithTag:1];
//    [label1 setText:[NSString stringWithFormat:@"这是第%ld个Cell", indexPath.row]];
//    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        cellHeight += 50;
        [self.testTableView reloadData];
    }else if (indexPath.row == 1) {
        cellHeight -= 100;
        [self.testTableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
