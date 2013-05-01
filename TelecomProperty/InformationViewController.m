#import "InformationViewController.h"
#import "CharacterSetViewController.h"//个性设置
#import "MySuggestionViewController.h"//我的建议
#import "MyBusinessCardViewController.h"//我的名片
#import "MyDynamicViewController.h"//我的动态
#import "MyProfileViewController.h"//我的质料
#import "LoginViewController.h"//小区信息
#import "JSON.h"
@interface InformationViewController ()

@end

@implementation InformationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark UIGridViewDelgate
-(CGFloat)gridView:(UIGridView *)grid widthForColumnAt:(int)columnIndex
{
    //    return 120;
    return 80;
}
-(CGFloat)gridView:(UIGridView *)grid heightForRowAt:(int)rowIndex
{
    //    return 98;
    return 88;
}
-(NSInteger)numberOfColumnsOfGridView:(UIGridView *)grid
{
    return 4;
}
-(UIGridViewCell *)gridView:(UIGridView *)grid cellForRowAt:(int)rowIndex AndColumnAt:(int)columnIndex
{
    Cell *cell=(Cell *)[grid dequeueReusableCell];
    if (cell==nil) {
        cell=[[Cell alloc]init];
    }
    if (rowIndex==0&&columnIndex==0) {
        cell.label.text=@"小区选择";
        cell.thumbnail.image=[UIImage imageNamed:@"1-1"];
    }else if (rowIndex==0&&columnIndex==1){
        cell.label.text=@"小区介绍";
        cell.thumbnail.image=[UIImage imageNamed:@"1-2"];
   
    }
    else if (rowIndex==0&&columnIndex==2){
        cell.label.text=@"小区公告";
        cell.thumbnail.image=[UIImage imageNamed:@"1-3"];
     }else if (rowIndex==0&&columnIndex==3){
         cell.label.text=@"小区实景";
         cell.thumbnail.image=[UIImage imageNamed:@"1-4"];
    }
    else if (rowIndex==1&&columnIndex==0){
        cell.label.text=@"我的通知";
        cell.thumbnail.image=[UIImage imageNamed:@"1-5"];
     }else if (rowIndex==1&&columnIndex==1){
        cell.label.text=@"我的资料";
        cell.thumbnail.image=[UIImage imageNamed:@"1-6"];
    }else if (rowIndex==1&&columnIndex==2){
        cell.label.text=@"我的建议";
        cell.thumbnail.image=[UIImage imageNamed:@"1-7"];

    }else if (rowIndex==2&&columnIndex==0){
        cell.label.text=@"待添加";
    }else if (rowIndex==2&&columnIndex==1){
        cell.label.text=@"待添加";
    }else if (rowIndex==2&&columnIndex==1){
        cell.label.text=@"待添加5";
    }else if (rowIndex==3&&columnIndex==0){
        cell.label.text=@"待添加6";
    }
    [grid setSeparatorColor:[UIColor clearColor]];//没个cell的分割线
    return cell;
}
-(NSInteger)numberOfCellsOfGridView:(UIGridView *)grid
{
    return 7;
}
-(void)gridView:(UIGridView *)grid didSelectRowAt:(int)rowIndex AndColumnAt:(int)colIndex
{
    if (rowIndex==0&&colIndex==0) {
        [self pageViewController:@"1"];
    }else if (rowIndex==0&&colIndex==1){
        [self pageViewController:@"2"];
    }else if (rowIndex==0&&colIndex==2){
        [self  pageViewController:@"3"];
    }else if (rowIndex==0&&colIndex==3){
        [self pageViewController:@"4"];
        
    }
    else if (rowIndex==1&&colIndex==0){
        [self  pageViewController:@"5"];
    }else if (rowIndex==1&&colIndex==1){
        [self  pageViewController:@"6"];
    }else if (rowIndex==1&&colIndex==2){
           [self  pageViewController:@"7"];
    }else if (rowIndex==2&&colIndex==0){
        //        [self  pageViewController:@"7"];
    }else if (rowIndex==2&&colIndex==1){
        //        [self pageViewController:@"8"];
    }else if (rowIndex==2&&colIndex==2){
        //        [self  pageViewController:@"9"];
    }else if (rowIndex==3&&colIndex==0){
        //        [self  pageViewController:@"10"];
    }
}
#pragma ViewController
-(void)pageViewController:(id)sender
{
    switch ([sender intValue]) {
        case 1:
        {
            MyBusinessCardViewController *searth=[[MyBusinessCardViewController alloc]init];
            [self.navigationController pushViewController:searth animated:YES];
          break;
        }
        case 2:{
            
            MyDynamicViewController *query=[[MyDynamicViewController alloc]init];
            [self.navigationController pushViewController:query animated:YES];
          break;
        }
        case 3:
        {
            FirstViewController *Physical=[[FirstViewController alloc]init];
            [self.navigationController pushViewController:Physical animated:YES];
             break;
        }
        case 4:{
            
            CenterViewController *center=[[CenterViewController alloc]init];
        [self.navigationController pushViewController:center animated:YES];
//            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"待更新" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//            [alert show];
            break;
        }
        case 5:{
            CharacterSetViewController *number=[[CharacterSetViewController alloc]init];
            [self.navigationController pushViewController:number animated:YES];
                       break;
        }
        case 6:{
            MyProfileViewController *restaurant=[[MyProfileViewController alloc]init];
            [self.navigationController pushViewController:restaurant animated:YES];
                    
            break;
        }
            
        case 7:
        {
          
            MySuggestionViewController *reservation=[[MySuggestionViewController alloc]init];
            [self.navigationController pushViewController:reservation animated:YES];

            break;
        }
        default:
            break;
    }
}
#pragma mark -----
#pragma mark Advertising scrolling in figure
//广告滚动换图
//#pragma mark - 5秒换图片
//- (void) handleTimer: (NSTimer *) timer
//{
//    if (TimeNum % 5 == 0 ) {
//        
//        if (!Tend) {
//            _page.currentPage++;
//            if (_page.currentPage==_page.numberOfPages-1) {
//                Tend=YES;
//            }
//        }else{
//            _page.currentPage--;
//            if (_page.currentPage==0) {
//                Tend=NO;
//            }
//        }
//        
//        [UIView animateWithDuration:0.7 //速度0.7秒
//                         animations:^{//修改坐标
//                             _scroll.contentOffset = CGPointMake(_page.currentPage*320,0);
//                         }];
//     }
//    TimeNum ++;
//}
//#pragma mark - 下载图片
//void UIImageFromURL( NSURL * URL, void (^imageBlock)(UIImage * image), void (^errorBlock)(void) )
//{
//    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
//                   {
//                       NSData * data = [[NSData alloc] initWithContentsOfURL:URL] ;
//                       UIImage * image = [[UIImage alloc] initWithData:data];
//                       dispatch_async( dispatch_get_main_queue(), ^(void){
//                           if( image != nil )
//                           {
//                               imageBlock( image );
//                           } else {
//                               errorBlock();
//                           }
//                       });
//                   });
//}
//-(void)AdImg:(NSArray*)arr{
//    [_scroll setContentSize:CGSizeMake(320*[arr count], _hight)];
//    _page.numberOfPages=[arr count];
//    
//    for ( int i=0; i<[arr count]; i++) {
//        NSString *url=((UrlAddress *)[arr objectAtIndex:i]).urlimage;
//        UIButton *img=[[UIButton alloc]initWithFrame:CGRectMake(320*i, 0, 320, _hight)];
//        [img addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
//        img.tag=i;
//        [_scroll addSubview:img];
//        UIImageFromURL( [NSURL URLWithString:url], ^( UIImage * image )
//                       {
//                           [img setImage:image forState:UIControlStateNormal];
//                       }, ^(void){
//                       });
//   } 
//}
     //点击某个图片连接地址
