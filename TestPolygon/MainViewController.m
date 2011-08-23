//
//  MainViewController.m
//  TestPolygon
//
//  Created by kelei on 11-8-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "PolygonView.h"


@implementation MainViewController

static NSString *UD_NumberOfSides = @"NumberOfSides";

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait
            || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown
            || interfaceOrientation == UIInterfaceOrientationLandscapeLeft
            || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

//视图即将可见时调用
- (void)viewWillAppear:(BOOL)animated
{
    //从数据文件中加载边数配置
    polygonView.NumberOfSides = [[NSUserDefaults standardUserDefaults] integerForKey:UD_NumberOfSides];
}

//将边数保存到配置文件中
- (void)saveUserDataNumberOfSides:(int)_numberOfSides
{
    //注意：设置后不会立即保存到文件中，当应用退出时才保存。如果应用异常结束，那么数据将不会被保存。
    //     但可以手动调用[[NSUserDefaults standardUserDefaults] synchronize]来保存
    [[NSUserDefaults standardUserDefaults] setInteger:_numberOfSides forKey:UD_NumberOfSides];
}

- (void)btnIncClick:(id)sender
{
    polygonView.NumberOfSides++;
    [self saveUserDataNumberOfSides:polygonView.NumberOfSides];
}
- (void)btnDecClick:(id)sender
{
    polygonView.NumberOfSides--;
    [self saveUserDataNumberOfSides:polygonView.NumberOfSides];
}
@end
