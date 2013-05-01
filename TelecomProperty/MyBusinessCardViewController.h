//
//  MyBusinessCardViewController.h
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-11.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "JSON.h"
@interface MyBusinessCardViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,ASIHTTPRequestDelegate>
@property(nonatomic,retain) UIPickerView*picker;//显示
@property(nonatomic,retain)NSMutableDictionary *MutableDict;//存处数据
@property(nonatomic,retain)NSString *strcity;//显示城市里的区
@property(nonatomic,retain)NSString *strcity0;//显示城市
@property(nonatomic,retain)NSString *strcity1;//显示城市 区下的小区
@property(nonatomic,retain)UILabel *lablecommuct;//显示所选的地址@end
@end