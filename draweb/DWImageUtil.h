//
//  DWImageUtil.h
//  draweb
//
//  Created by SOOYOUNG BYUN on 13. 2. 18..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWImageUtil : NSObject

+ (void) saveImageToFile :(UIImage *) image;
+ (NSArray *) loadImageListFromFile;

+ (int) addSavedMaxNum;

+ (void) addImgPath:(NSString *) aPath;
+ (NSArray *) getImgPathList;

@end
