//
//  PolygonView.h
//  TestPolygon
//
//  Created by kelei on 11-8-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PolygonView : UIView {
    @private
    //边数
    int numberOfSides;
    //角度
    float avgangle;
    //圆心坐标
    CGPoint centerPoint;
    //半径
    float radius;
}
//边数
@property (nonatomic) int NumberOfSides;
@end
