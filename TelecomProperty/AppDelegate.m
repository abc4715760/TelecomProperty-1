//
//  AppDelegate.m
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-10.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.

#import "AppDelegate.h"
#import "CusotomViewController.h"

#define ScreenHeight [UIScreen mainScreen].bounds.size.height;

@implementation AppDelegate


#pragma mark -

- (void)changeProgressValue
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"温馨" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alert show];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
  
//    //捕获异常
//    @try {
//        <#statements#>
//    }
//    @catch (NSException *exception) {
//        [exception.name ];//异常名字
//        [exception  reason];//异常原因
//    }
//    @finally {
//        <#statements#>
//    }
  
    [self.window makeKeyAndVisible];
    CusotomViewController *cusotom=[[CusotomViewController alloc]init];
    self.window.rootViewController=cusotom;
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
  
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
}
- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}
- (void)applicationWillTerminate:(UIApplication *)application
{
     
}

@end
