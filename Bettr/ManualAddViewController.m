//
//  ManualAddViewController.m
//  Fit
//
//  Created by Vijay Sridhar on 9/17/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import "ManualAddViewController.h"

@interface ManualAddViewController ()

@end

@implementation ManualAddViewController

- (void)viewDidLoad {
    self.navBar.delegate = self;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
