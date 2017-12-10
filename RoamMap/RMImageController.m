//
//  RMImageController.m
//  RoamMap
//
//  Created by Jay on 2017/12/4.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import "RMImageController.h"
#import "RMImageView.h"

@interface RMImageController ()<UITableViewDelegate>

@property (nonatomic, strong) RMImageView *imageView;

@end

@implementation RMImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[RMImageView alloc] initWithFrame:CGRectMake(0, 0.5, self.view.frame.size.width, self.view.frame.size.height - 0.5) style:UITableViewStylePlain];
    self.imageView.delegate = self;
    [self.view addSubview:self.imageView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
