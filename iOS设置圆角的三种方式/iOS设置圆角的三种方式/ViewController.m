//
//  ViewController.m
//  iOS设置圆角的三种方式
//
//  Created by charles on 16/4/8.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *gtiImage = [UIImage imageNamed:@"GTI.jpg"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, gtiImage.size.width/5, gtiImage.size.height/5)];
    imageView.center = self.view.center;
    imageView.image = gtiImage;
    /**
     *  第一种
     */
    //imageView.layer.cornerRadius = 5;
    //imageView.layer.masksToBounds = YES;
    
    /**
     *  第二种
     */
    //开始对imageview进行画图
    //UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 2.0);
    //[[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width/10] addClip];
    //[imageView drawRect:imageView.bounds];
    //imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //结束画图
    //UIGraphicsEndImageContext();
    
    /**
     *  第三种
     */
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:imageView.bounds.size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = imageView.bounds;
    maskLayer.path = maskPath.CGPath;
    imageView.layer.mask = maskLayer;
    
    [self.view addSubview:imageView];
}


@end