//-(void)Action:(UIButton*)sender{
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",((UrlAddress *)[Arr objectAtIndex:sender.tag]).urlAddress]]];
//}
#pragma AOScrollViewDelegate
-(void)buttonClick:(int)vid{
    NSLog(@"%d",vid);
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",((UrlAddress *)[Arr objectAtIndex:vid]).urlAddress]]];
}
-(void)ImageAction:(UIButton *)sender{
    if (sender.tag%2) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"你点击勇于创新图" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"你点击agent图" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}
#pragma mark -----
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILocalNotification *notification = [[[UILocalNotification alloc] init] autorelease];
    //设置10秒之后
    NSDate *pushDate = [NSDate dateWithTimeIntervalSinceNow:10];
    
    if (notification != nil) {
        
        // 设置推送时间
        notification.fireDate = pushDate;
        // 设置时区
        notification.timeZone = [NSTimeZone defaultTimeZone];
        // 设置重复间隔
        notification.repeatInterval = kCFCalendarUnitMinute;
        // 推送声音
        notification.soundName = UILocalNotificationDefaultSoundName;
        // 推送内容
        notification.alertBody = @"推送内容";
        //显示在icon上的红色圈中的数子
        notification.applicationIconBadgeNumber =1;
        //设置userinfo 方便在之后需要撤销的时候使用
        NSDictionary *info = [NSDictionary dictionaryWithObject:@"name"forKey:@"key"];
        notification.userInfo = info;
        //添加推送到UIApplication
        UIApplication *app = [UIApplication sharedApplication];
        [app scheduleLocalNotification:notification];
        
    }
   
    [self GetUpdate]; //检查是否有更新
   Present=NO;
    NSLog(@"%s",__FUNCTION__);
    self.navigationController.navigationBarHidden=YES;
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
    username.text=@"游客，您好";
    username.textColor=[UIColor whiteColor];
    username.backgroundColor=[UIColor clearColor];
    username.textAlignment=UITextAlignmentCenter;
    [self.view addSubview:username];
   if(!iphone5)
    {_hight=100;
       }
    else
    {
        _hight=130;
     }
    NSMutableArray  *mutablearr=[[NSMutableArray alloc]init];
    for (int i=0; i<[Arr count]; i++) {
        [mutablearr addObject:((UrlAddress *)[Arr objectAtIndex:i]).urlimage ];
        NSLog(@"mutablearr count==%d,urlimage==%@",[mutablearr count],((UrlAddress *)[Arr objectAtIndex:i]).urlimage );
    }
