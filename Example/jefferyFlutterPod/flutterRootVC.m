//
//  flutterRootVC.m
//  tetetetete
//
//  Created by jeffery on 2019/3/7.
//  Copyright © 2019年 MAC. All rights reserved.
//

#import "flutterRootVC.h"
#import "MyFlutterViewController.h"

@interface flutterRootVC ()

@property (nonatomic,strong)UIButton *testBtn;


@end

@implementation flutterRootVC


- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.testBtn.frame = CGRectMake(100, 100, 100, 100);
    self.testBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.testBtn];

}

- (void)didTest{
    MyFlutterViewController *vc = [[MyFlutterViewController alloc]init];
    
    
    [self.navigationController pushViewController:vc animated:YES];
}



- (UIButton *)testBtn{
    if (!_testBtn) {
        _testBtn = [UIButton new];
        [_testBtn setTitle:@"test" forState:UIControlStateNormal];
        [_testBtn addTarget:self action:@selector(didTest) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testBtn;
}


@end
