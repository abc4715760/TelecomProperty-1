//
//  MyProfileViewController.h
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-11.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProfileViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
@property(nonatomic,retain)UITableView *table;
@property(nonatomic,retain)NSMutableArray *ArrayTable;
@property(nonatomic,retain)UIImageView *userimage;
@end
