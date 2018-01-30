//
//  ViewController.m
//  ButtonBlock
//
//  Created by 朱佳男 on 2018/1/5.
//  Copyright © 2018年 ShangYuKeJi. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Block.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton creatButtonWithFrame:CGRectMake(100, 100, 100, 44) title:@"我是按钮" actionBlock:^(UIButton *button) {
        NSLog(@"我被点击了");
    }];
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton creatButtonWithFrame:CGRectMake(100, 200, 100, 44) title:@"我也是按钮" actionBlock:nil];
    button2.actionBlock = ^(UIButton *button) {
        NSLog(@"我也被点击了");
    };
    button2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button2];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
