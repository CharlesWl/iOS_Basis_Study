//
//  ViewController.m
//  UINavigationController基础
//
//  Created by charles on 16/4/13.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "ViewController.h"

#define selfColor [UIColor redColor]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Hearth Of Stone";
    /**
     *  导航条颜色
     */
    self.navigationController.navigationBar.barTintColor = selfColor;
    /**
     *  图标颜色
     */
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    /**
     *  标题颜色
     */
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    /**
     导航条左右按钮设置
     */
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 48)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"改变状态" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didClickOnchange) forControlEvents:UIControlEventTouchUpInside];
    button.center = self.view.center;
    [self.view addSubview:button];
    
}

- (void)didClickOnchange {
    [UIView animateWithDuration:0.3 animations:^{
        
        [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha > 0 ? 0:1;
        
        [[UIApplication sharedApplication] setStatusBarStyle:[[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha > 0? UIStatusBarStyleLightContent : UIStatusBarStyleDefault animated:NO];
        
        self.navigationController.navigationBar.tintColor = [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha > 0 ? [UIColor whiteColor] : selfColor;
        
        self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha > 0 ? [UIColor whiteColor] : selfColor forKey:NSForegroundColorAttributeName];
    }];
}

@end
