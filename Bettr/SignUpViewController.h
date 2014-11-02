//
//  SignUpViewController.h
//  Fit
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitAPI.h"

@interface SignUpViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, FitAPIDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *tableView2;

@end
