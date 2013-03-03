//
//  DWCaptureListViewController.h
//  draweb
//
//  Created by SOOYOUNG BYUN on 13. 3. 3..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWCaptureListViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSArray *savedCaptureList;
@property (strong, nonatomic) IBOutlet UICollectionView *captureCollectionView;

@end
