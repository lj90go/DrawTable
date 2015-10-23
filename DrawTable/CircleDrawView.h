//
//  CircleDrawView.h
//  DrawTable
//
//  Created by edutech on 15-4-24.
//  Copyright (c) 2015年 edutech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleDrawView : UIView
{
    NSMutableArray *colorArrays;
    NSMutableArray *dataArrays;
    NSMutableArray *stringArrays;
    NSString *centerString;
    float progress;
}
-(id)initCircleView:(NSMutableArray*)Colors Percents:(NSMutableArray *)datas Strings:(NSMutableArray *)strings CenterString:(NSString *)center Rect:(CGRect)rect;
-(void)setProgress:(float)progress;
@end
