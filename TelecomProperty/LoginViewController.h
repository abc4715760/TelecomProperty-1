//
//  LoginViewController.h
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-11.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"//post请求
#import "NewUserViewController.h"
@interface LoginViewController : UIViewController<UITextFieldDelegate,ASIHTTPRequestDelegate>
{
    float hiegt;
}
@property(nonatomic,retain)UITextField *field;
@property(nonatomic,retain)UITextField *fieldMI;
@property(nonatomic,retain) UIButton * butpass;
@property(nonatomic,retain) UIButton *but;
@property(nonatomic,assign)BOOL IsAuto;
@property(nonatomic,retain) UIImageView *loginback;
@end
