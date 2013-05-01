//
//  MyBusinessCardViewController.m
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-11.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import "MyBusinessCardViewController.h"

@interface MyBusinessCardViewController ()

@end

@implementation MyBusinessCardViewController

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
    if(!iphone5)
    {
        backImage.frame=CGRectMake(0,0, 320, 480);
    }
    else
    {
        backImage.frame=CGRectMake(0,0, 320, 548);
    }

    [self.view addSubview:backImage];
    //导航条
    UIImageView *navigation=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"顶部2.png"]];
    navigation.frame=CGRectMake(0, 0, 320, 44);
    navigation.userInteractionEnabled=YES;
    [self.view addSubview:navigation];
    UILabel *username=[[UILabel  alloc]init];
    username.frame=CGRectMake(0,0,320,44);
    username.text=@"选择小区";
    username.backgroundColor=[UIColor clearColor];
    username.textColor=[UIColor whiteColor];
    username.textAlignment=UITextAlignmentCenter;
    [self.view addSubview:username];
    
    UIButton *but=[UIButton buttonWithType:0];
    but.frame=CGRectMake(10, 6, 60, 30);
    [but setTitle:@"返回" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [but setBackgroundImage:[UIImage imageNamed:@"按钮左"] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(backaction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton *but1=[UIButton buttonWithType:0];
    but1.frame=CGRectMake(320-70, 6, 60, 30);
    [but1 setTitle:@"添加" forState:UIControlStateNormal];
    [but1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [but1 setBackgroundImage:[UIImage imageNamed:@"按钮右"] forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(insertaction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    UILabel *address=[[UILabel alloc]initWithFrame:CGRectMake(0,44,320,30)];
    address.backgroundColor=[UIColor clearColor];
    address.text=@"选择的小区";
    address.textAlignment=UITextAlignmentCenter;
    [self.view addSubview:address];
    if (!iphone5) {
        
    }
    _picker=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 460-44, 320, 216)];
    _picker.hidden=YES;
    [UIView animateWithDuration:0.5 animations:^{
        _picker.hidden=NO;
        _picker.frame=CGRectMake(0, 59+80, 320, 216);
    }];
    _picker.dataSource=self;
    _picker.delegate=self;
    _picker.showsSelectionIndicator=YES;
    [self.view addSubview:_picker];
    _lablecommuct=[[UILabel alloc]initWithFrame:CGRectMake(0, 5+80, 320, 40)];
    [self.view addSubview:_lablecommuct];
    [self groupaction:nil];
	[self loginrequeset];
}
//获取市区列表请求
-(void)loginrequeset{
    NSURL *url=[NSURL URLWithString:@"http://58.20.32.202:8090/InfoManage/SelectService.asmx/GetCityData"];
    ASIFormDataRequest *PostRequst=[[ASIFormDataRequest alloc]initWithURL:url];
    [PostRequst setPostValue:@"01" forKey:@"sitecode"];
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
//添加
-(void)insertaction:(id)sender
{
    NSLog(@"%@",sender);
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"添加小区成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}

-(void)groupaction:(id)sender
{
    NSArray *city=[[NSArray alloc]initWithObjects:@"长沙市", nil];
    NSArray *county=[[NSArray alloc]initWithObjects:@"芙蓉区",@"天心区",@"雨花区", nil];
    NSArray *community1=[[NSArray alloc]initWithObjects:@"滩头坪社区服务中心",@"五里牌社区服务中心 ",@"马王堆街道",@"荷晏社区服务中心" ,nil];
    NSArray *community2=[[NSArray alloc]initWithObjects:@"吴家坪社区服务中心",@"青园街道友谊社区居委会 ",@"仰天湖社区" ,nil];
    NSArray *community3=[[NSArray alloc]initWithObjects:@"雨花区社区学院",@"韶山路 ",@"长塘里" ,nil];
    _MutableDict=[[NSMutableDictionary alloc]init];
    [_MutableDict setObject:city forKey:@"city"];
    [_MutableDict setObject:county forKey:@"county"];
    NSArray *arr=[[NSArray alloc]initWithObjects:community1,community2,community3, nil];
    
    for (int i=0; i<[[_MutableDict  objectForKey:@"county" ] count]; i++) {
        [_MutableDict  setObject:[arr objectAtIndex:i] forKey:[[_MutableDict  objectForKey:@"county" ]  objectAtIndex:i]];
    }
    _strcity=[[_MutableDict objectForKey:@"county"]objectAtIndex:0];//设一个全局的字符串，用来pickView第一次运行 第3三取值
    
    [_picker reloadAllComponents];//更新
    _strcity0=[[_MutableDict objectForKey:@"city"] objectAtIndex:0];
    _lablecommuct.text=[NSString stringWithFormat:@"地址 :%@ -%@ -%@",_strcity0,_strcity,[[ _MutableDict objectForKey: _strcity]objectAtIndex:0]];
    //   NSLog(@"=================%@",[[ _MutableDict objectForKey: _strcity]objectAtIndex:0]);
}
#pragma mark UIPickerViewDataSource pickerView的几个协议

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 3;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
	if (component==0) {
		return [[_MutableDict objectForKey:@"city"] count];
        //        NSLog(@"-------%d=======",[[_MutableDict objectForKey:@"city"] count]);
	} else if (component==1) {
        return  [[_MutableDict objectForKey:@"county"] count];
		//划分picker中有多少行
	}else if (component==2) {
        //        NSLog(@"]]]]]]]]]]]]]]]]]]%d",[[_MutableDict objectForKey:_strcity] count]);
        //        NSLog(@"%@=",_strcity);
        return [[_MutableDict objectForKey:_strcity] count];
	}
	return	YES;
    
}
//在picker中输出内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	if (component==0) {
        
        return [[_MutableDict objectForKey:@"city"] objectAtIndex:row]; //取出第一项的内容
	}else if (component==1) {
        return  [[_MutableDict objectForKey:@"county"] objectAtIndex:row];
	}else if (component==2)
	{
        return  [[_MutableDict objectForKey:_strcity] objectAtIndex:row];
    }
	
	return nil;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	if (component==0) {
        //        NSLog(@"%@====",[self  pickerView:pickerView titleForRow:row forComponent:component]);
        _strcity0=[self  pickerView:pickerView titleForRow:row forComponent:component];
        
        _strcity=[[_MutableDict objectForKey:@"county"] objectAtIndex:0];//当第一项改变时，第二项始终取数组的第一位
        _strcity1=[[_MutableDict objectForKey:_strcity] objectAtIndex:0];//当第2项改变时第3项始终取该数组的第一位
        [pickerView selectRow:0 inComponent:1 animated:YES];//指定第2项第一行
        [pickerView reloadComponent:1];//更新
        [pickerView selectRow:0 inComponent:2 animated:YES];//指定第3项第一行
        [pickerView reloadComponent:2];//更新
    }else if (component==1) {
        
        _strcity=[self  pickerView:pickerView titleForRow:row forComponent:component];
        _strcity1=[[_MutableDict objectForKey:_strcity] objectAtIndex:0];//当第2项改变时第3项始终取该数组的第一位
        [pickerView selectRow:0 inComponent:2 animated:YES];
        [pickerView reloadComponent:2];
        
    }else if(component==2){
        _strcity1=[self  pickerView:pickerView titleForRow:row forComponent:component];
        //        NSLog(@"str2===%@",_strcity1);
    }
    _lablecommuct.text=[NSString stringWithFormat:@"地址 :%@ -%@ -%@",_strcity0,_strcity,_strcity1];
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
