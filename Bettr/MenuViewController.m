//
//  MenuViewController.m
//  Bettr
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import "MenuViewController.h"
#import "AppDelegate.h"
#import "SVProgressHUD.h"
#define AppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)next:(id)sender {
    [AppDelegate.sideMenuViewController setContentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"groups"] animated:YES];
    [AppDelegate.sideMenuViewController hideMenuViewController];
}

- (IBAction)home:(id)sender {
    [AppDelegate.sideMenuViewController setContentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"navigation"] animated:YES];
    [AppDelegate.sideMenuViewController hideMenuViewController];}

- (IBAction)rewards:(id)sender {
    [AppDelegate.sideMenuViewController setContentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"rewards"] animated:YES];
    [AppDelegate.sideMenuViewController hideMenuViewController];
}

- (IBAction)challenge:(id)sender {
    [AppDelegate.sideMenuViewController setContentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"challenge"] animated:YES];
    [AppDelegate.sideMenuViewController hideMenuViewController];
}
- (IBAction)profile:(id)sender {
    [SVProgressHUD showSuccessWithStatus:@"You WOULD see your profile here, but due to the time constraint we couldn't add it in."];
}
- (IBAction)settings:(id)sender {
    [SVProgressHUD showSuccessWithStatus:@"You WOULD see some settings here, but due to the time constraint we couldn't add it in."];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
