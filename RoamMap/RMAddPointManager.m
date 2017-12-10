//
//  RMAddPointManager.m
//  RoamMap
//
//  Created by Jay on 2017/12/9.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import "RMAddPointManager.h"
#import "AFNetworking.h"
#import "RMResultModel.h"

@implementation RMAddPointManager

+ (id)sharedManager{
    static RMAddPointManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}



- (void)addPointWithName:(NSString *)name Longitude:(float)longitude Latitude:(float)latitude succeed:(RMResultHandle)succeedBlock error:(RMErrorHandle)errorBlock{
    NSString *URL = [NSString stringWithFormat:@"http://47.95.233.207/map/addPoint"];
    NSDictionary *param = @{@"name":[name copy],@"longitude":[NSNumber numberWithFloat:longitude],@"latitude":[NSNumber numberWithFloat:latitude]};
    [[AFHTTPSessionManager manager] POST:URL parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        RMResultModel *model = [[RMResultModel alloc] initWithDictionary:responseObject error:&error];
        if (error) {
            errorBlock(error);
        }else{
            if (model.status == 0) {
                succeedBlock();
            }else{
                NSError *error = [NSError errorWithDomain:model.msg code:model.status userInfo:nil];
                errorBlock(error);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

- (void)addMessgaeWithPointID:(int)ID Content:(NSString *)content succeed:(RMResultHandle)succeedBlock error:(RMErrorHandle)errorBlock{
    NSString *URL = [NSString stringWithFormat:@"http://47.95.233.207/map/addMessage/%d",ID];
    NSDictionary *param = @{@"type":[NSNumber numberWithInteger:1],@"content":[content copy]};
    [[AFHTTPSessionManager manager] POST:URL parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        RMResultModel * model = [[RMResultModel alloc] initWithDictionary:responseObject error:&error];
        if (error) {
            errorBlock(error);
        }else{
            if (model.status == 0) {
                succeedBlock();
            }else{
                NSError *error = [NSError errorWithDomain:model.msg code:model.status userInfo:nil];
                errorBlock(error);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

- (void)uploadWithFile:(NSData *)file Type:(NSInteger)type PointID:(NSInteger)pointID succeed:(RMResultHandle)succeedBlock error:(RMErrorHandle)errorBlock{
    NSString *URL = [NSString stringWithFormat:@"http://47.95.233.207/map/upload"];
    NSDictionary *param = @{@"file":[file copy],@"type":[NSNumber numberWithInteger:type],@"pointID":[NSNumber numberWithInteger:pointID]};
    [[AFHTTPSessionManager manager] POST:URL parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        RMResultModel * model = [[RMResultModel alloc] initWithDictionary:responseObject error:&error];
        if (error) {
            errorBlock(error);
        }else{
            if (model.status == 0) {
                succeedBlock();
            }else{
                NSError *error = [NSError errorWithDomain:model.msg code:model.status userInfo:nil];
                errorBlock(error);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

@end
