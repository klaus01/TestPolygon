//
//  PolygonView.m
//  TestPolygon
//
//  Created by kelei on 11-8-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "PolygonView.h"


@implementation PolygonView

@synthesize NumberOfSides = numberOfSides;

//设置边数
- (void)setNumberOfSides:(int)_numberOfSides
{
    if (_numberOfSides >= 3)
    {
        numberOfSides = _numberOfSides;
        avgangle = 360.0 / numberOfSides;
        [self setNeedsDisplay];
    }
}

//初始化变量
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.NumberOfSides = 3;
    return [super initWithCoder:aDecoder];
}

//设置位置大小
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    CGRect bounds = [self bounds];
    //圆心坐标
    centerPoint.x = CGRectGetMidX(bounds);
    centerPoint.y = CGRectGetMidY(bounds);
    //半径
    radius = MIN(centerPoint.x, centerPoint.y);    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    //画Caption
    [[UIColor blackColor] set];
    UIFont *captionFont = [UIFont systemFontOfSize:12];
    NSString *caption = [NSString stringWithFormat:@"当前边数：%d", numberOfSides];
    CGSize captionSize = [caption sizeWithFont:captionFont];
    [caption drawAtPoint:CGPointMake(centerPoint.x - captionSize.width / 2, centerPoint.y - captionSize.height) withFont:captionFont];
    //画多边形
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    float arc = 0;
    float x = 0;
    float y = 0;
    for (int i = 0; i < numberOfSides; i++) {
        //将角度转换为单位圆弧长
        arc = i * avgangle * M_PI / 180;
        //对应角度在圆上的点坐标
        x = centerPoint.x + radius * sin(arc);
        y = centerPoint.y - radius * cos(arc);
        if (i == 0)
            CGContextMoveToPoint(context, x, y);
        else
            CGContextAddLineToPoint(context, x, y);
    }
    CGContextClosePath(context);
    
    [[UIColor redColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
}

@end
