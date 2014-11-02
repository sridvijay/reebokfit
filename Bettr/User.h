//
//  User.h
//  Fit
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import <Realm/Realm.h>

@interface User : RLMObject
@property NSString *firstName;
@property NSString *lastName;
@property NSString *gender;
@property NSString *photoURL;
@property int age;
@property NSString *activity;
@property int fitnessLevel;
@property NSString *email;
@property NSString *token;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<User>
RLM_ARRAY_TYPE(User)
