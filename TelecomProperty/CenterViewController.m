//
//  CenterViewController.m
//  WaterFlowViewDemo
//
//  Created by Smallsmall on 12-6-11.
//  Copyright (c) 2012年 activation group. All rights reserved.
//

#import "CenterViewController.h"

@implementation CenterViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)loadInternetData {
    // Request
    NSString *URLPath = [NSString stringWithFormat:@"http://imgur.com/gallery.json"];
    NSURL *URL = [NSURL URLWithString:URLPath];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
        
        if (!error && responseCode ==200) {
            id res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            if (res && [res isKindOfClass:[NSDictionary class]]) {
//                NSArray *arr=[res objectForKey:@"data"];
//                NSMutableArray *array=[[NSMutableArray alloc]init];
//                for (int i=numberPrevious; i<numberpage; i++) {
//                    NSLog(@"%@",[arr objectAtIndex:i]);
//                    [arrayData addObject:[arr objectAtIndex:i]];
//                   
//                }
//                [arrayData addObjectsFromArray:array];
                NSLog(@"arrayData count=%d",[arrayData count]);
      [arrayData addObjectsFromArray:[res objectForKey:@"data"]];
                    NSLog(@"%d",[[res objectForKey:@"data"] count]);
                //添加数据
      
                [self dataSourceDidLoad];
            } else {
                [self dataSourceDidError];
              
            }
        } else {
            [self dataSourceDidError];
         
        }
    }];
}

- (void)dataSourceDidLoad {
    [waterFlow reloadData];
}

- (void)dataSourceDidError {
    [waterFlow reloadData];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    numberpage=3;
    numberPrevious=0; /*开始取12张图*/
    arrayData = [[NSMutableArray alloc] init];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"More" style:UIBarButtonItemStyleBordered target:self action:@selector(loadMore)];
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
    username.text=@"小区实景";
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
    waterFlow = [[WaterFlowView alloc] initWithFrame:CGRectMake(0, 44, 320, 460-44-44)];
    waterFlow.waterFlowViewDelegate = self;
    waterFlow.waterFlowViewDatasource = self;
    waterFlow.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:waterFlow];
//    [waterFlow release];
     [self loadInternetData];
}

-(void)backaction:(id)sender
{
      [self.navigationController popViewControllerAnimated:YES];
}
//显示更多
-(void)loadMore{
    numberpage=numberpage+3;
    numberPrevious=numberpage-3;//
    [self loadInternetData];//加载
//    [arrayData addObjectsFromArray:arrayData];
//    [waterFlow reloadData];
}

#pragma mark WaterFlowViewDataSource
- (NSInteger)numberOfColumsInWaterFlowView:(WaterFlowView *)waterFlowView{

    return 3;
}
- (NSInteger)numberOfAllWaterFlowView:(WaterFlowView *)waterFlowView{

    return [arrayData count];
}
//每个单元格显示的内容视图
- (UIView *)waterFlowView:(WaterFlowView *)waterFlowView cellForRowAtIndexPath:(IndexPath *)indexPath{
    
    ImageViewCell *view = [[ImageViewCell alloc] initWithIdentifier:nil];
    UILabel *l=[[UILabel alloc]initWithFrame:CGRectMake(0, 0,80, 30)];
    l.textColor=[UIColor redColor];
    l.text=[NSString stringWithFormat:@"%d",(waterFlowView.columnCount *indexPath.row+indexPath.column)];
      l.text=[[arrayData objectAtIndex:(waterFlowView.columnCount *indexPath.row+indexPath.column)] objectForKey:@"hash"];
    l.backgroundColor=[UIColor clearColor];
    [view addSubview:l];
    return view;
}

// 找到每张图片的对应的连接地址  发送请求
-(void)waterFlowView:(WaterFlowView *)waterFlowView  relayoutCellSubview:(UIView *)view withIndexPath:(IndexPath *)indexPath{
    //arrIndex是某个数据在总数组中的索引 
    int arrIndex = indexPath.row * waterFlowView.columnCount + indexPath.column;//waterFlowView.columnCount 是分多少列 indexPath.column是这个图在哪一列  indexPath.row 是在哪一行
   NSDictionary *object = [arrayData objectAtIndex:arrIndex];
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://imgur.com/%@%@", [object objectForKey:@"hash"], [object objectForKey:@"ext"]]];
   
    ImageViewCell *imageViewCell = (ImageViewCell *)view;
    imageViewCell.indexPath = indexPath;
    imageViewCell.columnCount = waterFlowView.columnCount;
    [imageViewCell relayoutViews];
    [(ImageViewCell *)view setImageWithURL:URL];
}


#pragma mark WaterFlowViewDelegate
- (CGFloat)waterFlowView:(WaterFlowView *)waterFlowView heightForRowAtIndexPath:(IndexPath *)indexPath{
/*
    设置每个cell的高度适应内容高度
 */
//    int arrIndex = indexPath.row * waterFlowView.columnCount + indexPath.column;
//    NSDictionary *dict = [arrayData objectAtIndex:arrIndex];
//    
//    float width = 0.0f;
//    float height = 0.0f;
//    if (dict) {
//        width = [[dict objectForKey:@"width"] floatValue]; 
//        height = [[dict objectForKey:@"height"] floatValue];
//        /*
//         字典取出的高度 或宽带有可能为0  要设为1  不然除就会蹦
//         */
//        if (width==0) {
//            width=1.f;
//        }if (height==0) {
//            height=1.f;
//        }
//    }
//    return waterFlowView.cellWidth * (height/width);
    return 100;
}

- (void)waterFlowView:(WaterFlowView *)waterFlowView didSelectRowAtIndexPath:(IndexPath *)indexPath{
    NSLog(@"waterFlowView.columnCount==%d",waterFlowView.columnCount);
    NSLog(@"indexpath row == %d,column == %d",indexPath.row,indexPath.column);
    NSString *strmessage=[NSString  stringWithFormat:@"您点击了第%d张图片",(waterFlowView.columnCount *indexPath.row+indexPath.column)+1];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:strmessage delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
