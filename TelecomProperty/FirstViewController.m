//
//  SecondViewController.m
//  Test04
//
//  Created by HuHongbing on 9/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "JSON.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
 
@synthesize tableView = _tableView;
@synthesize headViewArray;


#pragma mark  two request
//请求区的名字
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _Mdata=[[NSMutableData alloc]init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_Mdata appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    
    if (IsImage) {
//        UIImageView *imagev=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
//        imagev.image=[UIImage imageWithData:_Mdata];
//        [self.view addSubview:imagev];
        
    }else{
        NSString *strData=[[NSString alloc]initWithData:_Mdata encoding:NSUTF8StringEncoding];
     NSLog(@"====%@===",[strData JSONValue]);
    NSDictionary *dic=[strData JSONValue];
    NSArray *arr=[dic objectForKey:@"data"];
    NSDictionary *dic1=[arr objectAtIndex:0];
    NSString *strURL=[dic1 objectForKey:@"imageurl"];
    NSLog(@"%@",strURL);
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@",strURL]];
    NSMutableURLRequest *requeststus=[[NSMutableURLRequest alloc]initWithURL:url];
        [NSURLConnection connectionWithRequest:requeststus delegate:self];
        IsImage=YES;
    }

}
-(void)request{
//    http://58.20.32.202:8090/InfoManage/SelectService.asmx/GetAreaData?sitecode=0101
    IsImage=NO;
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://58.20.32.202:8090/InfoManage/SelectService.asmx/GetTopADData"]];
    NSMutableURLRequest *requeststus=[[NSMutableURLRequest alloc]initWithURL:url];
//    [requeststus setHTTPMethod:@"POST"];
//    NSString *parmas=[NSString stringWithFormat:@"sitecode=0"];
//    NSData *postdata=[parmas dataUsingEncoding:NSUTF8StringEncoding];
//    [requeststus setHTTPBody:postdata];
    [NSURLConnection connectionWithRequest:requeststus delegate:self];
  }
