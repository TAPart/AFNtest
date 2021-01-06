//
//  NSGetDataTools.h
//  UpLoadImage
//
//  Created by 搜影科技 on 17/3/16.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

// 成功后的数据
typedef void (^sucessBlock)(NSDictionary *dict);
// 失败后的数据
typedef void (^failBlock)(NSError *error);
//进度
typedef void (^progressBlock)(CGFloat progress);




@interface NSGetDataTools : NSObject



+(void)getWaPhotoData:(NSString *)url SuccessBlock:(sucessBlock)successBlock failureBlock:(failBlock)errorBlock;


@end
