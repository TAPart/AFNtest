//
//  NSGetDataTools.m
//  UpLoadImage
//
//  Created by 搜影科技 on 17/3/16.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "NSGetDataTools.h"
#import <AFNetworking/AFNetworking.h>

@implementation NSGetDataTools



+(void)getWaPhotoData:(NSString *)url SuccessBlock:(sucessBlock)successBlock failureBlock:(failBlock)errorBlock
{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:
                                                           @"application/json",
                                                           @"text/json",
                                                           @"text/javascript",
                                                           @"text/html",
                                                           @"text/css",
                                                           @"text/plain",
                                                           @"application/javascript",
                                                           @"application/x-javascript",
                                                           @"image/jpeg", nil]];
    
    manager.requestSerializer.timeoutInterval = 10;
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSLog(@"%@", url);
    
    [manager GET:url parameters:nil headers:@{} progress:^(NSProgress * _Nonnull downloadProgress) {
            
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        NSData *datas      = responseObject;
        NSString *result = [[NSString alloc] initWithData:datas encoding:NSUTF8StringEncoding];
        NSDictionary *dict = [self parseJSONStringToNSDictionary:result];// 转字典

        dispatch_async(dispatch_get_main_queue(), ^{
            successBlock(dict);
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        dispatch_async(dispatch_get_main_queue(), ^{
            errorBlock(error);
        });
        
    }];
   
}



// 字典格式字符串转字典
+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString
{
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSDictionary dictionary];
    
    if (JSONData != nil) {
        responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    }

    return responseJSON;
}



@end
