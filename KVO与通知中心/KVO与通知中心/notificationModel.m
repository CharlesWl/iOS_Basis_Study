//
//  notificationModel.m
//  KVO与通知中心
//
//  Created by charles on 16/2/17.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "notificationModel.h"

@implementation notificationModel
- (void)getsomeMessage {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Wanglei" object:@"你好，朋友，我是Xcode"];
}

@end
