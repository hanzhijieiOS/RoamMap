//
//  AnnotationView.h
//  RoamMap
//
//  Created by Jay on 2017/12/2.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKAnnotationView.h>

@interface AnnotationView : BMKAnnotationView

@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UIButton *msgButton;

@property (nonatomic, strong) UIButton *imgButton;

@property (nonatomic, strong) UIButton *voiceButton;

@property (nonatomic, strong) UIButton *vedioButton;

@end