//    _scroll=[[AOScrollerView alloc]initWithNameArr:mutablearr titleArr:nil height:_hight];
//     _scroll.frame=CGRectMake(0, 44, 320, _hight);
//    _page=[[UIPageControl alloc]init];
//    _page.numberOfPages=0;
//      _scroll.pagingEnabled=YES;
//    _scroll.vDelegate = self;
//      _scroll.contentSize=CGSizeMake(320*4, 0);
//    [self.view addSubview:_scroll];
    
   _tabel=[[UIGridView alloc]initWithFrame:CGRectMake(0,_hight+44, 320,98*2) ];
    _tabel.uiGridViewDelegate=self;
     _tabel.scrollEnabled=NO;//设置表示图不滚动
    _tabel.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tabel];
    [_tabel reloadData];

    
    UIButton * Login=[UIButton buttonWithType:0];
    Login.frame=CGRectMake(320-70,5,60,30);
     [Login setTitle:@"登陆" forState:UIControlStateNormal];
    [Login setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [Login setBackgroundImage:[UIImage imageNamed:@"按钮右"] forState:UIControlStateNormal];
    [Login addTarget:self action:@selector(loginaction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Login];
    
    UIImageView *imageV=[[UIImageView alloc]init];
    if(!iphone5)
    {
       imageV.frame=CGRectMake(0, 460-70,320,35);
    }else{
        imageV.frame=CGRectMake(0, 548-78, 320, 55);
    }
    imageV.image=[UIImage imageNamed:@"走马灯背景"];
    [self.view addSubview:imageV];

    [self advertisingrequsturl];//广告
    [self performSelector:@selector(advertisingsection) withObject:nil afterDelay:5];//延迟5秒调用广告自动滚滚动
}

-(void)advertisingsection
{//广告自动滚动
//[NSTimer scheduledTimerWithTimeInterval:1 target: self selector: @selector(handleTimer:)  userInfo:nil  repeats: YES];
}
-(void)advertisingrequsturl{
    NSURL *url=[NSURL URLWithString:@"http://58.20.32.202:8090/InfoManage/SelectService.asmx/GetTopADData"];
    ASIHTTPRequest *req1=[ASIHTTPRequest requestWithURL:url];
   req1.userInfo=[NSDictionary dictionaryWithObject:@"req1" forKey:@"name"];//传一个字典用于标示是区分结果是这个请求发送的
    req1.delegate=self;
   [req1 startAsynchronous];
}
#pragma mark ASIHTTPDelegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    //成功进入该代理
    NSString *strData=[[NSString alloc]initWithData:   [request responseData] encoding:NSUTF8StringEncoding];
    NSDictionary *dic=[strData JSONValue];
    if ([[request.userInfo objectForKey:@"name"] isEqualToString:@"req1"]) {
        Arr=[[NSMutableArray alloc]init];
       NSArray *arr=[dic objectForKey:@"data"];
        for (int i=0;i<[arr count]; i++) {
            UrlAddress *URL=[[UrlAddress alloc]init];
             NSDictionary *dic=[arr objectAtIndex:i];
           URL.urlimage=[dic objectForKey:@"imageurl"];
           URL.urlAddress=[dic objectForKey:@"adurl"];
            [Arr addObject:URL];
        
            NSMutableArray  *mutablearr=[[NSMutableArray alloc]init];
            NSMutableArray *mutabletitle=[[NSMutableArray alloc]init];
            for (int i=0; i<[Arr count]; i++) {
                UrlAddress *url=((UrlAddress *)[Arr objectAtIndex:i]);
                [mutablearr addObject:url.urlimage ];//照片地址
                [mutabletitle addObject:url.urlAddress];//添加连接地址
            }
            //广告视图
            _scroll=[[AOScrollerView alloc]initWithNameArr:mutablearr titleArr:mutabletitle height:_hight];
            _scroll.vDelegate = self;
            [self.view addSubview:_scroll];

//            [self AdImg:Arr];
            }
    }else if ([[request.userInfo objectForKey:@"name"] isEqualToString:@"req2"]){
        for (int i=0; i<4; i++) {
        UIImageView *asy=[[UIImageView alloc]initWithFrame:CGRectMake(i*320, 0, 320, 100)];
          asy.image=[UIImage imageWithData:[request responseData]];
            [_scroll addSubview:asy];
        }
        }
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
    //失败进入该代理
    NSLog(@"%s",__FUNCTION__);
    
}

