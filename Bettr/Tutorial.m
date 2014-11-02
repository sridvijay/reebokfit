//
//  Tutorial.m
//  Fit
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import "Tutorial.h"

@implementation Tutorial

- (id)initWithImage:(UIImage *)image andDescription:(NSString *)description {
    self.image = image;
    self.subtitle = description;
    
    return self;
}

@end
