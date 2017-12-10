//
//  RMAddPointManager.h
//  RoamMap
//
//  Created by Jay on 2017/12/9.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMResultModel.h"
/* 成功回调的block */
typedef void(^RMResultHandle)();

/* 失败回调的block*/
typedef void(^RMErrorHandle)(NSError *error);

@interface RMAddPointManager : NSObject

+ (instancetype)sharedManager;

/**
 *上传坐标点的方法
 *@param name 坐标点的名字
 *@param longitude 坐标
 *@param latitude 坐标
 */
- (void)addPointWithName:(NSString *)name Longitude:(float)longitude Latitude:(float)latitude succeed:(RMResultHandle)succeedBlock error:(RMErrorHandle)errorBlock;



/*
 *添加文字消息接口
 *@param ID 点的ID
 *@param content 文字消息
 */
- (void)addMessgaeWithPointID:(int)ID Content:(NSString *)content succeed:(RMResultHandle)succeedBlock error:(RMErrorHandle)errorBlock;


/**
 *添加图片,音频,视频接口
 *@param file 添加的数据
 @param type 数据类型   （2 图片，3 音频，4 视频）
 @param pointID 点的ID
 */
- (void)uploadWithFile:(NSData *)file Type:(NSInteger)type PointID:(NSInteger)pointID succeed:(RMResultHandle)succeedBlock error:(RMErrorHandle)errorBlock;;



@end