//登陆
-(void)loginaction:(id)sender
{
    Present=YES;
    LoginViewController *login=[[LoginViewController alloc]init];
    [self presentModalViewController:login animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark UpdateApp
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSLog(@"%s",__FUNCTION__);
    //滚动label
    NSArray *tickerStrings = [NSArray arrayWithObjects:@"最新报道新闻如下。。。。。", nil];
    _labelGPS=[[JHTickerView alloc]init];
    [_labelGPS setDirection:JHTickerDirectionLTR];//字幕滚动的方向
    [_labelGPS setTickerStrings:tickerStrings];//内容
    if(!iphone5)
    {
        _labelGPS.frame=CGRectMake(0, 460-70,320,35);
    }else{
        _labelGPS.frame=CGRectMake(0, 548-78, 320, 55);
    }
    _labelGPS.backgroundColor=[UIColor clearColor];
    [_labelGPS setTickerSpeed:60.0f];
    [_labelGPS start];//开始动画
    /*
    [_labelGPS pause];//暂停
    [_labelGPS resume];//回复*/
    [self.view addSubview:_labelGPS];
 }
-(void)viewDidDisappear:(BOOL)animated
{
//    NSLog(@"%s",__FUNCTION__);
    [_labelGPS removeFromSuperview];
    [self removeLocalNotication];//解除通知
}
- (void) removeLocalNotication {
    // 获得 UIApplication
    
    UIApplication *app = [UIApplication sharedApplication];
    
    //获取本地推送数组
    
    NSArray *localArray = [app scheduledLocalNotifications];
    
    //声明本地通知对象
    
    UILocalNotification *localNotification=nil;
    
    if (localArray) {
        
        
        for (UILocalNotification *noti in localArray) {
            
            
            NSDictionary *dict = noti.userInfo;
            
            
            if (dict) {
                
                
                NSString *inKey = [dict objectForKey:@"key"];
                
                
                if ([inKey isEqualToString:@"对应的key值"]) {
                    
                    
                    if (localNotification){
                        
                        
                        [localNotification release];
                        
                        
                        localNotification = nil;
                        
                        
                    }
                    
                    
                    localNotification = [noti retain];
                    
                    
                    break;
                    
                    
                }
                
                
            }
            
            
        }
        
        
        //判断是否找到已经存在的相同key的推送
        
        
        if (!localNotification) {
            
            
            //不存在初始化
            
            
            localNotification = [[UILocalNotification alloc] init];
            
            
        }
        
        
        
        
        if (localNotification) {
            
            
            //不推送 取消推送
            
            
            [app cancelLocalNotification:localNotification];
            
            
            [localNotification release];
            
            
            return;
            
            
        }
        
    }
}
//检查是否有新的APP版本
-(void)GetUpdate
{
    NSLog(@"%s",__FUNCTION__);
    [Harpy checkVersionupdate:YES];
}

@end
