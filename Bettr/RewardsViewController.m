//
//  RewardsViewController.m
//  Fit
//
//  Created by Vijay Sridhar on 8/10/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import "RewardsViewController.h"
#import "AppDelegate.h"
#define AppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface RewardsViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation RewardsViewController

- (void)viewDidLoad {
    self.scrollView.contentSize = CGSizeMake(320, 642);
    self.scrollView.clipsToBounds = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)showMenu:(id)sender {
    [AppDelegate.sideMenuViewController presentLeftMenuViewController];
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
