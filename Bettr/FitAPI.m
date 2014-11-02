//
//  FitAPI.m
//  Fit
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import "FitAPI.h"
#import "AFNetworking/AFNetworking.h"
#import <Realm/Realm.h>
#import "SVProgressHUD.h"
#import "Group.h"
#import "User.h"

@implementation FitAPI {
    NSString *URL;
}
@synthesize delegate;

+ (id)sharedManager {
    static FitAPI *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        URL = @"192.168.65.222/API/v1/mobile/";
        if ([[User allObjects] count] > 0) {
            self.accessToken = ((User *)[[User allObjects] objectAtIndex:0]).token;
        }
    }
    return self;
}

- (void)createNewUserWithEmail:(NSString *)email password:(NSString *)password firstName:(NSString *)firstName lastName:(NSString *)lastName gender:(NSString *)gender age:(int)age fitnessLevel:(int)fitnessLevel activity:(NSString *)activity {
    [SVProgressHUD showWithStatus:@"Creating new user..." maskType:SVProgressHUDMaskTypeGradient];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            email, @"email",
                            password, @"password",
                            firstName, @"first_name",
                            lastName, @"last_name",
                            gender, @"gender",
                            [NSNumber numberWithInt:age], @"age",
                            nil];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:[NSString stringWithFormat:@"http://gettreehouseapp.com/brief24/API/v1/mobile/Users/register.php"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"response object %@", responseObject);
        User *user = [[User alloc] init];
        user.firstName = firstName;
        user.lastName = lastName;
        user.email = email;
        user.gender = gender;
        user.age = age;
        user.fitnessLevel = fitnessLevel;
        user.activity = activity;
        user.token = [[[responseObject objectForKey:@"response"] objectForKey:@"token"] objectForKey:@"token"];
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm addObject:user];
        [realm commitWriteTransaction];
        [self.delegate userWasCreated:user];
        [SVProgressHUD dismiss];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"nooo %@", error);
    }];
}

- (void)getGroups {
    [SVProgressHUD showWithStatus:@"Finding groups for you to join..." maskType:SVProgressHUDMaskTypeGradient];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            ((User *)[[User allObjects] firstObject]).token, @"token",
                            nil];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    [manager POST:[NSString stringWithFormat:@"http://gettreehouseapp.com/brief24/API/v1/mobile/Groups/get_groups.php"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"response %@", [[responseObject objectForKey:@"data"] objectAtIndex:0]);
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObjects:[Group allObjects]];
        [realm commitWriteTransaction];
        NSArray *groupArray = [responseObject objectForKey:@"data"];
        for (int i = 0; i < groupArray.count; i++) {
            NSDictionary *dict = [groupArray objectAtIndex:i];
            Group *group = [[Group alloc] init];
            group.activity = [dict objectForKey:@"activity_text"];
            group.intensity = [[dict objectForKey:@"intensity"] intValue];
            group.habitat = [[dict objectForKey:@"habitat"] intValue];
            NSDictionary *userDict = [dict objectForKey:@"leader"];
            User *user = [[User alloc] init];
            user.firstName = [userDict objectForKey:@"first_name"];
            user.lastName = [userDict objectForKey:@"last_name"];
            user.gender = [userDict objectForKey:@"gender"];
            user.age = [[userDict objectForKey:@"age"] intValue];
            user.photoURL = [userDict objectForKey:@"photo"];
            group.leader = user;
            group.latitude = [[[dict objectForKey:@"location"] objectForKey:@"lat"] floatValue];
            group.longitude = [[[dict objectForKey:@"location"] objectForKey:@"lng"] floatValue];
            group.meeting_time = [[dict objectForKey:@"meeting_time"] intValue];
            [realm beginWriteTransaction];
            [realm addObject:group];
            [realm commitWriteTransaction];
            [self.delegate groupsWereDownloaded:nil];
            [SVProgressHUD dismiss];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"nooo %@", error);
    }];

}
@end
