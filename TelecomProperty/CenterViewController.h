//
//  CenterViewController.h
//  WaterFlowViewDemo
//
//  Created by Smallsmall on 12-6-11.
//  Copyright (c) 2012年 activation group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterFlowView.h"
#import "ImageViewCell.h"

@interface CenterViewController : UIViewController<WaterFlowViewDelegate,WaterFlowViewDataSource>
{
    int numberpage;//加载后一页的数据
    int numberPrevious;//前一页的数据     /* 两个参数用与每次取两数组之间的值*/
    NSMutableArray *arrayData;
    WaterFlowView *waterFlow;
    int hiegt;
}

- (void)dataSourceDidLoad;
- (void)dataSourceDidError;

@end
