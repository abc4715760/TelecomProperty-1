//
//  LoginViewController.m
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-11.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisteredUsersViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)backaction:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
-(void)autoaction:(id)sender
{
    
}
//注册
-(void)registeredaction:(id)sender
{
    /*
    RegisteredUsersViewController *registeredUsers=[[RegisteredUsersViewController alloc]init];
    [self presentModalViewController:registeredUsers animated:YES]; */
  NewUserViewController *NewUser=[[NewUserViewController alloc]init];
   [self presentViewController:NewUser animated:YES completion:^{
       }];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!iphone5) {
        hiegt=460;
    }else{
        hiegt=548;
    }
    //背景图片
    UIImageView *backImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backimage.png"]];
  
        backImage.frame=CGRectMake(0,0, 320, hiegt);
       [self.view addSubview:backImage];
    //导航条
    UIImageView *navigation=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"顶部2.png"]];
    navigation.frame=CGRectMake(0, 0, 320, 44);
    navigation.userInteractionEnabled=YES;
    [self.view addSubview:navigation];
    UILabel *username=[[UILabel  alloc]init];
    username.frame=CGRectMake(0,0,320,44);
    username.text=@"登陆";
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
    
    UIImageView *tabar=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabBar.png"]];
    if (!iphone5) {
        tabar.frame=CGRectMake(0, 460-44, 320, 44);
    }else{
        tabar.frame=CGRectMake(0, 548-44, 320, 44);
    }
    tabar.userInteractionEnabled=YES;
    [self.view addSubview:tabar];
   
    _loginback=[[UIImageView alloc]initWithFrame:CGRectMake(20,100, 320-40, hiegt-210)];
    _loginback.userInteractionEnabled=YES;
    _loginback.image=[UIImage imageNamed:@"背景图4.png"];
    [self.view addSubview:_loginback];
    
    UIImageView *loginback3=[[UIImageView alloc]initWithFrame:CGRectMake(117-40,55+10,155, 30)];
    loginback3.image=[UIImage imageNamed:@"号码.png"];
    [_loginback addSubview:loginback3];

    UILabel *number=[[UILabel alloc]initWithFrame:CGRectMake(70-40,55+10,40, 30)];
    number.text=@"账号";
    number.backgroundColor=[UIColor clearColor];
    [_loginback addSubview:number];
    _field=[[UITextField alloc]initWithFrame:CGRectMake(120-40,60+10,155, 30)];
    _field.placeholder=@"输入注册账号";
    _field.text=@"13000008888";
// _field.borderStyle=UITextBorderStyleRoundedRect;
    _field.returnKeyType=UIReturnKeyNext;
    _field.delegate=self;
    _field.keyboardType=UIKeyboardTypePhonePad;
//   _field.inputAccessoryView=[self huishou];
    [_loginback addSubview:_field];
    UIImageView *loginback4=[[UIImageView alloc]initWithFrame:CGRectMake(117-40,100+10,155, 30)];
    loginback4.image=[UIImage imageNamed:@"号码.png"];
    [_loginback addSubview:loginback4];
    
    UILabel *number1=[[UILabel alloc]initWithFrame:CGRectMake(70-40,100+10,40, 30)];
    number1.text=@"密码";
    number1.backgroundColor=[UIColor clearColor];
    [_loginback addSubview:number1];
    _fieldMI=[[UITextField alloc]initWithFrame:CGRectMake(120-40,105+10, 155, 30)];
    _fieldMI.placeholder=@"输入密码";
    _fieldMI.delegate=self;
    //    _fieldMI.text=@"123456";
    _fieldMI.secureTextEntry=YES;
    _fieldMI.inputAccessoryView=[self huishou];
    _fieldMI.returnKeyType=UIReturnKeyDone;
