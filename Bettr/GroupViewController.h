//
//  GroupViewController.h
//  Fit
//
//  Created by Vijay Sridhar on 8/10/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitAPI.h"

@interface GroupViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, FitAPIDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) NSMutableArray *array;

@end
