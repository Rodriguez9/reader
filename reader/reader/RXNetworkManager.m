//
//  RXNetworkManager.m
//  RXBookRead
//
//  Created by Evan on 2018/5/29.
//  Copyright © 2018年 Evan. All rights reserved.
//

#import "RXNetworkManager.h"

/** Content-Type类型 */
typedef enum : NSUInteger {
    HttpContentTypeFrom,        //application/x-www-form-urlencoded;charset=UTF-8
    HttpContentTypeJson,        //application/json
} HttpContentType;

typedef NS_ENUM(NSInteger, HTTPType) {
    HTTPTypeGET,
    HTTPTypePOST,
};

@implementation RXNetworkManager

+ (AFHTTPSessionManager *)setupAFManagerWithContentType:(HttpContentType)contentType{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 30;//超时时间
    // 响应序列化设置
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // 请求序列化设置
    if (contentType == HttpContentTypeFrom) {
        // FORM方式
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        [manager.requestSerializer setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        
    } else if (contentType == HttpContentTypeJson) {
        // JSON方式
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager.requestSerializer setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",nil];
    }
    
    return manager;
}
//
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *mgr = [self setupAFManagerWithContentType:HttpContentTypeJson];
    
    [mgr GET:url parameters:params progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *mgr = [self setupAFManagerWithContentType:HttpContentTypeJson];
    
    // 2.发送请求
    [mgr POST:url parameters:params progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    // 1.创建请求管理对象
    AFHTTPSessionManager *mgr = [self setupAFManagerWithContentType:HttpContentTypeFrom];
    
    [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull totalFormData) {
        for (RXFormData *formData in formDataArray) {
            [totalFormData appendPartWithFileData:formData.data name:formData.name fileName:formData.filename mimeType:formData.mimeType];
        }
    } progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end

/**
 *  用来封装文件数据的模型
 */
@implementation RXFormData

@end
