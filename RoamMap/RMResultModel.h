//
//  RMResultModel.h
//  RoamMap
//
//  Created by Jay on 2017/12/6.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import "JSONModel.h"

@interface RMResultModel : JSONModel

@property (nonatomic, assign) NSUInteger status;

@property (nonatomic, copy) NSString <Optional> *msg;

@end
