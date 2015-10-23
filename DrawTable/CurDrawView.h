//
//  CurDrawView.h
//  DrawTable
//
//  Created by edutech on 15-4-23.
//  Copyright (c) 2015年 edutech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurDrawView : UIView
{
    NSMutableArray *bottomString;
    NSString * headString;
    NSMutableArray *heightDatas;
    UIColor *fillColor;
}

-(id)initCurView:(NSMutableArray*)datas Top:(NSMutableArray *)strings Rect:(CGRect) rect Top:(NSString *)head Color:(UIColor*) color;
@end
