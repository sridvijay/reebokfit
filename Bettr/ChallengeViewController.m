//
//  ChallengeViewController.m
//  
//
//  Created by Vijay Sridhar on 8/10/14.
//
//

#import "ChallengeViewController.h"
#import "AppDelegate.h"
#import "SVProgressHUD.h"
#define AppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface ChallengeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *challengeImage;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

@end

@implementation ChallengeViewController

- (void)viewDidLoad {
    [self.imageView sizeToFit];
    [self.scrollView sizeToFit];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.clipsToBounds = YES;
    [self.scrollView setContentSize:self.imageView.frame.size];
    self.navBar.tintColor = [UIColor whiteColor];
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    [super viewDidLoad];
}

- (IBAction)showMenu:(id)sender {
    [AppDelegate.sideMenuViewController presentLeftMenuViewController];
}

- (IBAction)challenge:(id)sender {
    self.challengeImage.alpha = 1;
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.challengeImage.frame = CGRectMake(0, 61, 320, 507);
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(goAway2:)];
        [self.navBar.topItem setLeftBarButtonItem:cancel animated:YES];
        [self.navBar.topItem setRightBarButtonItem:nil animated:YES];
    } completion:^(BOOL finished) {
    }];
}

- (IBAction)goAway:(id)sender {
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.challengeImage.frame = CGRectMake(0, 568, 320, 507);
        UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(challenge:)];
        UIBarButtonItem *navvy = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hamburger"] style:UIBarButtonItemStyleBordered target:self action:@selector(showMenu:)];
        [self.navBar.topItem setLeftBarButtonItem:navvy animated:YES];
        [self.navBar.topItem setRightBarButtonItem:add animated:YES];
        self.challengeImage.alpha = 0;
        self.imageView.image = [UIImage imageNamed:@"fit.challenge1@2x.png"];
    } completion:^(BOOL finished) {
        [SVProgressHUD showSuccessWithStatus:@"Lock your phone now, a test notification should come in about 3 seconds"];
        UILocalNotification *notification = [[UILocalNotification alloc]init];
        notification.repeatInterval = NSYearCalendarUnit;
        [notification setAlertBody:@"There's a new challenge near you!"];
        [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:5]];
        [notification setTimeZone:[NSTimeZone  defaultTimeZone]];
        notification.soundName = UILocalNotificationDefaultSoundName;
        [[UIApplication sharedApplication] setScheduledLocalNotifications:[NSArray arrayWithObject:notification]];
    }];
}

- (IBAction)goAway2:(id)sender {
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.challengeImage.frame = CGRectMake(0, 568, 320, 507);
        UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(challenge:)];
        UIBarButtonItem *navvy = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hamburger"] style:UIBarButtonItemStyleBordered target:self action:@selector(showMenu:)];
        self.challengeImage.alpha = 0;
        [self.navBar.topItem setLeftBarButtonItem:navvy animated:YES];
        [self.navBar.topItem setRightBarButtonItem:add animated:YES];
    } completion:^(BOOL finished) {
        
    }];
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
