//
//  CharacterSetViewController.h
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-11.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterSetViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSMutableArray *NoticeArray;
@property(nonatomic,retain)UITableView *NoticeTable;//显示通知标题
@property(nonatomic,retain)NSArray * subtilearray;//内容
@end
