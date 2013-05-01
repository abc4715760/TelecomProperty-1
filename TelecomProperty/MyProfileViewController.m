//
//  MyProfileViewController.m
//  TelecomProperty
//
//  Created by 邓成其 on 13-3-11.
//  Copyright (c) 2013年 chutangkeji. All rights reserved.
//

#import "MyProfileViewController.h"

@interface MyProfileViewController ()

@end

@implementation MyProfileViewController

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
    username.text=@"我的个人资料";
    username.backgroundColor=[UIColor clearColor];
    username.textColor=[UIColor whiteColor]; 
    username.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:username];
    
    UIButton *but=[UIButton buttonWithType:0];
    but.frame=CGRectMake(10, 6, 60, 30);
    [but setTitle:@"返回" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [but setBackgroundImage:[UIImage imageNamed:@"按钮左"] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(backaction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    _userimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 44, 123, 129)];
    _userimage.image=[UIImage imageNamed:@"myimage.png"];
    _userimage.userInteractionEnabled=YES;
    [self.view addSubview:_userimage];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapuserimageaction:)];
    tap.numberOfTapsRequired=1;
    [_userimage addGestureRecognizer:tap];
    
    UILabel *userlabel=[[UILabel alloc]initWithFrame:CGRectMake(139, 20+44, 60+40,60)];
    userlabel.text=@"姓名: 王晓明";
    userlabel.numberOfLines=0;
    userlabel.backgroundColor=[UIColor clearColor];
    [self.view addSubview:userlabel];
     
    UILabel *address=[[UILabel alloc]initWithFrame:CGRectMake(139, 70+44, 60+80, 60)];
    address.text=@"地址:长沙芙蓉区牧民服务区";
    address.numberOfLines=0;
    address.backgroundColor=[UIColor clearColor];
    [self.view addSubview:address];
	
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 140+44, 320, 340)   style:UITableViewStyleGrouped];
    _table.dataSource=self;
    _table.delegate=self;
    _table.backgroundView=[UIView new];
    _table.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_table];
    _ArrayTable=[[NSMutableArray alloc]initWithObjects:@"个人签名：\n  无", @"个人爱好:\n 篮球",nil];
    
}
-(void)tapuserimageaction:(id)sender
{
    UIActionSheet *Sheet=[[UIActionSheet alloc]initWithTitle:@"提示" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"相册" otherButtonTitles:@"照相", nil];
    [Sheet addButtonWithTitle:@"取消"];
    Sheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;//设置样式
    [Sheet   showInView:[UIApplication sharedApplication].keyWindow];
    /*
     注意事项，在开发过程中，发现有时候UIActionSheet的最后一项点击失效，点最后一项的上半区域时有效，这是在特定情况下才会发生，这个场景就是试用了UITabBar的时候才有。解决办法：
     在 showView时这样使用，[actionSheet showInView: [UIApplication sharedApplication].keyWindow];或者[sheet showInView: [AppDelegate sharedDelegate].tabBarController.view];这样就不会发生遮挡现象了。
     */
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"----%d---",buttonIndex);
    if (buttonIndex==0) {
        [self fromPhotoes];
    }else if(buttonIndex==1){
        [self fromcamare:nil];
    }
}
-(void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    NSLog(@"==------");
    
}
#pragma mark  相册
-(void)fromPhotoes//相册
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])//判断设备是否支持相册功能
    {
        UIImagePickerController *imagePickerC=[[UIImagePickerController alloc]init];
        //    imagePickerC.sourceType=UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        imagePickerC.sourceType=UIImagePickerControllerSourceTypePhotoLibrary; //
        //    imagePickerC.sourceType=UIImagePickerControllerSourceTypeCamera;
        imagePickerC.allowsEditing=YES;//是否对图片进行编辑
        imagePickerC.delegate=self;
        [self presentViewController:imagePickerC animated:YES completion:^{
            
        } ];//推出照片选择的页面
    }else{
        [self alertaction:@"该设备不支持相册"];
    }
    
}
-(void)alertaction:(NSString *)sender{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:sender delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
//回调方法：当选择一个照片后调用
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    _userimage.image=[info valueForKey:@"UIImagePickerControllerOriginalImage"];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }]; //关闭照片选择页面
}

//回调方法：当取消选择照片后调用
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)fromcamare:(id)sender{
    
    if ([UIImagePickerController  isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])//判断该机器是否支持相机
    {
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        picker.delegate=self;
        picker.sourceType=UIImagePickerControllerSourceTypeCamera;//照相机源代码
        [self presentModalViewController:picker animated:YES];
        
    }
    else
    {
        [self alertaction:@"该设备无法使用，没有照相机设备"];
        NSLog(@"无法使用，没有照相机设备");
    }
}

//多少块
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}
//块头的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
//设置每块section的title
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"基本信息"];
}
//每个cell的高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
//每块的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_ArrayTable count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text=[_ArrayTable objectAtIndex:indexPath.row];
    return cell;
}
//选中哪行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
NSLog(@"%d",indexPath.row);
   NSString *str= [_ArrayTable objectAtIndex:indexPath.row];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:[ NSString stringWithFormat:@"您是否修改%@",str]delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];

}
//取消哪行
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
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