-(void)requestsectionname{
//    NSURL *url=[NSURL URLWithString:@"http://123.139.154.21/test/getAllCommunity.aspx"];
//    ASIHTTPRequest *req1=[ASIHTTPRequest requestWithURL:url];
//    req1.userInfo=[NSDictionary dictionaryWithObject:@"req1" forKey:@"name"];//传一个字典用于标示是区分结果是这个请求发送的
//    req1.delegate=self;
//    [req1 startAsynchronous];
}
//请求每个区里的详细公告
-(void)requestannouncement:(id)sender
{
//    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://123.139.154.21/test/getCommunityInformation.aspx?page=1&cid=%d", _currentSection]];
//    NSLog(@"%d",_currentSection);
//    ASIHTTPRequest *req2=[ASIHTTPRequest requestWithURL:url];
//    req2.userInfo=[NSDictionary dictionaryWithObject:@"req2" forKey:@"name"];//传一个字典用于标示是区分结果是这个请求发送的
//    req2.delegate=self;
//    [req2 startAsynchronous];

}
#pragma mark ====
- (void)viewDidLoad
{
     c=0;
//    [self request]; //请求小区列表
    [super viewDidLoad];
//    [self requestsectionname];//请求小区名字
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
    username.text=@"小区公告";
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
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadModel];    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(-10,44,340,460-88)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor clearColor];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];
    _titlArray=[[NSMutableArray alloc]initWithObjects:@"蓟县出售引滦小区",@"天塔河西区天塔街高风", nil];
    _subtitlArray=[[NSMutableArray alloc]initWithObjects:@"您现在浏览的这条房源，是我极力推荐的优质三房：\n 1、小区位置好，小区周边有两大小学，自身配备有幼儿园，周边有新一佳超市和华润万家超市，影院，滨江新城商业街，就医也方便，多趟公交车经过这里，长株潭城际轻轨就在小区门口有站口，出行极其方便。小区内有生鲜市场，是居家、小孩陪读、父母养老的好选择。\n 2、户型好，一梯两户，南北通透的板房设计，三间卧室朝南设计，终年阳光充足，间间房都有阳光，这在三房的户型中少见。\n3、业主20万住家精装修，现场一看，你就能看出业主装修时是花了不少心思的，每间卫生间都配备了吹风机，每间卫生间内能直接调制热水器的温度，装修风格大方实用，可以现场品鉴，有真实图片可供参考。\n  4、业主因为另购新居，房屋从未出租，也不舍得出租，所以诚意出售，房内整体设施不动，赠送四台空调，图片内其余的电器，家具不包括在内。\n 5、刚满5年，为您节省一大笔的营业税，83.8万为房屋的实价。看房需要提前预约。 ",@"租金价格：2300 元/月 　押一付三 房屋户型： 2室 1厅 1卫 60㎡ 房屋情况： 普通住宅   中等装修　朝向南北所属楼层：2层/6层所在区域：河西 - 天塔 - 河西区天塔街高风里小区 所在地址：高风里小区", nil];
    [self loadMoreFooterInit];//添加上提视图
    [self EGORefreshloadMoreFooterInit];//添加下拉刷新
}
#pragma mark ASIHTTPDelegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"---%@",[request responseData]);
    //成功进入该代理
    NSString *strData=[[NSString alloc]initWithData:   [request responseData] encoding:NSUTF8StringEncoding];
       NSLog(@"====%@===",[strData JSONValue]);
   if ([[request.userInfo objectForKey:@"name"] isEqualToString:@"req1"]) {
//        NSDictionary *dic=[strData JSONValue];
//         NSArray *arr=[dic objectForKey:@"List"];
//         _currentRow = -1;
//        headViewArray = [[NSMutableArray alloc]init ];
//    for (int i=0; i<[arr count]; i++) { 
//        HeadView* headview = [[HeadView alloc] init];
//        headview.delegate = self;
//		headview.section = i;
//        [headview.backBtn setTitle:[[arr objectAtIndex:i] objectForKey:@"Name"] forState:UIControlStateNormal];
//		[self.headViewArray addObject:headview];
//
//    }
     }else if  ([[request.userInfo objectForKey:@"name"] isEqualToString:@"req2"]){
     NSArray *arr =[strData JSONValue];
        _titlArray=[[NSMutableArray alloc]init];
        for (int i=0; i<[arr count]; i++) {
            [_titlArray addObject:[arr objectAtIndex:i]];
        }
       
    }
[_tableView reloadData];
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
//失败进入该代理
    NSLog(@"%s",__FUNCTION__);
    
}
#pragma mark ---

-(void)backaction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadModel{
    _currentRow = -1;
    NSArray *arr=[[NSArray alloc]initWithObjects:@"雨花区",@"芙蓉区", nil];
    headViewArray = [[NSMutableArray alloc]init ];
    for (int i=0; i<2; i++) {
        HeadView* headview = [[HeadView alloc] init];
        headview.delegate = self;
		headview.section = i;
       headview.backBtn.titleLabel.text =[arr objectAtIndex:i];
        [headview.backBtn setTitle:headview.backBtn.titleLabel.text forState:UIControlStateNormal];
         headview.backImage.image=[UIImage imageNamed:@"DownAccessory"];
        [self.headViewArray addObject:headview];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    _tableView= nil;
}

#pragma mark - TableViewdelegate&&TableViewdataSource

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==[_titlArray count]) {
        return 40;
    }else{
    HeadView* headView = [self.headViewArray objectAtIndex:indexPath.section];
    return headView.open?80:0;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}


- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [self.headViewArray objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    HeadView* headView = [self.headViewArray objectAtIndex:section];
    return headView.open?[_titlArray count]+1:0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.headViewArray count];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"cell";
    static NSString *celldictabc=@"cell2";
    if([indexPath row] == ([self.titlArray count])) {
        
         UITableViewCell *loadMoreCell=[tableView dequeueReusableCellWithIdentifier:celldictabc];
        if (loadMoreCell==nil) {
            loadMoreCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celldictabc];
        }
        loadMoreCell.textLabel.text=@"点击加载更多";
        loadMoreCell.textLabel.textAlignment=UITextAlignmentCenter;
        return loadMoreCell;
    }else{
        UITableViewCell *Cell=[tableView dequeueReusableCellWithIdentifier:indentifier ];
        if (Cell==nil) {
            Cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier ];
            //头名
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(40,0,320-60,30)];
            label.font=[UIFont systemFontOfSize:20];
            label.backgroundColor=[UIColor clearColor];
            label.tag=1;
            [Cell.contentView addSubview:label];
            //内容
            UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(40,20, 320-60,60)];
            label1.tag=2;
              label1.font=[UIFont systemFontOfSize:14];
            //label1.lineBreakMode=UILineBreakModeWordWrap;
            label1.numberOfLines=2;
            label1.backgroundColor=[UIColor clearColor];
            [Cell.contentView addSubview:label1];
            //时间
            UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(320-80,62,80, 20)];
            label2.tag=3;
            label2.font=[UIFont systemFontOfSize:14];
            label2.backgroundColor=[UIColor clearColor];
            [Cell.contentView addSubview:label2];
//            UIImageView *imagev=[[UIImageView alloc]initWithFrame:CGRectMake(0,20,40, 40)];
//            imagev.image=[UIImage imageNamed:@"文件"];
//            [Cell.contentView addSubview:imagev];
            UIView *view=[UIView new];
            view.backgroundColor=[UIColor grayColor];
            view.frame=CGRectMake(0, label1.frame.size.height+label2.frame.size.height, 340, 1);
            [Cell.contentView addSubview:view];
        }
       
        UILabel *label= (UILabel*) [Cell viewWithTag:1];
        label.text=[_titlArray objectAtIndex:indexPath.row];
       UILabel *label1=(UILabel*)[Cell viewWithTag:2];
       label1.text=[ _subtitlArray objectAtIndex:indexPath.row];;
  //    Cell.selectionStyle=UITableViewCellEditingStyleNone; 没有点击效果
        UIView  *view=[UIView new];
        view.backgroundColor=[UIColor whiteColor];
           Cell.selectedBackgroundView=view;
   //-(void)prepareForReuse 去重用
        return Cell;
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier] ;
//        UIButton* backBtn=  [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 340, 80)];
//        backBtn.tag = 20000;
////        [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_on"] forState:UIControlStateHighlighted];
//        backBtn.userInteractionEnabled = NO;
//        [cell.contentView addSubview:backBtn];
//         UIImageView* line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 80, 340, 1)];
//        line.backgroundColor = [UIColor grayColor];
//        [cell.contentView addSubview:line];
//        //头名
//        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(40,0,320-60,30)];
//        label.font=[UIFont systemFontOfSize:17];
//        label.backgroundColor=[UIColor clearColor];
//        label.textColor=[UIColor whiteColor];
//        label.tag=1;
//        [cell.contentView addSubview:label];
//        //内容
//        UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(40,20, 320-60,60)];
//        label1.tag=2;
//        label1.textColor=[UIColor whiteColor];
//        label1.font=[UIFont systemFontOfSize:14];
//        label1.numberOfLines=2;
//        label1.backgroundColor=[UIColor clearColor];
//        [cell.contentView addSubview:label1];
//  
//    }
//    UIButton* backBtn = (UIButton*)[cell.contentView viewWithTag:20000];
//    HeadView* view = [self.headViewArray objectAtIndex:indexPath.section];
//    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_2_nomal"] forState:UIControlStateNormal];
//  
//    if (view.open) {
//        if (indexPath.row == _currentRow) {
//            [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_nomal"] forState:UIControlStateNormal];
//        }
//    }
//   
//    UILabel *label= (UILabel*) [cell viewWithTag:1];
//        label.text=[[_titlArray objectAtIndex:indexPath.row] objectForKey:@"Message"];
//     UILabel *label1=(UILabel*)[cell viewWithTag:2];
//   label1.text=[[_titlArray objectAtIndex:indexPath.row] objectForKey:@"Time"];;
//    cell.textLabel.backgroundColor = [UIColor clearColor];
//    cell.textLabel.textColor = [UIColor whiteColor];
//    return cell;
    }
       return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView  deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];//选中有背景颜色 离开后背景消失
    if (indexPath.row==[_titlArray count]) {
        [self performSelectorInBackground:@selector(loadMore) withObject:nil];
        [_tableView deselectRowAtIndexPath:indexPath animated:YES];
        return;
    }else{
      DetailViewController *detail=[[DetailViewController alloc]init];
        detail.titleStr=[_titlArray objectAtIndex:indexPath.row];
        detail.DetailsubtitlStr=[_subtitlArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:detail animated:YES];
    }
    
}
#pragma mark ---
#pragma mark more
-(NSMutableArray*)reqesttype:(NSString *)string andpage:(NSString*)page
{
    NSString *str=[NSString stringWithFormat:@"http://123.139.154.21/test/getCommunityInformation.aspx?page=%@&cid=%d",page,_currentSection];
    NSURL *url=[NSURL URLWithString:str];//组装成URL
    NSURLRequest *request=[NSURLRequest requestWithURL:url];//发送请求
    NSData *reledata=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSMutableString *JSONStr=[[NSMutableString alloc]initWithData:reledata encoding:NSUTF8StringEncoding];
    return  [JSONStr JSONValue];
}

