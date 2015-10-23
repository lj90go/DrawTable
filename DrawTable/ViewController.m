//
//  ViewController.m
//  DrawTable
//
//  Created by edutech on 15-4-23.
//  Copyright (c) 2015年 edutech. All rights reserved.
//

#import "ViewController.h"
#import "CurDrawView.h"
#import "RectsDrawView.h"
#import "PillarDrawView.h"
#import "CircleDrawView.h"
@interface ViewController ()
{
    UIScrollView *scrollView;
    int time;
    NSTimer *timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 520)];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1300);
    NSMutableArray *arrays = [[NSMutableArray alloc] init];
    NSMutableArray *strings = [[NSMutableArray alloc] init];
    NSString *name = @"第一个数据显示";
    [arrays addObject:[NSNumber numberWithFloat:70]];
    [arrays addObject:[NSNumber numberWithFloat:90]];
    [arrays addObject:[NSNumber numberWithFloat:120]];
    [arrays addObject:[NSNumber numberWithFloat:5]];
    [strings addObject:@"第一格"];
    [strings addObject:@"第二格"];
    [strings addObject:@"第三格"];
    [strings addObject:@"第四格"];
    CurDrawView *view = [[CurDrawView alloc] initCurView:arrays Top:strings Rect:CGRectMake(20, 0, self.view.frame.size.width, 220) Top:name Color:[UIColor blueColor]];
    [scrollView addSubview:view];
    
    NSMutableArray *arrays1 = [[NSMutableArray alloc] init];
    NSMutableArray *strings1 = [[NSMutableArray alloc] init];
    NSString *name1 = @"第二个数据显示";
    [arrays1 addObject:[NSNumber numberWithFloat:50]];
    [arrays1 addObject:[NSNumber numberWithFloat:60]];
    [arrays1 addObject:[NSNumber numberWithFloat:70]];
    [arrays1 addObject:[NSNumber numberWithFloat:80]];
    [strings1 addObject:@"第五格"];
    [strings1 addObject:@"第六格"];
    [strings1 addObject:@"第七格"];
    [strings1 addObject:@"第八格"];
    CurDrawView *view1 = [[CurDrawView alloc] initCurView:arrays1 Top:strings1 Rect:CGRectMake(20, 175, self.view.frame.size.width, 190) Top:name1 Color:[UIColor redColor]];
    [scrollView addSubview:view1];
    
    NSMutableArray *arrays2 = [[NSMutableArray alloc] init];
    NSMutableArray *strings2 = [[NSMutableArray alloc] init];
    NSString *name2 = @"第三个数据显示";
    [arrays2 addObject:[NSNumber numberWithFloat:90]];
    [arrays2 addObject:[NSNumber numberWithFloat:90]];
    [arrays2 addObject:[NSNumber numberWithFloat:90]];
    [arrays2 addObject:[NSNumber numberWithFloat:90]];
    [strings2 addObject:@"第九格"];
    [strings2 addObject:@"第十格"];
    [strings2 addObject:@"第十一格"];
    [strings2 addObject:@"第十二格"];
    CurDrawView *view2 = [[CurDrawView alloc] initCurView:arrays2 Top:strings2 Rect:CGRectMake(20, 350, self.view.frame.size.width, 170) Top:name2 Color:[UIColor greenColor]];
    [scrollView addSubview:view2];
    NSMutableArray *rectData1 = [[NSMutableArray alloc] init];
    [rectData1 addObject:[NSNumber numberWithInt:80]];
    [rectData1 addObject:[NSNumber numberWithInt:65]];
    [rectData1 addObject:[NSNumber numberWithInt:42]];
    [rectData1 addObject:[NSNumber numberWithInt:8]];
    [rectData1 addObject:[NSNumber numberWithInt:20]];
    [rectData1 addObject:[NSNumber numberWithInt:55]];
    [rectData1 addObject:[NSNumber numberWithInt:80]];
    [rectData1 addObject:[NSNumber numberWithInt:99]];
    [rectData1 addObject:[NSNumber numberWithInt:70]];
    [rectData1 addObject:[NSNumber numberWithInt:30]];
    RectsDrawView *view3 = [[RectsDrawView alloc] initRects: rectData1 Row:10 Rank:5 Rect:CGRectMake(20, 530, self.view.frame.size.width-40, 150) Hear:@"折线图形1" RowSingle:1 Rank:20 StartRank:0];
    [scrollView addSubview:view3];
    
    NSMutableArray *rectData2 = [[NSMutableArray alloc] init];
    [rectData2 addObject:[NSNumber numberWithInt:40]];
    [rectData2 addObject:[NSNumber numberWithInt:65]];
    [rectData2 addObject:[NSNumber numberWithInt:32]];
    [rectData2 addObject:[NSNumber numberWithInt:5]];
    [rectData2 addObject:[NSNumber numberWithInt:20]];
    [rectData2 addObject:[NSNumber numberWithInt:55]];
    [rectData2 addObject:[NSNumber numberWithInt:80]];
    [rectData2 addObject:[NSNumber numberWithInt:60]];
    [rectData2 addObject:[NSNumber numberWithInt:50]];
    [rectData2 addObject:[NSNumber numberWithInt:42]];
    [rectData2 addObject:[NSNumber numberWithInt:35]];
    [rectData2 addObject:[NSNumber numberWithInt:60]];
    [rectData2 addObject:[NSNumber numberWithInt:9]];
    [rectData2 addObject:[NSNumber numberWithInt:12]];
    [rectData2 addObject:[NSNumber numberWithInt:3]];
    PillarDrawView *view4 = [[PillarDrawView alloc] initRects: rectData2 Row:10 Rank:8 Rect:CGRectMake(20, 700, self.view.frame.size.width-40, 150) Hear:@"折线图形2" RowSingle:1 Rank:10  StartRank:0];
    [scrollView addSubview:view4];
    
    NSMutableArray *rectData3 = [[NSMutableArray alloc] init];
    [rectData3 addObject:[NSNumber numberWithInt:60]];
    [rectData3 addObject:[NSNumber numberWithInt:105]];
    [rectData3 addObject:[NSNumber numberWithInt:72]];
    [rectData3 addObject:[NSNumber numberWithInt:48]];
    [rectData3 addObject:[NSNumber numberWithInt:60]];
    [rectData3 addObject:[NSNumber numberWithInt:95]];
    [rectData3 addObject:[NSNumber numberWithInt:120]];
    [rectData3 addObject:[NSNumber numberWithInt:100]];
    [rectData3 addObject:[NSNumber numberWithInt:90]];
    [rectData3 addObject:[NSNumber numberWithInt:82]];
    [rectData3 addObject:[NSNumber numberWithInt:75]];
    [rectData3 addObject:[NSNumber numberWithInt:100]];
    [rectData3 addObject:[NSNumber numberWithInt:49]];
    [rectData3 addObject:[NSNumber numberWithInt:52]];
    [rectData3 addObject:[NSNumber numberWithInt:43]];
    RectsDrawView *view5 = [[RectsDrawView alloc] initRects: rectData3 Row:15 Rank:8 Rect:CGRectMake(20, 880, self.view.frame.size.width-40, 150) Hear:@"折线图形3" RowSingle:2 Rank:10  StartRank:40];
    [scrollView addSubview:view5];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 1060, self.view.frame.size.width-20, 40);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"饼状图" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(DrawCircle) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    [self.view addSubview:scrollView];

    NSDate *date = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"YYYY-MM-dd-hh-mm-ss"];
    NSLog(@"%@",[format stringFromDate:date]);
    
    
}
-(void)DrawCircle
{
//    NSThread *thread = [[NSThread alloc] initWithTarget:self  selector:@selector(RunCircle) object:nil];
//    [thread start];
//    [self RunCircle];
//    time = 0;
//    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(RunCircle) userInfo:nil repeats:YES];
//    dispatch_queue_t queue = dispatch_queue_create("dispqtch", nil);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self RunCircle];
//    });
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(RunCircle) object:nil];
    [thread start];
}
-(void)RunCircle
{
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [colors addObject:[UIColor blackColor]];
    [colors addObject:[UIColor redColor]];
    [colors addObject:[UIColor greenColor]];
    [colors addObject:[UIColor blueColor]];
    [colors addObject:[UIColor yellowColor]];
    [colors addObject:[UIColor blackColor]];
    [colors addObject:[UIColor redColor]];
    [colors addObject:[UIColor greenColor]];
    [colors addObject:[UIColor blueColor]];
    [colors addObject:[UIColor yellowColor]];
    [colors addObject:[UIColor blackColor]];
    [colors addObject:[UIColor redColor]];
    [colors addObject:[UIColor greenColor]];
    [colors addObject:[UIColor blueColor]];
    [colors addObject:[UIColor yellowColor]];
    [colors addObject:[UIColor redColor]];
    [colors addObject:[UIColor greenColor]];
    [colors addObject:[UIColor blueColor]];
    [colors addObject:[UIColor yellowColor]];
    NSMutableArray *circlestrings = [[NSMutableArray alloc] init];
    [circlestrings addObject:@"体育分数50"];
    [circlestrings addObject:@"数学分数90"];
    [circlestrings addObject:@"英语分数150"];
    [circlestrings addObject:@"课外分数30"];
    [circlestrings addObject:@"地理分数80"];
    [circlestrings addObject:@"生物分数50"];
    [circlestrings addObject:@"化学分数90"];
    [circlestrings addObject:@"语文分数150"];
    [circlestrings addObject:@"综合管理分数30"];
    [circlestrings addObject:@"系统分数80"];
    [circlestrings addObject:@"计算机分数50"];
    [circlestrings addObject:@"体育分数90"];
    [circlestrings addObject:@"软件工程分数150"];
    [circlestrings addObject:@"信息分数30"];
    [circlestrings addObject:@"物理分数80"];
    [circlestrings addObject:@"编程c分数30"];
    [circlestrings addObject:@"java编程分数30"];
    [circlestrings addObject:@"高等数学分数30"];
    [circlestrings addObject:@"大学英语分数30"];
    NSMutableArray *circleDatas = [[NSMutableArray alloc] init];
    [circleDatas addObject:[NSNumber numberWithInt:50]];
    [circleDatas addObject:[NSNumber numberWithInt:90]];
    [circleDatas addObject:[NSNumber numberWithInt:150]];
    [circleDatas addObject:[NSNumber numberWithInt:30]];
    [circleDatas addObject:[NSNumber numberWithInt:80]];
    [circleDatas addObject:[NSNumber numberWithInt:50]];
    [circleDatas addObject:[NSNumber numberWithInt:90]];
    [circleDatas addObject:[NSNumber numberWithInt:150]];
    [circleDatas addObject:[NSNumber numberWithInt:30]];
    [circleDatas addObject:[NSNumber numberWithInt:80]];
    [circleDatas addObject:[NSNumber numberWithInt:50]];
    [circleDatas addObject:[NSNumber numberWithInt:90]];
    [circleDatas addObject:[NSNumber numberWithInt:150]];
    [circleDatas addObject:[NSNumber numberWithInt:30]];
    [circleDatas addObject:[NSNumber numberWithInt:80]];
    [circleDatas addObject:[NSNumber numberWithInt:30]];
    [circleDatas addObject:[NSNumber numberWithInt:30]];
    [circleDatas addObject:[NSNumber numberWithInt:30]];
    [circleDatas addObject:[NSNumber numberWithInt:30]];
    
    NSString *centerString = @"学科分数统计图";
    //    CircleDrawView *viewCircle = [[CircleDrawView alloc] initCircleView:colors Percents:circleDatas Strings:circlestrings CenterString:centerString Rect:CGRectMake(10, 1060, self.view.frame.size.width-20, 180)];
    //    viewCircle.tag = 100;
    //    [scrollView addSubview:viewCircle];
    //    [self.view addSubview:scrollView];
    for(int i=0;i<100;i++)
    {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            CircleDrawView *view = (CircleDrawView*)[self.view viewWithTag:100];
            if(view)
            {
                [view removeFromSuperview];
            }
            view = [[CircleDrawView alloc] initCircleView:colors Percents:circleDatas Strings:circlestrings CenterString:centerString Rect:CGRectMake(10, 1100, self.view.frame.size.width-20, 200)];
            view.tag = 100;
            [view setProgress:0.01*i+0.01];
            [scrollView addSubview:view];

        });
//        dispatch_async(dispatch_get_main_queue(), ^{
//            CircleDrawView *view = (CircleDrawView*)[self.view viewWithTag:100];
//            if(view)
//            {
//                [view removeFromSuperview];
//            }
//            view = [[CircleDrawView alloc] initCircleView:colors Percents:circleDatas Strings:circlestrings CenterString:centerString Rect:CGRectMake(10, 1100, self.view.frame.size.width-20, 180)];
//            view.tag = 100;
//            [view setProgress:0.02*i+0.01];
//            [scrollView addSubview:view];
//            
//        });
        [NSThread sleepForTimeInterval:0.01];

    }
//    time ++;
//    if(time>5)
//    {
//        if(timer)
//        {
//            [timer invalidate];
//        }
//    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
