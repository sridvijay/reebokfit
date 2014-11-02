//
//  GroupViewController.m
//  Fit
//
//  Created by Vijay Sridhar on 8/10/14.
//  Copyright (c) 2014 reebok. All rights reserved.
//

#import "GroupViewController.h"
#import "AppDelegate.h"
#import "FitAPI.h"
#import "Group.h"
#import "SVProgressHUD.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <MapKit/MapKit.h>
#import "NSDate+Escort.h"
#define AppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface GroupViewController () {
}

@end

@implementation GroupViewController
@synthesize array;

- (void)viewDidLoad {
    self.navigationItem.hidesBackButton = YES;
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homeView) name:@"homeView" object:nil];
    [[FitAPI sharedManager] getGroups];
    [[FitAPI sharedManager] setDelegate:(id)self];
    array = [[NSMutableArray alloc] initWithCapacity:0];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [super viewDidLoad];
}

- (IBAction)showMenu:(id)sender {
    [AppDelegate.sideMenuViewController presentLeftMenuViewController];
}

- (void)homeView {
    [AppDelegate.sideMenuViewController setContentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"navigation"] animated:YES];
    [AppDelegate.sideMenuViewController hideMenuViewController];
}

- (void)dealloc {
    self.collectionView = nil;
    [self.collectionView.collectionViewLayout invalidateLayout];
    self.collectionView.dataSource = nil;
    self.collectionView.delegate = nil;
}

- (void)groupsWereDownloaded:(Group *)group {
    [array removeAllObjects];
    for (Group *group in [Group allObjects]) {
        [array addObject:group];
    }
    [self.collectionView performBatchUpdates:^{
        [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
    } completion:^(BOOL finished) {
    }];
}
- (IBAction)filter:(id)sender {
    [SVProgressHUD showSuccessWithStatus:@"Here's where you would be able to filter the groups based on fitness type, age, location, time, gender, etc."];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (array.count > 0) {
        #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        Group *theGroup = [array objectAtIndex:indexPath.row];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 140, 320, 60)];
        view.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [cell addSubview:view];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        [cell addSubview:imageView];
        MKMapSnapshotOptions *options = [[MKMapSnapshotOptions alloc] init];
        options.region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(theGroup.latitude, theGroup.longitude), 2000, 2000);
        options.scale = [UIScreen mainScreen].scale;
        options.size = cell.contentView.frame.size;
        
        MKMapSnapshotter *snapshotter = [[MKMapSnapshotter alloc] initWithOptions:options];
        [SVProgressHUD showWithStatus:@"Downloading Groups..."];
        [snapshotter startWithCompletionHandler:^(MKMapSnapshot *snapshot, NSError *error) {
            imageView.image = snapshot.image;
            [SVProgressHUD dismiss];
            [cell sendSubviewToBack:imageView];
        }];
        
        
        UILabel *activityLabel = [[UILabel alloc] initWithFrame:CGRectMake(67, 140, 120, 40)];
        [cell addSubview:activityLabel];
        UILabel *meetingTime = [[UILabel alloc] initWithFrame:CGRectMake(67, 160, 120, 40)];
        [cell addSubview:meetingTime];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"hh:mm a";
        meetingTime.text = [dateFormatter stringFromDate:[NSDate dateWithTimeInterval:(theGroup.meeting_time * 60) sinceDate:[[NSDate date] dateAtStartOfDay]]];
        meetingTime.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        activityLabel.text = theGroup.activity.capitalizedString;
        activityLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
        UILabel *intensityLevel = [[UILabel alloc] initWithFrame:CGRectMake(160, 150, 150, 40)];
        intensityLevel.textAlignment = NSTextAlignmentRight;
        switch (theGroup.intensity) {
            case 1:
                intensityLevel.text = @"Easy";
                break;
                
            case 2:
                intensityLevel.text = @"Medium";
                break;
                
            case 3:
                intensityLevel.text = @"Challenging";
                break;
                
            default:
                intensityLevel.text = @"Medium";
                break;
        }
        intensityLevel.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:24];
        
        [cell addSubview:intensityLevel];
//        if ([activityLabel.text isEqualToString:@"Biking"]) {
//            UIImageView *leaderPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(3, 140, 60, 60)];
//            [cell addSubview:leaderPhoto];
//            [leaderPhoto setImage:[UIImage imageNamed:@"biking"]];
//            [leaderPhoto setContentMode:UIViewContentModeScaleAspectFit];
//        } else {
            UIImageView *leaderPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, 60, 60)];
            [cell addSubview:leaderPhoto];
            [leaderPhoto setContentMode:UIViewContentModeScaleAspectFit];
            [leaderPhoto setImageWithURL:[NSURL URLWithString:theGroup.leader.photoURL]
                           placeholderImage:[UIImage imageNamed:@"placeholder.png"]
                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                                      [self.collectionView performBatchUpdates:^{
                                          [self.collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
                                      } completion:^(BOOL finished) {
                                          
                                      }];
                                  }];
//        }
        cell.clipsToBounds = YES;
    }
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return array.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 200;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 1;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
