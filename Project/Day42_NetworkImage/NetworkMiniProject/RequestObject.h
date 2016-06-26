//
//  RequestObject.h
//  NetworkMiniProject
//
//  Created by Mijeong Jeon on 6/24/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//
// 네트워킹을 하기 위한 싱글톤 생성

#import <UIKit/UIKit.h>

static NSString *ImageListUpdatedNotification = @"ImageListUpdated";
static NSString *ImageListUpdateFailNotification = @"ImageListUpdateFail";
static NSString *ImageUpLoadDidSuccessNotification = @"ImageUpLoadSuccess";
static NSString *ImageUpLoadDidFailNotification = @"ImageUpLoadeFail";

static NSString *JSONKeyImageURL = @"image_url";
static NSString *JSONKeyThumbnailURL = @"thumbnail_url";
static NSString *JSONKeyImageTitle = @"title";


@interface RequestObject : NSObject

@property (strong, nonatomic) NSArray<NSDictionary *> *imageInfoJSONArray;
@property (strong, nonatomic) NSString *userID;

+ (instancetype)sharedInstance;

- (void)uploadImage:(UIImage *)image title:(NSString *)title;
- (void)requestImageList;

@end
