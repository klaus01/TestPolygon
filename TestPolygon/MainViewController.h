//
//  MainViewController.h
//  TestPolygon
//
//  Created by kelei on 11-8-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolygonView.h"


@interface MainViewController : UIViewController {
    IBOutlet UIButton *btnInc;
    IBOutlet UIButton *btnDec;
    IBOutlet PolygonView *polygonView;
}
- (IBAction)btnIncClick:(id)sender;
- (IBAction)btnDecClick:(id)sender;
@end
