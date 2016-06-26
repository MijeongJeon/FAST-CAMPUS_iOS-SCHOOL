//
//  RequestObject.m
//  NetworkMiniProject
//
//  Created by Mijeong Jeon on 6/24/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "RequestObject.h"

@implementation RequestObject
// 네트워킹 싱글톤 생성
+ (instancetype)sharedInstance {
    
    static RequestObject *object  = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[RequestObject alloc] init];
    });
    
    return object;
}

// 이미지 업로드
- (void)uploadImage:(UIImage *)image title:(NSString *)title {
    
    NSLog(@"upload image:%@", title);
    
    //////////////////////////////////////////////////////////////////////////////////////// 리퀘스트 작성 시작!!

    NSString *boundary = @"--------------------mj";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    
    // 서버 url추가
    NSString *imageUpLoadURLString = @"http://ios.yevgnenll.me/api/images/";
    NSURL *reaquestURL = [NSURL URLWithString:imageUpLoadURLString];
    
    // request 문서 생성
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:reaquestURL];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    // 바운더리를 데이터로 생성
    NSData *boundaryData = [[NSString stringWithFormat:@"\n--%@\n",boundary] dataUsingEncoding:NSUTF8StringEncoding];
    
    // 바디 객체 생성
    NSMutableData *body = [NSMutableData data];
    
    // #2
    NSMutableDictionary *bodyParams = [[NSMutableDictionary alloc] init];
    [bodyParams setObject:self.userID forKey:@"user_id"];
    [bodyParams setObject:title forKey:@"title"];
    
    for (NSString *key in bodyParams) {
        
        [body appendData:boundaryData];
        
        NSData *valueKeyData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\n\n", key] dataUsingEncoding:NSUTF8StringEncoding];
        [body appendData:valueKeyData];
        
        NSString *value = [bodyParams objectForKey:key];
        NSData *valueData = [[NSString stringWithFormat:@"%@\n", value] dataUsingEncoding:NSUTF8StringEncoding];
        
        [body appendData:valueData];
    }
    
    [body appendData:boundaryData];
    
    
    
    // #1
//    // 바디에 첫줄 바운더리 입력
//    [body appendData:boundaryData];
//    
//    // user id 추가
//    NSData *userIDKeyData = [[NSString stringWithFormat:@"Content-Disposition: form-data: name=\"user_id\"\n\n"] dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *userIDData = [[NSString stringWithFormat:@"%@\n", self.userID] dataUsingEncoding:NSUTF8StringEncoding];
//    
//    [body appendData:userIDKeyData];
//    [body appendData:userIDData];
//    
//    [body appendData:boundaryData];
//    
//    // 이미지 타이틀 데이터 추가
//    NSData *imageTitleKeyData = [[NSString stringWithFormat:@"Content-Disposition: form-data: name=\"title\"\n\n"] dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *imageTitleData = [[NSString stringWithFormat:@"%@\n", title] dataUsingEncoding:NSUTF8StringEncoding];
//    
//    [body appendData:imageTitleKeyData];
//    [body appendData:imageTitleData];
//    
//    [body appendData:boundaryData];

    
    // 이미지 데이터 추가
    NSData *imageKeyData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image_data\"; filename=\"image.jpeg\"\n"] dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:imageKeyData];

    NSData *imageContentTypeData = [@"Content-Type: image/jpeg\n\n" dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:imageContentTypeData];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    [body appendData:imageData];
    
    // 바디가 끝났음을 알리는 바운더리(--바운더리--)
    NSData *finishBoudaryData = [[NSString stringWithFormat:@"\n--%@--\n",boundary] dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:finishBoudaryData];
    
    // request 바디 설정
    [request setHTTPBody:body];
    
    //////////////////////////////////////////////////////////////////////////////////////// 리퀘스트 작성 완료!!
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                               fromData:nil
                                                      completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                          
                                                          if (error != nil) {
                                                              NSLog(@"Error occured : %@",error);
                                                              return;
                                                          }
                                                          
                                                          if (data == nil) {
                                                              NSLog(@"Data doesn't exist");
                                                              return;
                                                          }
                                                          
                                                          NSMutableDictionary *dataDic = [NSJSONSerialization
                                                                                          JSONObjectWithData:data
                                                                                          options:NSJSONReadingMutableLeaves
                                                                                          error:nil];
                                                          if ([dataDic[@"code"] isEqualToNumber:@201]) {
                                                              
                                                              [[NSNotificationCenter defaultCenter] postNotificationName:ImageUpLoadDidSuccessNotification
                                                                                                                  object:nil];
                                                              [self requestImageList];
                                                          }
                                                          
                                                          NSLog(@"%@",dataDic);
                                                          NSLog(@"%@",response);
                                                          NSLog(@"end");

                                                      }];
    // task 실행!
    [uploadTask resume];
}

// 서버 이미지 요청
- (void)requestImageList {
    
    NSString *parammeterString = [NSString stringWithFormat:@"http://ios.yevgnenll.me/api/images/?page=page&count=count&user_id=%@",self.userID];
    NSURL *requestURL = [NSURL URLWithString:parammeterString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:requestURL];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession]
                              dataTaskWithRequest:request
                              completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                  
                                  NSLog(@"Response:%@", response);
                                  NSLog(@"Error:%@", error);
                                        
                                        if (data) {
                                            NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data
                                                                                                    options:NSJSONReadingMutableLeaves
                                                                                                      error:nil];
                                            if ([dataDic[@"code"] isEqualToNumber:@200]) {
                                                
                                                self.imageInfoJSONArray = [dataDic objectForKey:@"content"];
                                            
                                                [[NSNotificationCenter defaultCenter] postNotificationName:ImageListUpdatedNotification
                                                                                                    object:nil];
                                            } else {
                                                [[NSNotificationCenter defaultCenter] postNotificationName:ImageListUpdateFailNotification
                                                                                                    object:nil];
                                            }
                                            
                                        NSLog(@"dataDic:%@",dataDic);
                                        NSLog(@"JSONArray:%@",self.imageInfoJSONArray);
                                        }
                                    }];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [task resume];
}


@end
