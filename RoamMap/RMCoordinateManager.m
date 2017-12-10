//
//  RMCoordinateManager.m
//  RoamMap
//
//  Created by Jay on 2017/12/6.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import "RMCoordinateManager.h"
#import "AFNetworking.h"
#import "RMCoordinateModel.h"
#import "RMGetPointModel.h"

@implementation RMCoordinateManager

static RMCoordinateManager *manager = nil;

+ (id)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)fetchCoordinateDataWithPointID:(int)ID succeed:(RMCoordinateHandle)succeedBlock error:(ErrorHandle)errorBlock{
    NSString *URL = [NSString stringWithFormat:@"http://47.95.233.207/map/getMessage/%d",ID];
    [[AFHTTPSessionManager manager] GET:URL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error;
        NSLog(@"resp:%@",responseObject);
        RMCoordinateModel *model = [[RMCoordinateModel alloc] initWithDictionary:responseObject error:&error];
        if (error) {
            errorBlock(error);
        }else{
            if (model.status == 0) {
                succeedBlock(model);
            }else{
                NSError *error = [[NSError alloc] initWithDomain:model.msg code:(NSInteger)model.status userInfo:nil];
                errorBlock(error);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

- (void)fetchPointWithLongitude:(double)longitude Latitude:(double)latitude Range:(int)range succeed:(RMGetPointHandle)succeedBlock error:(ErrorHandle)errorBlock{
    NSString *URL = [NSString stringWithFormat:@"http://47.95.233.207/map/getPoints?longitude=%lf&latitude=%lf&range=%d",longitude,latitude,range];
    
    NSDictionary *param = @{@"longitude":[NSNumber numberWithDouble:longitude],@"latitude":[NSNumber numberWithDouble:latitude],@"range":[NSNumber numberWithInt:range]};
    
    [[AFHTTPSessionManager manager] POST:URL parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"response : %@",[responseObject objectForKey:@"msg"]);
        NSError *error;
        RMGetPointModel *model = [[RMGetPointModel alloc] initWithDictionary:responseObject error:&error];
        if (error) {
            errorBlock(error);
        }else{
            if (model.status == 0) {
                succeedBlock(model);
            }else{
                NSError *error = [[NSError alloc] initWithDomain:model.msg code:(NSInteger)model.status userInfo:nil];
                        errorBlock(error);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
    
//    [[AFHTTPSessionManager manager] GET:URL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"response : %@",[responseObject objectForKey:@"msg"]);
//        NSError *error;
//        RMGetPointModel *model = [[RMGetPointModel alloc] initWithDictionary:responseObject error:&error];
//        if (error) {
//            errorBlock(error);
//        }else{
//            if (model.status == 0) {
//                succeedBlock(model);
//            }else{
//                NSError *error = [[NSError alloc] initWithDomain:model.msg code:(NSInteger)model.status userInfo:nil];
//                errorBlock(error);
//            }
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        errorBlock(error);
//    }];
}

@end