//加载数据的方法:
-(void)loadMore
{
    //    c++;
//    loadMoreFooterVIew.hidden=YES;//隐藏
//    NSMutableArray *more=[self reqesttype:nil andpage:[NSString stringWithFormat:@"%d",c]];//    NSLog(@"asfdasf%@",more);
////加载你的数据
//[self performSelectorOnMainThread:@selector(appendTableWith:) withObject:more waitUntilDone:NO];
}//添加数据到列表:
-(void) appendTableWith:(NSMutableArray *)data
{
    
    for (int i=0;i<[data count];i++) {
        [_titlArray addObject:[data objectAtIndex:i]];
    }
    NSMutableArray *insertIndexPaths = [[NSMutableArray alloc]init];
    for (int ind = 0; ind < [data count]; ind++) {
        NSIndexPath    *newPath =  [NSIndexPath indexPathForRow:[_titlArray indexOfObject:[data objectAtIndex:ind]] inSection:_currentSection];
        [insertIndexPaths addObject:newPath];
    }
    
    [_tableView insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationTop];
    
    [_tableView reloadData];
    
}
#pragma mark --
#pragma mark - HeadViewdelegate
-(void)selectedWith:(HeadView *)view{
    
    _currentRow = -1;
    if (view.open) { //如果视图有展开
     
        for(int i = 0;i<[headViewArray count];i++)
        {
            HeadView *head = [headViewArray objectAtIndex:i];
            head.open = NO;
//            [head.backBtn setBackgroundImage:[UIImage imageNamed:@"btn_momal"] forState:UIControlStateNormal];
            head.backImage.image=[UIImage imageNamed:@"DownAccessory"];
             }
//        [_titlArray removeAllObjects];//删除数组里的元素
        [_tableView setSeparatorColor:[UIColor clearColor]];//隐藏分割线
        [_tableView reloadData];
        return;
    }
    _currentSection = view.section;

    [self reset];//没展开
    
}

