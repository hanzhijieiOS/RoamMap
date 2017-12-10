//
//  RMTableViewCell.m
//  RoamMap
//
//  Created by Jay on 2017/12/4.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import "RMTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface RMTableViewCell()

@property (nonatomic, strong) UIImageView *imgView1;

@property (nonatomic, strong) UIImageView *imgView2;

@end

@implementation RMTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.imgView1];
        [self addSubview:self.imgView2];
    }
    return self;
}

- (UIImageView *)imgView1{
    if (!_imgView1) {
        _imgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 2.5, [UIScreen mainScreen].bounds.size.width / 2.0 - 7.5, ([UIScreen mainScreen].bounds.size.width / 2.0 - 7.5) * 0.75)];
        _imgView1.backgroundColor = [UIColor yellowColor];
    }
    return _imgView1;
}

- (UIImageView *)imgView2{
    if (!_imgView2) {
        _imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2.0 + 2.5, 2.5, [UIScreen mainScreen].bounds.size.width / 2.0 - 7.5, ([UIScreen mainScreen].bounds.size.width / 2.0 - 7.5) * 0.75)];
        _imgView2.backgroundColor = [UIColor blueColor];
    }
    return _imgView2;
}

- (void)updateImageWithURL:(NSString *)URL1 andURL:(NSString *)URL2{
    [self.imgView1 sd_setImageWithURL:[NSURL URLWithString:[URL1 copy]] placeholderImage:nil];
    if (URL2) {
        [self.imgView2 sd_setImageWithURL:[NSURL URLWithString:[URL2 copy]] placeholderImage:nil];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
