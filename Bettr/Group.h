//
//  Group.h
//  Fit
//
//  Created by Vijay Sridhar on 8/10/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import <Realm/Realm.h>
#import "User.h"

@interface Group : RLMObject
@property NSString *activity;
@property User *leader;
@property int intensity;
@property int meeting_time;
@property float latitude, longitude;
@property int habitat;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Group>
RLM_ARRAY_TYPE(Group)
