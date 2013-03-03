//
//  DWImageUtil.m
//  draweb
//
//  Created by SOOYOUNG BYUN on 13. 2. 18..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "DWImageUtil.h"

#define kSavedImgNum @"kSavedImgNum"
#define kSavedImgPath @"kSavedImgPath"
#define DWImgName(n) [NSString stringWithFormat:@"img_%d.png",n]

@implementation DWImageUtil

+ (void) saveImageToFile :(UIImage *) image
{
    if (image != nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSInteger maxNum = [self addSavedMaxNum];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:
                          [NSString stringWithString:DWImgName(maxNum)]];
        
        //파일 이름을 UserDefaults에 저장
        [self addImgPath:path];
        
        NSData* data = UIImagePNGRepresentation(image);
        [data writeToFile:path atomically:YES];
    }
}

+ (NSArray *) loadImageListFromFile
{
    NSMutableArray *imgList = [NSMutableArray array];
    
    NSArray *pathList = [self getImgPathList];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    for(NSString *p in pathList)
    {
        NSString* path = [documentsDirectory stringByAppendingPathComponent:
                          [NSString stringWithString:p]];
        UIImage* image = [UIImage imageWithContentsOfFile:path];
        [imgList addObject:image ? image : [UIImage imageNamed:@"first"]];
    }
    
    return imgList;
}


#pragma user defaults methods

+ (NSInteger) addSavedMaxNum
{
    //get img saved number
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    NSInteger _savedNum = [defs integerForKey:kSavedImgNum];
    _savedNum++;
    [defs setInteger:_savedNum forKey:kSavedImgNum];
    [defs synchronize];
    
    return _savedNum;
}

+ (void) addImgPath:(NSString *) aPath
{
    NSMutableArray *pathList = [NSMutableArray arrayWithArray:[self getImgPathList]];
    [pathList addObject:aPath];
    
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    [defs setObject:pathList forKey:kSavedImgPath];
    [defs synchronize];
}

+ (NSArray *) getImgPathList
{
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    NSArray *savedList = [defs arrayForKey:kSavedImgPath];
    
    return (savedList) ? savedList : [NSArray array];
}

@end
