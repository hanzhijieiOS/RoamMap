//
//  RMCoordinateManager.h
//  RoamMap
//
//  Created by Jay on 2017/12/6.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMCoordinateModel.h"
#import "RMGetPointModel.h"

// 定位请求返回数据的block
typedef void(^RMCoordinateHandle)(RMCoordinateModel *resultModel);

// 获取周边point的回调block
typedef void(^RMGetPointHandle)(RMGetPointModel *pointModel);

// 请求失败统一回调block
typedef void(^ErrorHandle)(NSError *error);

@interface RMCoordinateManager : NSObject

+ (instancetype)sharedManager;

// 获取坐标点的信息方法
- (void)fetchCoordinateDataWithPointID:(int)id succeed:(RMCoordinateHandle)succeedBlock error:(ErrorHandle)errorBlock;

// 获取周围坐标的方法
- (void)fetchPointWithLongitude:(double)longitude Latitude:(double)latitude Range:(int)range succeed:(RMGetPointHandle)succeedBlock error:(ErrorHandle)errorBlock;

@end

