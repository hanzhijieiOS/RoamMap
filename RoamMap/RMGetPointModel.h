//
//  RMGetPointModel.h
//  RoamMap
//
//  Created by Jay on 2017/12/6.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import "RMResultModel.h"
#import "JSONModel.h"

@protocol RMPointItemModel

@end

@interface RMPointItemModel : JSONModel

@property (nonatomic, assign) int id;

@property (nonatomic, assign) double longitude;

@property (nonatomic, assign) double latitude;

@end

@interface RMGetPointModel : RMResultModel

@property (nonatomic, copy) NSArray <Optional,RMPointItemModel>* data;

@end
