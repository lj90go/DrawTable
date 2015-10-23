//
//  CircleDrawView.m
//  DrawTable
//
//  Created by edutech on 15-4-24.
//  Copyright (c) 2015年 edutech. All rights reserved.
//

#import "CircleDrawView.h"
#define CircleRadius 70
@implementation CircleDrawView
{
    int totalPer;
    NSMutableArray *radiusArrays;
    float beforeHeight;
}

-(id)initCircleView:(NSMutableArray *)Colors Percents:(NSMutableArray *)datas Strings:(NSMutableArray *)strings CenterString:(NSString *)center Rect:(CGRect)rect
{
    self = [super initWithFrame:rect];
    if(self)
    {
        colorArrays = Colors;
        dataArrays = datas;
        stringArrays = strings;
        centerString = center;
        totalPer = 0;
//        progress = 1.0;
        for(int i=0;i<datas.count;i++)
        {
            totalPer += [[datas objectAtIndex:i] intValue];
        }
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)setProgress:(float)p
{
    progress = p;
}
-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    if(self.frame.size.height<140)
    {
        return;
    }
    CGFloat beforeRaidus = 0;
    CGContextSetLineWidth(context, 25);
    radiusArrays = [[NSMutableArray alloc] init];
    for(int i=0;i<dataArrays.count;i++)
    {
        int value = [[dataArrays objectAtIndex:i] intValue];
        UIColor *color = [colorArrays objectAtIndex:i];
        float temp = value*1.0f/totalPer*360;
        float radius = value*1.0f/totalPer*360 +beforeRaidus;
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextMoveToPoint(context, self.frame.size.width/2, self.frame.size.height/2);
        [radiusArrays addObject:[NSNumber numberWithFloat:radius]];
        if(i==dataArrays.count-1)
        {
            if(progress>=1)
            {
                CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, CircleRadius, beforeRaidus*M_PI/180, 360*M_PI/180, 0);
            }else
            {
//                CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, CircleRadius, beforeRaidus*M_PI/180, progress*2*M_PI, 0);
            }
        }else if(progress>=beforeRaidus/360)
        {
            if(progress>radius/360)
            {
                CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, CircleRadius, beforeRaidus*M_PI/180, radius*M_PI/180, 0);
            }else
            {
                CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, CircleRadius, beforeRaidus*M_PI/180, progress*360*M_PI/180, 0);
            }
        }else
        {
//            CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, CircleRadius, beforeRaidus*M_PI/180, progress*2*M_PI, 0);
        }
        beforeRaidus = radius;

        CGContextFillPath(context);

       
    }
    
    CGContextSetRGBFillColor(context, 1.0, 1.0,1.0, 1.0);
    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, 35, 0*M_PI/180, 360*M_PI/180, 1);
    CGContextDrawPath(context, kCGPathFill);
    
    NSString *str2 = (centerString==nil)?@"":centerString;
    NSMutableDictionary *attr2 = [[NSMutableDictionary alloc] init];
    attr2[NSFontAttributeName] = [UIFont systemFontOfSize:9];
    attr2[NSForegroundColorAttributeName] = [UIColor blueColor];
    CGPoint center2 = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    CGSize size = [str2 sizeWithAttributes:attr2];
    if(size.width>70&&progress>=1)
    {
        NSString *str_1 = [str2 substringWithRange:NSMakeRange(0, 7)];
        NSString *str_2 = [str2 substringWithRange:NSMakeRange(7, str2.length-7)];
        CGPoint center_1 = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-8);
        CGPoint center_2 = CGPointMake(self.frame.size.width/2, self.frame.size.height/2+8);
        [self DrawText:str_1 Attribute:attr2 Center:center_1];
        [self DrawText:str_2 Attribute:attr2 Center:center_2];
    }else if(progress>=1)
    {
        [self DrawText:str2 Attribute:attr2 Center:center2];
    }
    beforeHeight = 0;
    for(int i=0;i<radiusArrays.count;i++)
    {
        float radius = [[radiusArrays objectAtIndex:i] floatValue];
        UIColor *color = [colorArrays objectAtIndex:i];
        CGContextSetStrokeColorWithColor(context, color.CGColor);
        CGContextSetLineWidth(context, 1.0f);
        float mHeight = CircleRadius*sin(radius*M_PI/180);
        float mWidth = CircleRadius*cos(radius*M_PI/180);
        float dH = 12 *sin(radius*M_PI/180);
        float dW = 12 *cos(radius*M_PI/180);
//        NSLog(@"%f,%f,%f",radius,mWidth,mHeight);
        CGContextMoveToPoint(context, self.frame.size.width/2+mWidth, self.frame.size.height/2+mHeight);
        float x1,x2;
        float y1,y2;
        x1 = self.frame.size.width/2+mWidth+dW;
        y1 = y2 = self.frame.size.height/2 + mHeight +dH;
        if(abs(y1-beforeHeight)<6)
        {
            y1 = y2 += (y1-beforeHeight>0)?6:-6;
        }
        beforeHeight = y1;
        if(mWidth>0)
        {
            x2 = x1+15;
        }else
        {
            x2 = x1-15;
        }
        if(progress>=1)
        {
            CGContextAddLineToPoint(context, x1, y1);
            CGContextAddLineToPoint(context, x2, y2);
            CGContextDrawPath(context, kCGPathStroke);
        }
        if(stringArrays.count>i&&progress>=1)
        {
            NSString *detail = [stringArrays objectAtIndex:i];
            NSMutableDictionary *attr = [[NSMutableDictionary alloc] init];
            attr[NSFontAttributeName] = [UIFont systemFontOfSize:6];
            attr[NSForegroundColorAttributeName] = [UIColor brownColor];
            CGSize size = [detail sizeWithAttributes:attr];
            
            CGPoint center = CGPointMake(x2+size.width/2, y2);
            if(mWidth<0)
            {
                center = CGPointMake(x2-size.width/2, y2);
            }
            [self DrawText:detail Attribute:attr Center:center];
        }

    }
    
}
-(void)DrawText:(NSString *)str Attribute:(NSDictionary *)attr Center:(CGPoint) center
{
    CGSize size = [str sizeWithAttributes:attr];
    float x = center.x - size.width/2.0;
    float y = center.y - size.height/2.0;
    [str drawAtPoint:CGPointMake(x, y) withAttributes:attr];
}
@end
