//
//  MySuggestionViewController.m
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-11.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import "MySuggestionViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface MySuggestionViewController ()

@end

@implementation MySuggestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//#pragma mark 邮件
//-(void)MeilAlertView:(NSString *)sender
//{
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:sender delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//    [alert show];
//}
////内部邮件
//- (void)intemail:(NSString *)sender {
//    //判断设置是否支持邮件发送功能
//    if ([MFMailComposeViewController canSendMail]) {
//        //创建邮件发送的视图控制器
//        MFMailComposeViewController *mail=[[MFMailComposeViewController alloc]init];
//        mail.mailComposeDelegate=self;//设置代理
//        //设置邮件的标题
//        [mail setSubject:@"意见"];
//        //设置内容
//        [mail setMessageBody:sender isHTML:YES];
//        //设置邮件的发送对象
//        [mail setToRecipients:[NSArray arrayWithObjects:@"cuip2001@163.com", nil]];
//        //设置邮件抄送对象
//        [mail setCcRecipients:[NSArray arrayWithObjects:@"suip2002@163.com", nil]];
//        [self presentModalViewController:mail animated:YES];
//        
//    }
//    else
//    {
//        NSLog(@"不支持");
//        [self MeilAlertView:@"该设备不支持发邮件"];
//    }
//    
//}
////外部邮件
//- (void)outemail:(id)sender {
//    
//    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"mailto:%@?cc=%@&subject=%@&body=%@",@"fujiekai@gmail.com",@"273085817@qq.com",@"test",@"ceshi"]];
//    //mailto: 是协议
//    if ([[UIApplication sharedApplication] canOpenURL:url])//判断是否能打开
//    {
//        [[UIApplication sharedApplication] openURL:url];
//    }
//    else
//    {
//        
//        NSLog(@"设备不支持邮箱功能");
//    }
//}
////邮件发送结束时进代理
//-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
//{
//    if (result==MFMailComposeResultSent)//判断发送后的结果
//    {
//        NSLog(@"发送成功");
//        [self MeilAlertView:@"意见已发送成功,谢谢您的建议,我们会尽快给您答复"];
//    }
//    else if(result==MFMailComposeResultFailed)
//    {
//        NSLog(@"发送失败");
//    }
//    [self dismissModalViewControllerAnimated:YES];
//}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //背景图片
    _backImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backimage.png"]];
    if(!iphone5)
    {
        _backImage.frame=CGRectMake(0,0, 320, 480);
    }
    else
    {
       _backImage.frame=CGRectMake(0,0, 320, 548);
    }
    _backImage.userInteractionEnabled=YES;
    [self.view addSubview:_backImage];
    //导航条
    UIImageView *navigation=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"顶部2.png"]];
    navigation.frame=CGRectMake(0, 0, 320, 44);
    navigation.userInteractionEnabled=YES;
    [self.view addSubview:navigation];
    UILabel *username=[[UILabel  alloc]init];
    username.frame=CGRectMake(0,0,320,44);
    username.text=@"游客，您好";
    username.textColor=[UIColor whiteColor];
    username.backgroundColor=[UIColor clearColor];
    username.textAlignment=UITextAlignmentCenter;
    [self.view addSubview:username];
    
    UIButton *but=[UIButton buttonWithType:0];
    but.frame=CGRectMake(10, 6, 60, 30);
    [but setTitle:@"返回" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [but setBackgroundImage:[UIImage imageNamed:@"按钮左"] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(backaction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
  
    UIImageView*imgv=[[UIImageView alloc]initWithFrame:CGRectMake(30, 100, 260,120+80)];
    imgv.image=[UIImage imageNamed:@".png"];
    imgv.userInteractionEnabled=YES;
     _textview=[[NoteView alloc]initWithFrame:CGRectMake(0, 2, 260, 118+80)];
    _textview.delegate=self;
    [_textview becomeFirstResponder];
    [_textview.layer setCornerRadius:5.0f];
	[_textview.layer setBorderWidth:2.0f];
	[_textview.layer setBorderColor:[UIColor blackColor].CGColor];
   _textview.returnKeyType=UIReturnKeyGo;
    _textview.font=[UIFont systemFontOfSize:14.0f];
    _textview.backgroundColor=[UIColor clearColor];//颜色
    [imgv addSubview:_textview];
    [_backImage addSubview:imgv];
    
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(30, 70, 80, 40)];
    label1.backgroundColor=[UIColor clearColor];
    label1.text=@"意见反馈";
    [_backImage addSubview:label1];
    _labelword=[[UILabel alloc]initWithFrame:CGRectMake(130, 70, 200, 40)];
    _labelword.backgroundColor=[UIColor clearColor];
    _labelword.text=[NSString stringWithFormat:@"还可以输入500字"];
    _labelword.textColor=[UIColor lightGrayColor];
    [_backImage addSubview:_labelword];
 
    //在键盘上添加一个按钮 用于回收键盘
    UIBarButtonItem *bar1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *Bar2=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"jianpan.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(RecoveryOfTheKeyboard:)] ;
    UIToolbar *toolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    NSArray *array=[[NSArray alloc]initWithObjects:bar1,Bar2, nil];
    toolbar.items=array;
    toolbar.barStyle=UIBarStyleBlackTranslucent;//透明
    _textfild.inputAccessoryView=toolbar;
    _textview.inputAccessoryView=toolbar;
    UIButton *completebut=[UIButton buttonWithType:0];
    completebut.frame=CGRectMake(320-65, 6, 60, 30);
    [completebut setTitle:@"完成" forState:UIControlStateNormal];
    [completebut setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [completebut addTarget:self action:@selector(feedbackaction:) forControlEvents:UIControlEventTouchUpInside];
    [completebut setBackgroundImage:[UIImage imageNamed:@"按钮右"] forState:UIControlStateNormal];
    [self.view addSubview:completebut];

   }
//将要开始编辑进的代理
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    //添加动画
    [UIView animateWithDuration:0.4 animations:^{
        _backImage.frame=CGRectMake(0,0-40, 320, 480);
    }];
    
    return YES;
}
//回收键盘
-(void)RecoveryOfTheKeyboard:(id)sender
{
    [_textview resignFirstResponder];
    [UIView animateWithDuration:0.4 animations:^{
        _backImage.frame=CGRectMake(0, 0, 320, 480);

    }];
   }
//+(BOOL)setpredicate:(NSString *)sender //设定邮箱验证 信息
//{
//    NSString *match = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"; //注意\d正则法则在OC中表达式\\d
//    
//    NSPredicate *result = [NSPredicate predicateWithFormat:@"SELF matches %@",match];//用谓词过滤
//    return  [result evaluateWithObject:sender];//用通过谓词对象 判断传进来的参数是否符合 是BOOL值
//}
-(void)feedbackaction:(id)sender
{
   if ([self textLength:_textview.text]<1) {  //没有内容
        _textview.text=@"";
       [self AlertViewAction:nil];
   }
   else   //内容不为空
      {
          [_textview resignFirstResponder];
          _textview.text=@"";
          UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"谢谢您的建议" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
          [alert show];
         [self RecoveryOfTheKeyboard:nil];
       }

}
//    else
//    {
//      if (![MySuggestionViewController  setpredicate: _textfild.text] ) {
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确邮箱 格式应为任意字母数字 +@在任意字母数字 + 一个小数点 +2个或3个大小字母组成" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//        [alert show];
//        
//    }
//    else
//    {
//
//           [self outemail:[NSString stringWithFormat:@"%@\n发邮件者:%@",_textview.text,_textfild.text]];
//        [self RecoveryOfTheKeyboard:nil];
//    }
//    }
//}
-(void)AlertViewAction:(id)sender
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入改善意见" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];

}
#pragma mark 字符串长度
//计算字符串长度
- (int)textLength:(NSString *)text
{
    float number = 0.0;
    for (int index = 0; index < [text length]; index++)
    {
        NSString *character = [text substringWithRange:NSMakeRange(index, 1)];
        
        if ([character lengthOfBytesUsingEncoding:NSUTF8StringEncoding] == 3)
        {
            number++;
        }
        else
        {
            number = number + 0.5;
        }
    }
    return ceil(number);
}
#pragma mark TextDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    //    label2.text=[[NSNumber numberWithUnsignedInteger:textView.text.length]stringValue];//显示输入多少个字;
    _labelword.text=[NSString stringWithFormat:@"还可以输入%@字",[[NSNumber numberWithUnsignedInteger:500- textView.text.length]stringValue]];//显示还能输入多少个字
    //该判断用于联想输入限制输入最大的字数
    if (textView.text.length >500)
    {
        textView.text = [textView.text substringToIndex:500];//字符串取前300个字符
    }
    NSLog(@"----");
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
   // 用的比较多少的是把return设问回收键盘
    if ([text isEqualToString:@"\n"])  //判断输入的字符是不是 return键
    {
       
        if ([self textLength:_textview.text]<1) {
            _textview.text=@"";
            [self AlertViewAction:nil];
        }
        else
        {
           
            [self RecoveryOfTheKeyboard:nil];
        }
        
}
  return YES;
}

-(void)backaction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
