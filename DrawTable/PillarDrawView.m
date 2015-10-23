//
//  PillarDrawView.m
//  DrawTable
//
//  Created by edutech on 15-4-24.
//  Copyright (c) 2015年 edutech. All rights reserved.
//

#import "PillarDrawView.h"

#define PILLAR_WIDTH 14
@implementation PillarDrawView
{
    float singleWidth;
    float singleHeight;
    float top;
    float left;
    float bottom;
}
-(id)initRects:(NSMutableArray *)datas Row:(int)row Rank:(int)rank Rect:(CGRect)rect Hear:(NSString *)head RowSingle:(float)rsingle Rank:(float)rkSingle StartRank:(float)start
{
    self = [super initWithFrame:rect];
    if(self)
    {
        tableDatas = datas;
        headString = head;
        rankNumber = rank;
        rowNumber = row;
        rowSingle = rsingle;
        rankSingle = rkSingle;
        startRank = start;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSString *str = (headString==nil)?@"":headString;
    NSMutableDictionary *attr = [[NSMutableDictionary alloc] init];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    attr[NSForegroundColorAttributeName] = [UIColor blueColor];
    CGPoint center = CGPointMake(self.frame.size.width/2.0, 12);
    [self DrawText:str Attribute:attr Center:center];
    
    NSString *str2 = [NSString stringWithFormat:@"%.f",startRank];
    NSMutableDictionary *attr2 = [[NSMutableDictionary alloc] init];
    attr2[NSFontAttributeName] = [UIFont systemFontOfSize:8];
    attr2[NSForegroundColorAttributeName] = [UIColor blackColor];
    CGPoint center2 = CGPointMake(9, self.frame.size.height-8);
    [self DrawText:str2 Attribute:attr2 Center:center2];
    
    top = 20;
    left = 18;
    bottom = 15;
    singleWidth = (self.frame.size.width-left)*1.0/rowNumber;
    singleHeight = (self.frame.size.height-top-bottom)/rankNumber;
    CGRect rt = CGRectMake(left, top, self.frame.size.width-10, self.frame.size.height-top-bottom);
    CGContextSetRGBFillColor(context, 240/255.0, 240/255.0, 240/255.0, 1.0);
    CGContextFillRect(context, rt);//画背景图片
    //画水平文字
    for(int i=0; i<rowNumber;i++)
    {
        NSString *str = [NSString stringWithFormat:@"%.f",(i+1)*rowSingle];
        NSMutableDictionary *attr = [[NSMutableDictionary alloc] init];
        attr[NSFontAttributeName] = [UIFont systemFontOfSize:8];
        attr[NSForegroundColorAttributeName] = [UIColor blackColor];
        CGPoint center = CGPointMake(i*singleWidth+1.0/2*singleWidth+left, self.frame.size.height-bottom/2);
        [self DrawText:str Attribute:attr Center:center];
    }
    
    //画水平白线和垂直文字
    for(int j=0;j<rankNumber;j++)
    {
        NSString *str = [NSString stringWithFormat:@"%.f",(j+1)*rankSingle+startRank];
        NSMutableDictionary *attr = [[NSMutableDictionary alloc] init];
        attr[NSFontAttributeName] = [UIFont systemFontOfSize:8];
        attr[NSForegroundColorAttributeName] = [UIColor blackColor];
        CGPoint center = CGPointMake(8, self.frame.size.height-bottom/2- (j+1)*singleHeight);
        [self DrawText:str Attribute:attr Center:center];
        if(j<rankNumber-1)
        {
            CGContextMoveToPoint(context, left, self.frame.size.height-bottom-(j+1)*singleHeight);
            CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
            CGContextSetLineWidth(context, 1.0);
            CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height-bottom-(j+1)*singleHeight);
            CGContextStrokePath(context);
        }
    }
    float singlevalue = (self.frame.size.height-top - bottom)*1.0/(rankSingle * rankNumber);
    for(int i=0;i<tableDatas.count;i++)
    {
        CGPoint startPoint = CGPointMake(left+singleWidth-PILLAR_WIDTH+i*singleWidth, self.frame.size.height-bottom-2);
        int value = [[tableDatas objectAtIndex:i] intValue];
//        float width = singleWidth * 0.5;
        float height = (value -startRank) *singlevalue-2.0/4*PILLAR_WIDTH;
        CGSize pillarSize = CGSizeMake(PILLAR_WIDTH, height);
        [self DrawPillar:context Size:pillarSize Position:startPoint];
        
        NSString *valueStr = [NSString stringWithFormat:@"%d",value];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        dic[NSFontAttributeName] = [UIFont systemFontOfSize:6];
        dic[NSForegroundColorAttributeName] = [UIColor blackColor];
        CGPoint center = CGPointMake(startPoint.x+PILLAR_WIDTH/2.0f, self.frame.size.height-bottom-height-PILLAR_WIDTH*2/3.0);
        [self DrawText:valueStr Attribute:dic Center:center];
    }
}

-(void)DrawPillar:(CGContextRef) context Size:(CGSize)size Position:(CGPoint) point
{
    CGPoint p1 = CGPointMake(point.x, point.y);
    CGPoint p2 = CGPointMake(point.x+size.width*3.0/4, point.y);
    CGPoint p3 = CGPointMake(point.x, point.y-size.height);
    CGPoint p4 = CGPointMake(point.x+size.width*3.0/4, point.y-size.height);
    CGPoint p7 = CGPointMake(point.x+size.width, point.y - size.width*1.0/4);
    CGPoint p6 = CGPointMake(point.x+size.width, point.y-size.height -size.width*1.0/4);
    CGPoint p5 = CGPointMake(point.x+size.width*1.0/4, point.y-size.height -size.width*1.0/4);
    if(size.height<5)
    {
        p3 = CGPointMake(point.x, point.y-size.height-3);
        p4 = CGPointMake(point.x+size.width*3.0/4, point.y-size.height-3);
        p6 = CGPointMake(point.x+size.width, point.y -size.height-3 -size.width*1.0/4);
        p5 = CGPointMake(point.x+size.width*1.0/4, point.y-size.height-3 -size.width*1.0/4);
    }
    CGContextSetRGBFillColor(context, 45/255.0, 93/255.0, 166.0/255.0, 1.0);
    CGContextMoveToPoint(context, p1.x, p1.y);
    CGContextAddLineToPoint(context, p2.x, p2.y);
    CGContextAddLineToPoint(context, p4.x, p4.y);
    CGContextAddLineToPoint(context, p3.x, p3.y);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextSetRGBFillColor(context, 21/255.0, 42/255.0, 82/255.0, 1.0);
    CGContextMoveToPoint(context, p3.x, p3.y);
    CGContextAddLineToPoint(context, p4.x, p4.y);
    CGContextAddLineToPoint(context, p6.x, p6.y);
    CGContextAddLineToPoint(context, p5.x, p5.y);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextSetRGBFillColor(context, 21/255.0, 42/255.0, 82/255.0, 1.0);
    CGContextMoveToPoint(context, p4.x, p4.y);
    CGContextAddLineToPoint(context, p6.x, p6.y);
    CGContextAddLineToPoint(context, p7.x, p7.y);
    CGContextAddLineToPoint(context, p2.x, p2.y);
    CGContextDrawPath(context, kCGPathFill);
}

-(void)DrawText:(NSString *)str Attribute:(NSDictionary *)attr Center:(CGPoint) center
{
    CGSize size = [str sizeWithAttributes:attr];
    float x = center.x - size.width/2.0;
    float y = center.y - size.height/2.0;
    [str drawAtPoint:CGPointMake(x, y) withAttributes:attr];
}
@end
