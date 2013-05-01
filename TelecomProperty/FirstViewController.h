//
//  FirstViewController.h
//  Test04
//
//  Created by HuHongbing on 9/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadView.h"
#import "DetailViewController.h"
#import "ASIHTTPRequest.h"
#import "Announcements.h"
#import "LoadMoreTableFooterView.h"//上提显示更多
#import "EGORefreshTableHeaderView.h"//下拉刷新
@interface FirstViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,HeadViewDelegate,ASIHTTPRequestDelegate,LoadMoreTableFooterDelegate,EGORefreshTableHeaderDelegate,NSURLConnectionDataDelegate>{
    UITableView* _tableView;
    NSInteger _currentSection;
    NSInteger _currentRow;
    int c;//控制页数的
    BOOL reloading;
     LoadMoreTableFooterView *loadMoreFooterVIew;//上提显示更多的对象
    EGORefreshTableHeaderView *refreshHeaderView;//下拉刷新对象
    BOOL IsImage;
}
@property(nonatomic, retain) NSMutableArray* headViewArray;
@property(nonatomic, retain) UITableView* tableView;
@property(nonatomic, retain)NSMutableArray *titlArray;
@property(nonatomic, retain)NSMutableArray *subtitlArray;
@property(nonatomic,retain) NSMutableData *Mdata;

@end
