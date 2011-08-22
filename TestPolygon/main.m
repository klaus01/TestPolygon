//
//  main.m
//  TestPolygon
//
//  Created by kelei on 11-8-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : NSObject <UIApplicationDelegate>
{
    @private
    UIWindow *window;
    //UIViewController *mainView;
}
@end
@implementation AppDelegate
- (void) applicationDidFinishLaunching:(UIApplication *)application
{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIViewController *mainView = [[MainViewController alloc] init];
    window.rootViewController = mainView;
    [mainView release];
    
    [window makeKeyAndVisible];
}
- (void)dealloc
{
    [window release];
    [super dealloc];
}
@end
    


int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"AppDelegate");
    [pool release];
    return retVal;
}
