//
//  DWCaptureCollectionViewCell.m
//  draweb
//
//  Created by SOOYOUNG BYUN on 13. 3. 3..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "DWCaptureCollectionViewCell.h"

@implementation DWCaptureCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.captureImgView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, self.frame.size.width - 4, self.frame.size.height-4)];
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.captureImgView];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//}

@end
