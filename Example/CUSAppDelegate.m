//
//  CUSAppDelegate.m
//  CUSMaskView
//
//  Created by zhangyu on 14-2-11.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "CUSAppDelegate.h"
#import "CUSExampleViewController.h"
@implementation CUSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    CUSExampleViewController *vc = [[CUSExampleViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    return YES;
}
@end
