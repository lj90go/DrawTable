//
//  CurDrawView.m
//  DrawTable
//
//  Created by edutech on 15-4-23.
//  Copyright (c) 2015年 edutech. All rights reserved.
//

#import "CurDrawView.h"
#define Cornor M_PI/2
#define  FILLCOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define HeadStringColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define BottomStringColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
static CGFloat SWidth = 70;
static CGFloat SHeight = 150;
@implementation CurDrawView

-(id)initCurView:(NSMutableArray *)datas Top:(NSMutableArray *)strings Rect:(CGRect)rect Top:(NSString *)head Color:(UIColor *)color
{
    self = [super initWithFrame:rect];
    if(self)
    {
        headString = head;
        heightDatas = datas;
        bottomString = strings;
        fillColor = color;
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    for(int i=0;i<heightDatas.count;i++)
    {
        
        CGPoint start = CGPointMake(SWidth*i, SHeight);
        CGFloat height = [[heightDatas objectAtIndex:i] floatValue];
        NSString *bottomStr = [bottomString objectAtIndex:i];
        if(height>SHeight)
        {
            height = SHeight;
        }
        NSLog(@"drawing%f",height);
        CGPoint p1 = CGPointMake(SWidth*i,  SHeight);
        CGPoint p2 = CGPointMake(SWidth*i+SWidth/4, SHeight- height/4);
        CGPoint p3 = CGPointMake(SWidth*i+SWidth/4, SHeight- height*3.0/4);
        CGPoint p4 = CGPointMake(SWidth*i+SWidth/2, SHeight- height);
        CGContextSetFillColorWithColor(context, [fillColor CGColor]);
        CGContextMoveToPoint(context, p1.x, p1.y);
        CGContextAddCurveToPoint(context, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
        CGPoint p5 = CGPointMake(SWidth*i+SWidth*3/4, SHeight-height*3.0/4);
        CGPoint p6 = CGPointMake(SWidth*i+SWidth*3/4, SHeight-height/4);
        CGPoint p7 = CGPointMake(SWidth*i+SWidth, SHeight);
        CGContextAddCurveToPoint(context, p5.x, p5.y, p6.x, p6.y, p7.x, p7.y);
        CGContextMoveToPoint(context, start.x, start.y);
        CGContextAddLineToPoint(context, p7.x, p7.y);
        CGContextDrawPath(context, kCGPathFill);
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        dic[NSFontAttributeName] = [UIFont systemFontOfSize:10];
        dic[NSForegroundColorAttributeName] = BottomStringColor(0, 0, 0, 1.0);
        [self DrawText:bottomStr Attributes:dic Center:CGPointMake(SWidth*i+SWidth*1.0/2, SHeight+10)];
    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    dic[NSForegroundColorAttributeName] = HeadStringColor(0, 0, 255, 1.0);
    [self DrawText:headString Attributes:dic Center:CGPointMake(heightDatas.count*SWidth/2.0, 12)];
    dic[NSFontAttributeName ] = [UIFont systemFontOfSize:9.0];
    [self DrawText:@"2015-6-8" Attributes:dic Center:CGPointMake(heightDatas.count*SWidth/2.0, 25)];
}

-(void) DrawText:(NSString *)str Attributes:(NSDictionary *)dictory Center:(CGPoint) center
{
    if([[UIDevice currentDevice].systemVersion floatValue]>=7.0)
    {
        CGSize size = [str sizeWithAttributes:dictory];
        float x = center.x - size.width/2.0;
        float y = center.y - size.height/2.0;
        [str drawAtPoint:CGPointMake(x, y) withAttributes:dictory];
    }else
    {
        CGSize size ;
        NSAttributedString *attr = nil;
        if(dictory[NSFontAttributeName])
        {
            size = [str sizeWithAttributes:dictory[NSFontAttributeName]];
            attr = [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:[UIFont systemFontSize]]}];
        }else
        {
            size = [str sizeWithAttributes:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
            attr = [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:[UIFont systemFontSize]]}];
        }
        
        float x = center.x - size.width/2.0;
        float y = center.y - size.height/2.0;
        [str drawAtPoint:CGPointMake(x, y) withAttributes:dictory];
    }
    
}

@end
