//
//  ResidentialIntroducedViewController.m
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-20.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import "ResidentialIntroducedViewController.h"

@interface ResidentialIntroducedViewController ()

@end

@implementation ResidentialIntroducedViewController

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
    [self.navigationController popViewControllerAnimated:YES];
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
    username.text=@"小区详情";
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
 
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 44+4, 320, 44)];
    label.text=@"亚商国际";
    label.font=[UIFont systemFontOfSize:20];
    label.backgroundColor=[UIColor clearColor];
    label.textAlignment=UITextAlignmentCenter;
    [self.view addSubview:label];
    UIImageView *imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,320, 100)];
    imageView1.image=_strname.image;
    UIImageView *imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(320, 0,320, 100)];
    imageView2.image=[UIImage imageNamed:@"小区介绍2.jpg"];
    
    UIScrollView *ScrollImage=[[UIScrollView alloc]initWithFrame:CGRectMake(0,90,320,100)];
    ScrollImage.contentSize=CGSizeMake(320*2,60);
    ScrollImage.delegate=self;
    ScrollImage.pagingEnabled=YES;//滚一页
    [ScrollImage addSubview:imageView2];
    [ScrollImage addSubview:imageView1];
    [self.view addSubview:ScrollImage];
    
    UIScrollView *scroll=[[UIScrollView alloc]init];
    if (!iphone5) {
    scroll.frame=CGRectMake(0,200,320,460-44-200);
    }else{
     scroll.frame=CGRectMake(0,200,320,548-44-200);
    }
   scroll.delegate=self;
    UILabel *label2=[[UILabel alloc]init];
      label2.frame=CGRectMake(0, 0, 320, 460-44-200);
      label2.text=@"      亚商国际项目位于长株潭融城的核心区，韶山南路与韶洲路交汇处，配套完善，交通便捷，项目占地面积15057平方米，建筑总规模97000平方米，项目性质为商住宅楼；总投资额为2.5亿元。 　　小区由一栋28层与一栋33层高层组成，一至四楼为商业部份，引进国际先进的开放式街区理念，以商业岛为中心，打造两条互动的商业内街，为业主及周边居民营造一个轻松愉悦的购物和休闲环境。 此外，亚商国际地处南城核心地段，投资潜力巨大总户数：1500户\n 停车位：300 \n 绿化率：40.0% \n容积率：4.95 \n总建筑面积：97364平方米";
    [label2 setFont:[UIFont systemFontOfSize:16]];
    label2.backgroundColor=[UIColor clearColor];
     [label2 setNumberOfLines:0];
     [label2 sizeToFit];
    
    [self.view addSubview:scroll];
    [scroll addSubview:label2];
     scroll.contentSize=CGSizeMake(300, label.frame.size.height+label2.frame.size.height);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