//    _fieldMI.borderStyle=UITextBorderStyleRoundedRect;
    [_loginback addSubview:_fieldMI];
    
    UIImageView *loginback5=[[UIImageView alloc]initWithFrame:CGRectMake(2,2,320-44,40+10)];
    loginback5.image=[UIImage imageNamed:@"top7.png"];
    [_loginback addSubview:loginback5];
    UIImageView *loginback66=[[UIImageView alloc]initWithFrame:CGRectMake(0,42+10,320-42,4)];
    loginback66.image=[UIImage imageNamed:@"绿色横条.png"];
    [_loginback addSubview:loginback66];
    UILabel *autopasswold=[[UILabel alloc]initWithFrame:CGRectMake(120-40,130+10,80,40)];
    autopasswold.text=@"记住密码";
    autopasswold.textAlignment=NSTextAlignmentCenter;
    autopasswold.backgroundColor=[UIColor clearColor];
    autopasswold.font=[UIFont systemFontOfSize:14.0f];
    [_loginback addSubview:autopasswold];
    UIButton *autobutton=[UIButton buttonWithType:UIButtonTypeCustom];
    autobutton.frame=CGRectMake(110-40, 140+10, 20, 20);
    _IsAuto=YES;
    if (_IsAuto) {
    [autobutton setBackgroundImage:[UIImage imageNamed:@"btn_check_on.png"]  forState:UIControlStateNormal];
    }else{
        [autobutton setBackgroundImage:[UIImage imageNamed:@"btn_check_off.png"] forState:UIControlStateSelected];}
    [autobutton addTarget:self action:@selector(autoaction:) forControlEvents:UIControlEventTouchUpInside];
    [_loginback addSubview:autobutton];
    
    UILabel *forgetpasswold=[[UILabel alloc]initWithFrame:CGRectMake(120+80-40,130+10,80,40)];
    forgetpasswold.text=@"忘记密码";
    forgetpasswold.textAlignment=NSTextAlignmentCenter;
    forgetpasswold.backgroundColor=[UIColor clearColor];
    forgetpasswold.font=[UIFont systemFontOfSize:14.0f];
    [_loginback addSubview:forgetpasswold];
    
    UIButton *loginButton=[UIButton buttonWithType:0];
    loginButton.frame=CGRectMake(90-40,160+20 ,80,40);
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginrequeset) forControlEvents:UIControlEventTouchUpInside];
     [loginButton setBackgroundImage:[UIImage imageNamed:@"login.png"] forState:UIControlStateNormal];
    [_loginback addSubview:loginButton];
    
    UIButton *registeredButton=[UIButton buttonWithType:0];
    registeredButton.frame=CGRectMake(120+70-30,160+20 ,80 ,40);
    [registeredButton setTitle:@"注册" forState:UIControlStateNormal];
    [registeredButton setBackgroundImage:[UIImage imageNamed:@"login.png"] forState:UIControlStateNormal];
    [registeredButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [registeredButton addTarget:self action:@selector(registeredaction:) forControlEvents:UIControlEventTouchUpInside];
    [_loginback addSubview:registeredButton];
 
}
-(UIView *)huishou
{
    //回收键盘
    UIBarButtonItem *bar1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *Bar2=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"jianpan.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(huishouaction)];
    UIToolbar *toolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    NSArray *array=[[NSArray alloc]initWithObjects:bar1,Bar2, nil];
    toolbar.items=array;
    toolbar.barStyle=UIBarStyleBlackTranslucent;//透明
    return toolbar ;
}
//登陆请求
-(void)loginrequeset{
    NSURL *url=[NSURL URLWithString:@"http://58.20.32.202:8090/InfoManage/SelectService.asmx/GetUserRole"];
    ASIFormDataRequest *PostRequst=[[ASIFormDataRequest alloc]initWithURL:url];
    [PostRequst setPostValue:_field.text forKey:@"tell"];
    [PostRequst setPostValue:_field.text forKey:@"pwd"];
    PostRequst.delegate=self;
    [PostRequst startAsynchronous];//发起异步请求
}
#pragma mark ASIHTTpRequstDelegate
-(void)requestFinished:(ASIHTTPRequest *)request
{
     NSString *strData=[[NSString alloc]initWithData:   [request responseData] encoding:NSUTF8StringEncoding];
    NSLog(@"%@",strData);
}
-(void)requestFailed:(ASIHTTPRequest *)request
{

}
#pragma mark  ----
-(void)huishouaction
{
    [_fieldMI resignFirstResponder];
    [UIView animateWithDuration:0.4 animations:^{
        _loginback.frame=CGRectMake(20,100, 320-40, hiegt-210);
    }];
}
#pragma mark textFIelddelgate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
    }
    return YES;
}
//将要开始编辑进的代理
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //添加动画
    [UIView animateWithDuration:0.4 animations:^{
        _loginback.frame=CGRectMake(_loginback.frame.origin.x,100-50-10, _loginback.frame.size.width,_loginback.frame.size.height);
    }];
    return YES;
}
#pragma mark =====
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
