//
//  PillarDrawView.h
//  DrawTable
//
//  Created by edutech on 15-4-24.
//  Copyright (c) 2015年 edutech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PillarDrawView : UIView
{
    NSMutableArray *tableDatas;
    int rankNumber;
    int rowNumber;
    float rankSingle;
    float rowSingle;
    float startRank;
    NSString *headString;
}
-(id)initRects:(NSMutableArray *)datas Row:(int)row Rank:(int)rank Rect:(CGRect) rect Hear:(NSString*) head RowSingle:(float) rsingle Rank:(float) rkSingle StartRank:(float)start;
@end
