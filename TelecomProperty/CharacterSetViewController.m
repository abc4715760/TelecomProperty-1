//
//  CharacterSetViewController.m
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-11.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import "CharacterSetViewController.h"
#import "InformDetailsViewController.h"//通知详情界面
@interface CharacterSetViewController ()

@end

@implementation CharacterSetViewController

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
    username.text=@"游客您好";
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
    _NoticeArray=[[NSMutableArray alloc]initWithObjects:@"长沙芙蓉区物业",@"做好年底前几项党建工作通知", @"余额不足",nil];
     _subtilearray=[[NSArray alloc]initWithObjects:@"为了贯彻落实党的十八大精神，确保年初签订的组织工作、思想政治工作、党风廉政建设工作目标管理责任书和创建先锋示范城区工作目标管理责任书按时完成，迎接上级党组织年底对各单位党的建设工作进行检查验收，各党总支、支部要对照责任书的要求，查漏  补缺，逐项进行检查落实，重点要做好如下几方面工作：   一、开展学习十八大精神的相关工作  根据自治区、南宁市、城区党委学习十八大精神的安排和部署，各党总支、支部要把学习好、领会好、贯彻好、落实好党的十八大精神作为当前工作的首要政治任务，贯穿于当前和今后一个时期党的建设工作始终。召开会议宣传贯彻党的十八大精神，订阅有关学习十八大精神的材料，将十八大会议精神和当前的各项工作紧密结合。   二、组织工作、思想政治工作、党风廉政建设工作、创建先锋示范城区目标管理责任制自查自检工作   要认真对照今年签订的《区直属机关各党总支（支部）组织工作、思想政治工作、党风廉政建设工作目标管理责任书》和《各党总支（支部）落实创建先锋示范城区责任书》的要求，逐项检查责任工作落实情况，做好材料的收集、归档、装订，并于12月25日前将以上责任书的自检自评情况汇报材料、全年工作总结和各项评分细则自评表报城区直属机关党工委，以便迎接市委组织部、城区党委的检查。党工委拟于12月底或1月上旬对各党总支、支部党建“三大块”和创建先锋示范城区进行检查验收。",@"尊敬的各位住户：  你们好！  为创造一个更好的宜居卫生环境，特通告如下：  一、请装修业户将装修垃圾(沙子、水泥、砖头、石膏板、瓷砖边角废料等)堆放在指定地点（楼体西南角标志处）。  二、请不要随手将垃圾扔进绿化带内，请放入垃圾箱内。  三、请不要随地往楼道内吐口香糖。不乱扔瓜子皮、烟头、烟灰等垃圾。  四、尽量避免放在自家门口的垃圾袋流淌稀粘脏物。  五、尽量不要空中抛物。  六、在楼道内吸烟的朋友，请您自备简易的易拉罐等不可燃物做烟灰缸，将烟头、烟灰等放入烟灰缸内，将其放在角落里。  新春佳节即将来临，祝大家新年快乐，万事如意！    物业办  二〇〇三年一月十七日",@"尊敬的住户:你余额不足请请你缴费", nil];
    _NoticeTable=[[UITableView alloc]initWithFrame:CGRectMake(0,44, 320,460) style:UITableViewStyleGrouped];
    _NoticeTable.delegate=self;
    _NoticeTable.backgroundView=nil;
    _NoticeTable.backgroundColor=[UIColor clearColor];
    _NoticeTable.dataSource=self;
    [self.view addSubview:_NoticeTable];
    
    [_NoticeTable reloadData];
	
}
-(void)backaction:(id)sender
{
    
    //    UIApplication *app = [UIApplication sharedApplication];
    //    NSURL *url = [NSURL URLWithString:@"myapp://scenerytest"];
    ////
    //    if ([app  canOpenURL:url]) {  //同样的道理，利用 UIApplication 类的  - (BOOL)canOpenURL:(NSURL *)url 成员方法可以判断是否能启动应用B；
    //
    //        [app openURL:url];
    //        NSLog(@"can  launch B app!");
    //
    //    }else {
    //
    //        NSLog(@"can not launch B app!");
    //    }
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark TableViewdelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *Cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (Cell==nil) {
        Cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    Cell.textLabel.text=[_NoticeArray objectAtIndex:indexPath.row];
    Cell.detailTextLabel.text=[_subtilearray objectAtIndex:indexPath.row];
    Cell.selectionStyle=UITableViewCellEditingStyleNone;
    return Cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_NoticeArray count];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    InformDetailsViewController *informDetails=[[InformDetailsViewController alloc]init];
    informDetails.Informtitle=[_NoticeArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:informDetails animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
