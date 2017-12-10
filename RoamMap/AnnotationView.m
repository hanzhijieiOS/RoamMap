//
//  AnnotationView.m
//  RoamMap
//
//  Created by Jay on 2017/12/2.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import "AnnotationView.h"

@implementation AnnotationView

- (id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
        self.centerOffset = CGPointMake(0, 0);
        self.frame = CGRectMake(0, 0, 39, 39);
        _bgImageView = [[UIImageView alloc] initWithFrame:self.frame];
        _bgImageView.image = [UIImage imageNamed:@"位置.png"];
        [self addSubview:_bgImageView];
        UIView * paoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 140, 40)];
        paoView.backgroundColor = [UIColor whiteColor];
        paoView.layer.cornerRadius = 5.0f;
        paoView.layer.masksToBounds = YES;
        self.paopaoView = [[BMKActionPaopaoView alloc] initWithCustomView:paoView];
        
        self.msgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.msgButton.frame = CGRectMake(3, 5, 30, 30);
        [self.msgButton setImage:[UIImage imageNamed:@"文字"] forState:UIControlStateNormal];
        [paoView addSubview:self.msgButton];
        self.voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.voiceButton.frame = CGRectMake(36, 5, 30, 30);
        [self.voiceButton setImage:[UIImage imageNamed:@"语音"] forState:UIControlStateNormal];
        [paoView addSubview:self.voiceButton];
        self.imgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.imgButton.frame = CGRectMake(69, 5, 30, 30);
        [self.imgButton setImage:[UIImage imageNamed:@"图片"] forState:UIControlStateNormal];
        [paoView addSubview:self.imgButton];
        self.vedioButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.vedioButton.frame = CGRectMake(102, 5, 30, 30);
        [self.vedioButton setImage:[UIImage imageNamed:@"视频"] forState:UIControlStateNormal];
        [paoView addSubview:self.vedioButton];
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
