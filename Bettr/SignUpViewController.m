//
//  SignUpViewController.m
//  Fit
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import "SignUpViewController.h"
#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "JVFloatLabeledTextField.h"
#import "FitAPI.h"
#import "User.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface SignUpViewController () {
    JVFloatLabeledTextField *firstName, *lastName, *dateYear, *email, *password, *favorite;
    int fitnessLevel;
    NSString *genderString;
}
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    self.navBar.barTintColor = UIColorFromRGB(0xf4100e);
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    [[FitAPI sharedManager] setDelegate:(id)self];
    [self setUpScrollView];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setUpScrollView {}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (tableView == self.tableView) {
        switch (indexPath.row) {
            case 0:
                firstName = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(15, 5, 320, 50)];
                firstName.placeholder = @"First Name";
                firstName.delegate = self;
                firstName.tableViewRow = 0;
                firstName.backgroundColor = [UIColor whiteColor];
                [cell addSubview:firstName];
                break;
             
            case 1:
                lastName = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(15, 5, 320, 50)];
                lastName.placeholder = @"Last Name";
                lastName.delegate = self;
                lastName.tableViewRow = 1;
                lastName.backgroundColor = [UIColor whiteColor];
                [cell addSubview:lastName];
                break;
                
            case 2:
                email = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(15, 5, 320, 50)];
                email.placeholder = @"Email";
                email.delegate = self;
                email.autocapitalizationType = UITextAutocapitalizationTypeNone;
                email.tableViewRow = 2;
                email.backgroundColor = [UIColor whiteColor];
                [cell addSubview:email];
                break;
                
            case 3:
                password = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(15, 5, 320, 50)];
                password.placeholder = @"Password";
                password.delegate = self;
                password.tableViewRow = 3;
                password.secureTextEntry = YES;
                password.backgroundColor = [UIColor whiteColor];
                [cell addSubview:password];
                break;
                
                
            default:
                break;
        }
    } else {
            UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Male", @"Female"]];
            UISegmentedControl *segmentedControl2 = [[UISegmentedControl alloc] initWithItems:@[@"Low", @"Medium", @"High"]];
            [segmentedControl addTarget:self
                             action:@selector(gender:)
                   forControlEvents:UIControlEventValueChanged];
            [segmentedControl2 addTarget:self
                             action:@selector(fitnessLevel:)
                   forControlEvents:UIControlEventValueChanged];
            UILabel *gender = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 120, 55)];
        UILabel *gender2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 120, 55)];

            switch (indexPath.row) {
                case 3:
                    favorite = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(15, 5, 320, 50)];
                    favorite.placeholder = @"Favorite Activity:";
                    favorite.delegate = self;
                    favorite.tableViewRow = 4;
                    favorite.backgroundColor = [UIColor whiteColor];
                    [cell addSubview:favorite];
                    break;
                    
                case 0:
                    gender2.text = @"Fitness Level:";
                    gender2.textColor = [UIColor lightGrayColor];
                    [cell addSubview:gender2];
                    segmentedControl2.frame = CGRectMake(142, 13, 170, 29);
                    [cell addSubview:segmentedControl2];
                    break;
                    
                case 2:
                    gender.text = @"Gender:";
                    gender.textColor = [UIColor lightGrayColor];
                    [cell addSubview:gender];
                    segmentedControl.frame = CGRectMake(182, 13, 123, 29);
                    [cell addSubview:segmentedControl];
                    break;
                    
                case 1:
                    dateYear = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(15, 5, 320, 50)];
                    dateYear.delegate = self;
                    dateYear.tableViewRow = 1;
                    dateYear.placeholder = @"Age";
                    dateYear.keyboardType = UIKeyboardTypeNumberPad;
                    dateYear.backgroundColor = [UIColor whiteColor];
                    [cell addSubview:dateYear];
                    break;
                    
                default:
                    break;
            }
    }

    return cell;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField setValue:[UIColor clearColor] forKeyPath:@"_placeholderLabel.textColor"];
    if (((JVFloatLabeledTextField *)textField).tableViewRow == 4) {
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(createNewUser:)];
        done.tintColor = [UIColor whiteColor];
        [self.navBar.topItem setRightBarButtonItem:done animated:YES];
    }
}

- (IBAction)createNewUser:(id)sender {
    [[FitAPI sharedManager] createNewUserWithEmail:email.text password:password.text firstName:firstName.text lastName:lastName.text gender:genderString age:[dateYear.text intValue] fitnessLevel:fitnessLevel  activity:favorite.text];
}

- (void)userWasCreated:(User *)user {
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"showNormalView" object:nil];
    }];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)gender:(id)sender{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    if (segmentedControl.selectedSegmentIndex == 0) {
        genderString = @"Male";
    } else {
        genderString = @"Female";
    }
}

-(void)fitnessLevel:(id)sender{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    fitnessLevel = (int)segmentedControl.selectedSegmentIndex;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (((JVFloatLabeledTextField *)textField).tableViewRow == 3) {
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.tableView.frame = CGRectMake(-320, 61, 320, 507);
            self.tableView2.frame = CGRectMake(0, 61, 320, 507);
        } completion:nil];
    }
    return YES;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (tableView == self.tableView) {
        return @"Sign Up";
    } else if (tableView == self.tableView2) {
        return @"Personal Details";
    } else {
        return @"";
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return;
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

@end
