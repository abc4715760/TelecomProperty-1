//
//  MyDynamicViewController.m
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-11.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import "MyDynamicViewController.h"
#import "People.h"
#import "Cell2.h"
#import "Cell1.h"
#import "ResidentialIntroducedViewController.h"
@interface MyDynamicViewController ()

@end

@implementation MyDynamicViewController

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
    username.text=@"小区介绍";
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
    
    //小区显示视图
    _Tablecommunity=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 460)];
    _Tablecommunity.dataSource=self;
    _Tablecommunity.delegate=self;
    _Tablecommunity.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_Tablecommunity];
   
    [self communityaction:nil];
	// Do any additional setup after loading the view.
}
-(void)communityaction:(id)sender
{
      NSMutableArray *RecentlyArray=[[NSMutableArray alloc]init];
    NSArray *arrayname=[[NSArray alloc]initWithObjects:@"亚商国际",nil];
    NSArray *arraysignature=[[NSArray alloc]initWithObjects:@"亚商国际项目位于长株潭融城的核心区，韶山南路与韶洲路交汇处，配套完善，交通便捷，项目占地面积15057平方米，建筑总规模97000平",nil];
    NSArray *imageArray=[[NSArray alloc]initWithObjects:[UIImage imageNamed:@"小区介绍.png"], nil];
    for (int i=0; i<1; i++) {
        People  *people=[[People alloc]init];
        people.name=[arrayname objectAtIndex:i];
        people.signature=[arraysignature objectAtIndex:i];
        people.image=[imageArray objectAtIndex:i];
        [RecentlyArray addObject:people];
        
    }
    
    _Arraycommunity=[[NSMutableArray alloc]init];
    _arr=[[NSArray alloc]initWithObjects:@"雨花区", nil];
     for (int i=0; i<[_arr  count]; i++) {
         NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
        [dict setObject:RecentlyArray forKey:[_arr objectAtIndex:i]];
        [_Arraycommunity addObject:dict];
    }
    [_Tablecommunity reloadData];
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (tableView==_Tablecommunity) 
        return [_arr count];
    
    return 1;
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
    return 0;
}

//块头的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
//设置每块section的title
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    return nil;
}
//每个cell的高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
//每块的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        if (self.isOpen) {
            if (self.selectIndex.section == section) {
                return [[[_Arraycommunity objectAtIndex:section] objectForKey:[_arr objectAtIndex:section]] count]+1;;
            }
        }
        return 1;
}
//每个cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_Tablecommunity) {
        
        if (self.isOpen&&self.selectIndex.section == indexPath.section&&indexPath.row!=0) {//打开时显示每个区的详细内容
            NSLog(@"cell2=====");
            static NSString *CellIdentifier = @"Cell2";
            Cell2 *cell = (Cell2*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
            }
            NSArray *list = [[_Arraycommunity objectAtIndex:self.selectIndex.section] objectForKey:[_arr objectAtIndex:indexPath.section]];
            
            cell.titleLabel.text =( (People *)[list objectAtIndex:indexPath.row-1]).name;
            cell.subtitle.text =( (People *)[list objectAtIndex:indexPath.row-1]).signature;
            cell.image.image =( (People *)[list objectAtIndex:indexPath.row-1]).image;
            return cell;
        }else
        {   //关闭时显示小区
            NSLog(@"cell1=====");
            static NSString *CellIdentifier = @"Cell1";
            Cell1 *cell = (Cell1*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
            }
            NSString *name = [_arr objectAtIndex:indexPath.section];
            cell.titleLabel.text = name;
            [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath]?YES:NO)];
            return cell;
        }
        return nil;
    }else{
        static NSString *Identifier=@"CellIdentifier";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
        }
        if (tableView==_Tablecommunity) {
            cell.textLabel.text=[_Arraycommunity objectAtIndex:indexPath.row];
        } 
        return cell;}
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ResidentialIntroducedViewController *demo=[[ResidentialIntroducedViewController alloc]init];
     if (tableView==_Tablecommunity) {
        if (indexPath.row == 0) { //点击第一行
            if ([indexPath isEqual:self.selectIndex]) {
                self.isOpen = NO;
                [self didSelectCellRowFirstDo:NO nextDo:NO];
                self.selectIndex = nil;
                
            }else
            {
                if (!self.selectIndex) {
                    self.selectIndex = indexPath;
                    [self didSelectCellRowFirstDo:YES nextDo:NO];
                    
                }else
                {
                    [self didSelectCellRowFirstDo:NO nextDo:YES];
                }
            }
        }else  //内容
        {
            NSDictionary *dic = [_Arraycommunity objectAtIndex:indexPath.section];
            NSArray *list = [dic objectForKey:[_arr objectAtIndex:indexPath.section]];
            NSLog(@"%d===",[list count]);
            demo.strname=( (People *)[list objectAtIndex:indexPath.row-1]);
    
            [self.navigationController pushViewController:demo animated:YES];//push 下一个页面
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
}
- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert
{
    
    self.isOpen = firstDoInsert;
    Cell1 *cell = (Cell1 *)[_Tablecommunity cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    [_Tablecommunity beginUpdates];
    int section = self.selectIndex.section;
    NSLog(@"%d======",section);
    NSLog(@"%@===-----",_Arraycommunity  );
    int contentCount = [[[_Arraycommunity objectAtIndex:section] objectForKey:[NSString stringWithFormat:@"雨花区"] ] count];
    
   	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
    NSLog(@"%d===",contentCount);
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [_Tablecommunity insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [_Tablecommunity deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    
	[_Tablecommunity endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [_Tablecommunity indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    if (self.isOpen) [_Tablecommunity scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

@end
