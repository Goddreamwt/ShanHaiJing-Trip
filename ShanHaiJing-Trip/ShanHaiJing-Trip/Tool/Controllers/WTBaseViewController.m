//
//  WTBaseViewController.m
//  ShanHaiJing-Trip
//
//  Created by mac on 2018/8/16.
//  Copyright © 2018年 mac. All rights reserved.
//
/*
 项目控制器的基类
 */
#import "WTBaseViewController.h"

@interface WTBaseViewController ()

@end

@implementation WTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    self.view.userInteractionEnabled = YES;
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
