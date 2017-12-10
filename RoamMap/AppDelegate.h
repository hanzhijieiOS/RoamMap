//
//  AppDelegate.h
//  RoamMap
//
//  Created by Jay on 2017/12/2.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) BMKMapManager *mapManager;

@end

