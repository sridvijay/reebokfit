//
//  ViewController.m
//  Bettr
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>
#import "User.h"
#import "AppDelegate.h"
#import "SVProgressHUD.h"
#import <CoreMotion/CoreMotion.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define AppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface ViewController () {
    __block NSInteger index1, index2, index3, index4, index5;
}
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *calorieCounter;

@end

@implementation ViewController

- (void)viewDidLoad {
    if ([[User allObjects] count] == 0) {
        self.navigationController.navigationBarHidden = NO;
        self.navigationItem.hidesBackButton = YES;
        self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0xf4100e);
        if ([CMMotionActivityManager isActivityAvailable]) {
            CMStepCounter *manager = [[CMStepCounter alloc] init];
            [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-432000] to:[NSDate dateWithTimeIntervalSinceNow:-345600] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
                index1 = numberOfSteps;
            }];
            [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-345600] to:[NSDate dateWithTimeIntervalSinceNow:-259200] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
                index2 = numberOfSteps;
            }];
            [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-259200] to:[NSDate dateWithTimeIntervalSinceNow:-172800] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
                index3 = numberOfSteps;
            }];
            [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-172800] to:[NSDate dateWithTimeIntervalSinceNow:-86400] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
                index4 = numberOfSteps;
            }];
            [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-86400] to:[NSDate date] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
                index5 = numberOfSteps;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    BEMSimpleLineGraphView *myGraph = [[BEMSimpleLineGraphView alloc] initWithFrame:CGRectMake(0, 368, 320, 200)];
                    myGraph.delegate = self;
                    myGraph.enableBezierCurve = YES;
                    myGraph.colorLine = [UIColor whiteColor];
                    myGraph.enablePopUpReport = YES;
                    self.averageStep.text = [NSString stringWithFormat:@"%.0f",(index1 + index2 + index3 + index4 + index5) * 0.08];
                    self.distance.text = [NSString stringWithFormat:@"%.0f mi", (index1 + index2 + index3 + index4 + index5) * 0.0005];
                    self.calorieCounter.text = [NSString stringWithFormat:@"%.0f cal", (index1 + index2 + index3 + index4 + index5) * 0.068];
                    UIImage *myGradient = [UIImage imageNamed:@"bottomgraph"];
                    myGraph.colorBottom   = [UIColor colorWithPatternImage:myGradient];
                    [self.view addSubview:myGraph];
                });
            }];
        }
//        [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"login"] animated:NO completion:nil];
    } else {
        User *user = [[User allObjects] firstObject];
        NSLog(@"token %@", user.token);
        self.navigationController.navigationBarHidden = NO;
        self.navigationItem.hidesBackButton = YES;
        self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0xf4100e);
        if ([CMMotionActivityManager isActivityAvailable]) {
            CMStepCounter *manager = [[CMStepCounter alloc] init];
            [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-432000] to:[NSDate dateWithTimeIntervalSinceNow:-345600] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
                index1 = numberOfSteps;
            }];
            [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-345600] to:[NSDate dateWithTimeIntervalSinceNow:-259200] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
                index2 = numberOfSteps;
            }];
            [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-259200] to:[NSDate dateWithTimeIntervalSinceNow:-172800] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
                index3 = numberOfSteps;
            }];
            [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-172800] to:[NSDate dateWithTimeIntervalSinceNow:-86400] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
                index4 = numberOfSteps;
            }];
            [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-86400] to:[NSDate date] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
                index5 = numberOfSteps;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    BEMSimpleLineGraphView *myGraph = [[BEMSimpleLineGraphView alloc] initWithFrame:CGRectMake(0, 368, 320, 200)];
                    myGraph.delegate = self;
                    myGraph.enableBezierCurve = YES;
                    myGraph.colorLine = [UIColor whiteColor];
                    myGraph.enablePopUpReport = YES;
                    self.averageStep.text = [NSString stringWithFormat:@"%.0f",(index1 + index2 + index3 + index4 + index5) * 0.08];
                    self.distance.text = [NSString stringWithFormat:@"%.0f mi", (index1 + index2 + index3 + index4 + index5) * 0.0005];
                    self.calorieCounter.text = [NSString stringWithFormat:@"%.0f cal", (index1 + index2 + index3 + index4 + index5) * 0.068];
                    UIImage *myGradient = [UIImage imageNamed:@"bottomgraph"];
                    myGraph.colorBottom   = [UIColor colorWithPatternImage:myGradient];
                    [self.view addSubview:myGraph];
                });
            }];
            
        }
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nextView) name:@"nextView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rewardsView) name:@"rewardsView" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homeView) name:@"homeView" object:nil];

    [super viewDidLoad];
}
- (IBAction)showMenu:(id)sender {
    [AppDelegate.sideMenuViewController presentLeftMenuViewController];
}

- (void)rewardsView {
    [AppDelegate.sideMenuViewController setContentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"rewards"] animated:YES];
    [AppDelegate.sideMenuViewController hideMenuViewController];
}

- (void)nextView {
    [AppDelegate.sideMenuViewController setContentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"groups"] animated:YES];
    [AppDelegate.sideMenuViewController hideMenuViewController];
}

- (void)homeView {
    NSLog(@"ay");
    [AppDelegate.sideMenuViewController setContentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"navigation"] animated:YES];
    [AppDelegate.sideMenuViewController hideMenuViewController];
}

- (NSInteger)numberOfPointsInLineGraph:(BEMSimpleLineGraphView *)graph {
    return 5; // Number of points in the graph.
}

- (CGFloat)lineGraph:(BEMSimpleLineGraphView *)graph valueForPointAtIndex:(NSInteger)index {
    if ([CMMotionActivityManager isActivityAvailable]) {
//        CMStepCounter *manager = [[CMStepCounter alloc] init];
//        __block NSInteger index1, index2, index3, index4, index5;
//        [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-432000] to:[NSDate dateWithTimeIntervalSinceNow:-345600] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
//            index1 = numberOfSteps;
//        }];
//        [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-345600] to:[NSDate dateWithTimeIntervalSinceNow:-259200] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
//            index2 = numberOfSteps;
//        }];
//        [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-259200] to:[NSDate dateWithTimeIntervalSinceNow:-172800] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
//            index3 = numberOfSteps;
//        }];
//        [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-172800] to:[NSDate dateWithTimeIntervalSinceNow:-86400] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
//            index4 = numberOfSteps;
//        }];
//        [manager queryStepCountStartingFrom:[NSDate dateWithTimeIntervalSinceNow:-86400] to:[NSDate date] toQueue:[NSOperationQueue mainQueue] withHandler:^(NSInteger numberOfSteps, NSError *error) {
//            index5 = numberOfSteps;
//        }];
        
        switch (index) {
            case 0:
                return index1;
                break;
                
            case 1:
                return index2;
                break;
                
            case 2:
                return index3;
                break;
                
            case 3:
                return index3;
                break;
                
            case 4:
                return index4;
                break;
                
            default:
                return index1;
                break;
        }
    } else {
        return 0;
    }

}
- (IBAction)addNew:(id)sender {
    [SVProgressHUD showSuccessWithStatus:@"Here's where you would track your excersize (timer for stuff like yoga, and GPS tracking for running). Due to time constraints, we couldn't have added it all!"];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0xf4100e);
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
