//
//  RMCoordinateModel.h
//  RoamMap
//
//  Created by Jay on 2017/12/6.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import "RMResultModel.h"

@protocol RMDataItemModel
@end

@interface RMDataItemModel : JSONModel

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger pointId;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *content;

@end

@interface RMCoordinateModel : RMResultModel

@property (nonatomic, copy) NSArray <Optional,RMDataItemModel> *data;

@end
