//
//  MyDynamicViewController.h
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-11.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDynamicViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)UITableView *Tablecommunity;//小区信息展示
@property(nonatomic,retain)NSMutableArray *Arraycommunity;//存小区信息
@property (nonatomic,retain)NSArray *arr;//存小区的名字
@property (assign)BOOL isOpen;//判断cell是否处于展开
@property (nonatomic,retain)NSIndexPath *selectIndex;//选择的哪行
@end
