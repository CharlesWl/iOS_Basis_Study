//
//  ViewController.m
//  KVO与通知中心
//
//  Created by charles on 16/2/17.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "ViewController.h"
#import "notificationModel.h"
#import "User.h"
#define CHARLES @"CHARLES"
@interface ViewController ()
@property (nonatomic, strong)User *userModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*-----------------------------监听通知----------------------------*/
    /**
     *  监听通知方法
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getSomeMessage:) name:@"Wanglei" object:nil];
    /**
     其他类的发送通知
     */
    notificationModel *model = [[notificationModel alloc]init];
    [model getsomeMessage];
    
    /*-----------------------------KVO----------------------------*/
    self.userModel = [[User alloc]init];
    [self.userModel addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    self.userModel.name = @"Charles";
}

#pragma mark - 通知中心方法
- (void)getSomeMessage:(id)sender {
    NSLog(@"%@",sender);
}

#pragma mark - KVO方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"名字被改啦");
}

/**
 *  移除监听通知
 */
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:@"Wanglei"];
    [self.userModel removeObserver:self forKeyPath:@"name"];
}

@end
