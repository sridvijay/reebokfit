//
//  User.m
//  Fit
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import "User.h"

@implementation User

// Specify default values for properties

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"firstName": @"Don",
             @"lastName": @"Draper",
             @"gender": @"male",
             @"age": @34,
             @"activity": @"running",
             @"fitnessLevel": @2,
             @"email": @"draper@don.com",
             @"token": @"abcd",
             @"photoURL": @"http://api.randomuser.me/portraits/men/6.jpg"};
}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
