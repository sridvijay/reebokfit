//
//  Tutorial.h
//  Fit
//
//  Created by Vijay Sridhar on 8/9/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tutorial : NSObject

@property (retain, nonatomic) UIImage *image;
@property (retain, nonatomic) NSString *subtitle;

- (id)initWithImage:(UIImage *)image andDescription:(NSString *)description;

@end
