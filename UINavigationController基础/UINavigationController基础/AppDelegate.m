//
//  AppDelegate.m
//  UINavigationController基础
//
//  Created by charles on 16/4/13.
//  Copyright © 2016年 Charles_Wl. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UIImageView+WebCache.h"
@interface AppDelegate () 
@property (strong, nonatomic) UIView *lunchView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = navi;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    /**
     *  启动页添加图片
     */
    self.lunchView = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateInitialViewController].view;
    self.lunchView.frame = CGRectMake(0, 0, self.window.screen.bounds.size.width, self.window.screen.bounds.size.height);
    [self.window addSubview:self.lunchView];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.window.screen.bounds.size.width, self.window.screen.bounds.size.height)];
    
    NSString *str = @"http://www.chinanews.com/cr/2014/0723/3203881033.jpg";
    [imageV sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"GTI.jpg"]];
    [self.lunchView addSubview:imageV];
    
    [self.window bringSubviewToFront:self.lunchView];
    
    [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(removeLun) userInfo:nil repeats:NO];
    return YES;
}

-(void)removeLun
{
    [UIView animateWithDuration:1 animations:^{
        [self.lunchView removeFromSuperview];
    }];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
