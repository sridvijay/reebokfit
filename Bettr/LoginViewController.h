//
//  LoginViewController.h
//  Fit
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *signUp;
@property (weak, nonatomic) IBOutlet UIButton *logIn;

- (IBAction)signUp:(id)sender;
- (IBAction)logIn:(id)sender;

@end
