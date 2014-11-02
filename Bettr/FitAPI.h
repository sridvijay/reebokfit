//
//  FitAPI.h
//  Fit
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Group.h"

@class FitAPI;
@protocol FitAPIDelegate <NSObject>
@optional
- (void)userWasCreated:(User *)user;
- (void)groupsWereDownloaded:(Group *)group;
@end

@interface FitAPI : NSObject

@property (nonatomic, weak) id <FitAPIDelegate> delegate;
@property (nonatomic, retain) NSString *accessToken;

- (void)createNewUserWithEmail:(NSString *)email password:(NSString *)password firstName:(NSString *)firstName lastName:(NSString *)lastName gender:(NSString *)gender age:(int)age fitnessLevel:(int)fitnessLevel activity:(NSString *)activity;

- (void)getGroups;

+ (id)sharedManager;

@end
