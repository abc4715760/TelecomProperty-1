//
//  InformationViewController.h
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-10.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGridView.h"//首页的按钮布局控件
#import "UIGridViewDelegate.h"//
#import "Cell.h"
#import "FirstViewController.h"//小区公告
#import "Harpy.h"//更新版本
#import "JHTickerView.h"    // 滚动label
#import "UrlAddress.h"//一个对象存广告地址图片
#import "AOScrollerView.h"//广告滚动
#import "CenterViewController.h"//实景
@interface InformationViewController : UIViewController<NSURLConnectionDataDelegate,UIGridViewDelegate,UIScrollViewDelegate,ASIHTTPRequestDelegate,ValueClickDelegate>
{
    NSMutableArray *Arr;//存放广告图片的数组
    int TimeNum;//控制时间在5秒滚动换一张图片
    BOOL Tend;//是反向转动
    BOOL Present;
}
@property(nonatomic,retain)UIGridView *tabel;
@property(nonatomic,retain)AOScrollerView*scroll;//存放广告的视图
@property(nonatomic,retain)UIPageControl *page;//让广告滚一页一页的滚动
@property(nonatomic,retain)JHTickerView* labelGPS;//滚动显示文字的视图
@property(nonatomic)float hight;

@end
