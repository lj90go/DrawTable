//
//  RectsDrawView.m
//  DrawTable
//
//  Created by edutech on 15-4-24.
//  Copyright (c) 2015年 edutech. All rights reserved.
//

#import "RectsDrawView.h"

#define HeadStringColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@implementation RectsDrawView
{
    float singleWidth;
    float singleHeight;
    float top;
    float left;
}
//view 上面添加文字
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
    CGPoint center2 = CGPointMake(9, 30);
    [self DrawText:str2 Attribute:attr2 Center:center2];
    
    top = 37;
    left = 18;
    singleWidth = (self.frame.size.width-left)*1.0/rowNumber;
    singleHeight = (self.frame.size.height-top)/rankNumber;
    CGRect rt = CGRectMake(left, top, self.frame.size.width-10, self.frame.size.height-top);
    CGContextSetRGBFillColor(context, 240/255.0, 240/255.0, 240/255.0, 1.0);
    CGContextFillRect(context, rt);//画背景图片
    
    //画垂直白线和文字
    for(int i=0; i<rowNumber;i++)
    {
        NSString *str = [NSString stringWithFormat:@"%.f",(i+1)*rowSingle];
        NSMutableDictionary *attr = [[NSMutableDictionary alloc] init];
        attr[NSFontAttributeName] = [UIFont systemFontOfSize:8];
        attr[NSForegroundColorAttributeName] = [UIColor blackColor];
        CGPoint center = CGPointMake(i*singleWidth+1.0/2*singleWidth+left, 30);
        [self DrawText:str Attribute:attr Center:center];
        if(i<rowNumber-1)
        {
            CGContextMoveToPoint(context, (i+1)*singleWidth+left, top);
            CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
            CGContextSetLineWidth(context, 1.0);
            CGContextAddLineToPoint(context, (i+1)*singleWidth+left, self.frame.size.height);
            CGContextStrokePath(context);
        }
    }
    
    //画水平白线和文字
    for(int j=0;j<rankNumber;j++)
    {
        NSString *str = [NSString stringWithFormat:@"%.f",(j+1)*rankSingle+startRank];
        NSMutableDictionary *attr = [[NSMutableDictionary alloc] init];
        attr[NSFontAttributeName] = [UIFont systemFontOfSize:8];
        attr[NSForegroundColorAttributeName] = [UIColor blackColor];
        CGPoint center = CGPointMake(8, j*singleHeight+1.0/2*singleHeight+top);
        [self DrawText:str Attribute:attr Center:center];
        if(j<rankNumber-1)
        {
            CGContextMoveToPoint(context, left, (j+1)*singleHeight+top);
            CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
            CGContextSetLineWidth(context, 1.0);
            CGContextAddLineToPoint(context, self.frame.size.width, (j+1)*singleHeight+top);
            CGContextStrokePath(context);
        }
    }
    float singlevalue = (self.frame.size.height-top)*1.0/(rankSingle * rankNumber);
    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextSetLineWidth(context, 1.0);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    //画折线
    CGPoint beforePoint;
    for(int k=0;k<tableDatas.count;k++)
    {
        int value = [[tableDatas objectAtIndex:k] intValue];
        float x = k*singleWidth+1.0/2*singleWidth+left;
        float y = (value-startRank) *singlevalue  + top;
        if(k==0)
        {
            CGContextMoveToPoint(context, x, y);
            beforePoint = CGPointMake(x, y);
        }else
        {
            CGContextAddLineToPoint(context, x, y);
            beforePoint = CGPointMake(x, y);
        }
    }
    CGContextStrokePath(context);
    
    CGContextSetLineWidth(context, 1.5);
    
    //画圆圈和文字
    for(int k=0;k<tableDatas.count;k++)
    {
        int value = [[tableDatas objectAtIndex:k] intValue];
        int value2 = value;
        if(k<tableDatas.count-1)
        {
            value2 = [[tableDatas objectAtIndex:k+1] intValue];
        }
        float x = k*singleWidth+1.0/2*singleWidth+left;
        float y = (value-startRank) *singlevalue + top;
        
        NSString *str = [NSString stringWithFormat:@"%d",value];
        NSMutableDictionary *attr = [[NSMutableDictionary alloc] init];
        attr[NSFontAttributeName] = [UIFont systemFontOfSize:6];
        attr[NSForegroundColorAttributeName] = [UIColor grayColor];
        CGPoint center;
        if(value2<value)
        {
            center = CGPointMake(x+6, y+5);
        }else
        {
            center = CGPointMake(x+6, y-5);
        }
        if(y>=self.frame.size.height-4)
        {
            center = CGPointMake(x, y-8);
        }
        [self DrawText:str Attribute:attr Center:center];

        CGRect rt = CGRectMake(x-2, y-2, 4, 4);
        
        CGContextMoveToPoint(context, x, y);
        if(value2<value)
        {
            rt = CGRectMake(x-2, y-2, 4, 4);
        }
        if(y>=self.frame.size.height-4)
        {
            rt = CGRectMake(x-2, y-3, 4, 4);
        }
        CGContextMoveToPoint(context, x, y);
        CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1.0);
        CGContextAddEllipseInRect(context, rt);
    }
    CGContextStrokePath(context);

}

-(void)DrawText:(NSString *)str Attribute:(NSDictionary *)attr Center:(CGPoint) center
{
    CGSize size = [str sizeWithAttributes:attr];
    float x = center.x - size.width/2.0;
    float y = center.y - size.height/2.0;
    [str drawAtPoint:CGPointMake(x, y) withAttributes:attr];
}
@end

