//
//  DWCaptureListViewController.m
//  draweb
//
//  Created by SOOYOUNG BYUN on 13. 3. 3..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "DWCaptureListViewController.h"
#import "DWCaptureCollectionViewCell.h"
#import "DWImageUtil.h"

@interface DWCaptureListViewController ()

@end

@implementation DWCaptureListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.savedCaptureList = [DWImageUtil loadImageListFromFile];
    [self.captureCollectionView registerClass:[DWCaptureCollectionViewCell class] forCellWithReuseIdentifier:@"captureCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - collection view delegate methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.savedCaptureList ? [self.savedCaptureList count] : 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DWCaptureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"captureCell" forIndexPath:indexPath];
    [cell.captureImgView setImage:[self.savedCaptureList objectAtIndex:[indexPath row]]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select");
}

@end