//界面重置
- (void)reset
{
     c=1;
    for(int i = 0;i<[headViewArray count];i++)
    {
        HeadView *head = [headViewArray objectAtIndex:i];
        
        if(head.section == _currentSection)
        {
            head.open = YES; //点的当前的块头处于打开  显示子菜单里的内容
//             NSLog(@"head.open = YES;");
//            [head.backBtn setBackgroundImage:[UIImage imageNamed:@"btn_nomal"] forState:UIControlStateNormal];
            [self requestannouncement:nil];
             head.backImage.image=[UIImage imageNamed:@"UpAccessory"];
            
        }else {

//            [head.backBtn setBackgroundImage:[UIImage imageNamed:@"btn_momal"] forState:UIControlStateNormal];
              head.open = NO; //块头先处于关闭
             head.backImage.image=[UIImage imageNamed:@"DownAccessory"];
        }
        
    }
    [_tableView reloadData];
}
#pragma mark  ---
-(void)loadMoreFooterInit{
    
    if (loadMoreFooterVIew == nil) {
        LoadMoreTableFooterView *FooterView =[[LoadMoreTableFooterView alloc]initWithFrame:CGRectMake(0.0f,_tableView.contentSize.height, _tableView.frame.size.width, _tableView.bounds.size.height)];
        FooterView .delegate=self;
        [_tableView addSubview:FooterView];
        loadMoreFooterVIew=FooterView;
}
    
}
#pragma mark Data Source Loading / Reloading Methods
-(void)reloadTableViewDataSource
{
    //应该调用你的tableviews数据源模型来加载
    //把这里只是为了演示
    reloading=YES;
}
-(void)doneLoadingTableViewData
{//模型应该调用这个当其加载完成
    [self loadMore];
    reloading=NO;
    [loadMoreFooterVIew loadMoreScrollViewDataSourceDidFinishedLoading: _tableView];
 }
#pragma mark -
#pragma mark UIScrollViewDelegate Methods
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{ 
    [loadMoreFooterVIew loadMoreScrollViewDidScroll:scrollView];
    [refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];

}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];

    [loadMoreFooterVIew loadMoreScrollViewDidEndDragging: scrollView];
}
#pragma mark -
#pragma mark LoadMoreTableFooterDelegate Methods
-(void)loadMoreTableFooterDidTriggerRefresh:(LoadMoreTableFooterView *)view
{
    NSLog(@"%d",[_titlArray count]);
    [self reloadTableViewDataSource];
    if ([_titlArray count]>0) {
        [self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:2.0];
      }
        
}
-(BOOL)loadMoreTableFooterDataSourceIsLoading:(LoadMoreTableFooterView *)view
{    

    return reloading;
}


#pragma mark ---
//下拉刷新
-(void)EGORefreshloadMoreFooterInit{
if (refreshHeaderView==nil) {
    EGORefreshTableHeaderView *view1=[[EGORefreshTableHeaderView alloc]initWithFrame:CGRectMake(0.0f, 0.0f-_tableView.bounds.size.height, self.view.frame.size.width,_tableView.bounds.size.height)];
    view1.delegate=self;//设置代理
    [_tableView addSubview:view1];
    refreshHeaderView=view1;
  }
}
#pragma mark EGORefreshTableHeaderDelegate Methods
-(void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view
{
    [self egoRefreshreloadTableViewDataSource];
    [self performSelector:@selector(egoRefreshdoneLoadingTableViewData) withObject:nil afterDelay:3.0];//延迟调用
}
-(BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view
{
    return reloading;
}
-(NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view
{
    return [NSDate date];
}
#pragma mark Data Source Loading / Reloading Methods
-(void)egoRefreshreloadTableViewDataSource
{
    NSLog(@"==开始加载数据");
    reloading=YES;
    [self requestannouncement:nil];// 发起请求
}
-(void)egoRefreshdoneLoadingTableViewData
{
  
    NSLog(@"===加载完数据");
    reloading=NO;
    [refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:_tableView];
}

@end
