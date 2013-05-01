//
//  NewUserViewController.m
//  TelecomProperty
//
//  Created by 邓成其 on 13-4-9.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import "NewUserViewController.h"

@interface NewUserViewController ()

@end

@implementation NewUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //背景图片
    UIImageView *backImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backimage.png"]];
    if (!iphone5) {
        backImage.frame=CGRectMake(0,0, 320, 480);
    }else{
        backImage.frame=CGRectMake(0, 0, 320, 548);
    }
      [self.view addSubview:backImage];
    //导航条
    UIImageView *navigation=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"顶部2.png"]];
    navigation.frame=CGRectMake(0, 0, 320, 44);
    navigation.userInteractionEnabled=YES;
    [self.view addSubview:navigation];
    UILabel *username=[[UILabel  alloc]init];
    username.frame=CGRectMake(0,0,320,44);
    username.text=@"用户注册";
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
    UIButton *completebut=[UIButton buttonWithType:0];
    completebut.frame=CGRectMake(320-65, 6, 60, 30);
    [completebut setTitle:@"注册" forState:UIControlStateNormal];
    [completebut setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [completebut addTarget:self action:@selector(completeaction:) forControlEvents:UIControlEventTouchUpInside];
    [completebut setBackgroundImage:[UIImage imageNamed:@"按钮右"] forState:UIControlStateNormal];
    [self.view addSubview:completebut];
    UILabel *numberID=[[UILabel alloc]initWithFrame:CGRectMake(11,33+50,170 ,30 )];
    numberID.text=@"用户ID";
    numberID.backgroundColor=[UIColor clearColor];
    [self.view addSubview:numberID];
    
    _numberField=[[UITextField alloc]initWithFrame:CGRectMake(77, 33+50,170, 30)];
    _numberField.placeholder=@"手机号码";
    _numberField.text=@"123456789";
    _numberField.returnKeyType=UIReturnKeyNext;
    _numberField.delegate=self;
    [_numberField becomeFirstResponder];
    _numberField.keyboardType=UIKeyboardTypePhonePad;
    _numberField.borderStyle= UITextBorderStyleRoundedRect;
    [self.view addSubview:_numberField];
    
    UILabel *prass=[[UILabel alloc]initWithFrame:CGRectMake(30, 78+50, 40, 30)];
    prass.text=@"密码";
    prass.backgroundColor=[UIColor clearColor];
    [self.view addSubview:prass];
    _prassField=[[UITextField alloc]initWithFrame:CGRectMake(77,78+50,170, 30)];
    _prassField.placeholder=@"密码";
    _prassField.returnKeyType=UIReturnKeyGo;
    _prassField.delegate=self;
    _prassField.text=@"123456789";
    _prassField.secureTextEntry=YES;//密码安全
    _prassField.keyboardType=UIKeyboardTypeDefault;
    _prassField.borderStyle= UITextBorderStyleRoundedRect;
    [self.view addSubview:_prassField];
   
}
-(void)backaction:(id)sender
{
  
//    http://58.20.32.202:8090/InfoManage/InsertService.asmx?op=InsertUser
    [self dismissModalViewControllerAnimated:YES];
}
#pragma  mark ASIhttpdelegate
-(void)requestFailed:(ASIHTTPRequest *)request
{
   
//失败进入改代理
}
-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"%@==", [request responseData]);
    NSString *str=[[NSString alloc] initWithData: [request responseData] encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);

}
-(void)completeaction:(id)sender
{
    //http://58.20.32.202:8090/InfoManage/InsertService.asmx/InsertUser
    NSURL *url=[NSURL URLWithString:@"http://58.20.32.202:8090/InfoManage/InsertService.asmx/InsertUser"];
    ASIFormDataRequest *ASIForm=[[ASIFormDataRequest alloc]initWithURL:url];
    [ASIForm setPostValue:_numberField.text forKey:@"telephone"];
    [ASIForm setPostValue:_prassField.text forKey:@"PassWord"];
    ASIForm.delegate=self;
    [ASIForm startAsynchronous];
//    [self dismissModalViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
