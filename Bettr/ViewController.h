//
//  ViewController.h
//  Bettr
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RESideMenu/RESideMenu.h>
#import "BEMSimpleLineGraphView.h"

@interface ViewController : UIViewController <BEMSimpleLineGraphDelegate>

@property (weak, nonatomic) IBOutlet UILabel *averageStep;

@end

