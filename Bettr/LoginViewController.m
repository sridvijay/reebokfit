//
//  LoginViewController.m
//  Fit
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import "LoginViewController.h"
#import <RESideMenu/RESideMenu.h>
#import "Tutorial.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface LoginViewController () {
    NSArray *imageArray;
}
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0xf4100e);
    self.navigationController.navigationBarHidden = YES;
    imageArray = [[NSArray alloc] initWithObjects:[[Tutorial alloc] initWithImage:[UIImage imageNamed:@"scroll1.jpg"] andDescription:@"Get fit. right now."], [[Tutorial alloc] initWithImage:[UIImage imageNamed:@"scroll2.jpg"] andDescription:@"join groups. support each\nother."], [[Tutorial alloc] initWithImage:[UIImage imageNamed:@"bg 2.jpg"] andDescription:@"challenge each other. win points."], [[Tutorial alloc] initWithImage:[UIImage imageNamed:@"scroll3.png"] andDescription:@"use points. get real rewards."], nil];
    self.pageControl.numberOfPages = imageArray.count;
    self.scrollView.delegate = self;
    [self setUpScrollView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showNormalView) name:@"showNormalView" object:nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)showNormalView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setUpScrollView {
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    int count = 0;
    for (Tutorial *tutorial in imageArray) {
        UIImageView *scrollImage = [[UIImageView alloc] initWithFrame:CGRectMake(320 * count, 0, 320, 517)];
        scrollImage.image = tutorial.image;
        scrollImage.contentMode = UIViewContentModeScaleAspectFill;
        scrollImage.clipsToBounds = YES;
        [self.scrollView addSubview:scrollImage];
        UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(10 + (320 * count), 0, 320, 487)];
        description.clipsToBounds = YES;
        description.text = tutorial.subtitle.uppercaseString;
        description.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:48];
        description.textColor = [UIColor whiteColor];
        description.numberOfLines = 0;
        description.lineBreakMode = NSLineBreakByWordWrapping;
        [self.scrollView addSubview:description];
        count++;
    }
    [self.scrollView setContentSize:CGSizeMake(320 * count, 517)];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.currentPage = scrollView.contentOffset.x / 320;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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

- (IBAction)signUp:(id)sender {

}

- (IBAction)logIn:(id)sender {
}
@end
