//
//  RMImageVIew.m
//  RoamMap
//
//  Created by Jay on 2017/12/4.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import "RMImageView.h"
#import "RMTableViewCell.h"

@interface RMImageView()<UITableViewDataSource>

@property (nonatomic, copy) NSArray *imageArray;

@end

@implementation RMImageView

static NSString *identifier = @"RMTableViewCell";

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.rowHeight = ([UIScreen mainScreen].bounds.size.width / 2.0 - 7.5) * 0.75 + 5;
        [self registerClass:[RMTableViewCell class] forCellReuseIdentifier:identifier];
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
//    [cell updateImageWithURL:self.imageArray[indexPath.row * 2] andURL:self.imageArray[indexPath.row * 2 + 1]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
    //return (self.imageArray.count + 1 )/ 2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
