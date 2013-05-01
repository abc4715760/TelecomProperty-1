//
//  MySuggestionViewController.h
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-11.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteView.h"
#import <MessageUI/MessageUI.h>
@interface MySuggestionViewController : UIViewController<UITextViewDelegate,MFMailComposeViewControllerDelegate>
@property(nonatomic,retain)UILabel*  labelword;//显示还能输入多少个字
@property(nonatomic,retain) UIImageView *backImage;
@property(nonatomic,retain)UITextField*textfild;
@property(nonatomic,retain) NoteView*textview;
@end
