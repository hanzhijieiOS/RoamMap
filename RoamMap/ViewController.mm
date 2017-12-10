//
//  ViewController.m
//  RoamMap
//
//  Created by Jay on 2017/12/2.
//  Copyright © 2017年 hanzhijie. All rights reserved.
//

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"
#import "AnnotationView.h"
#import "RMImageController.h"
#import "RMCoordinateManager.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>


@interface ViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>

@property (nonatomic, strong) BMKMapView *mapView;
@property (nonatomic, strong) BMKLocationService *locService;
@property (nonatomic, copy) NSArray *annotationArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView = [[BMKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.zoomLevel = 17;
    [self.view addSubview:self.mapView];
    [self startLocate];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.mapView viewWillAppear];
    self.mapView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.mapView viewWillDisappear];
    self.mapView.delegate = nil;
}

- (void)startLocate{
    BMKLocationViewDisplayParam *displayParam = [[BMKLocationViewDisplayParam alloc] init];
    displayParam.isAccuracyCircleShow = NO;
    displayParam.locationViewImgName = @"icon_center_point";
    [self.mapView updateLocationViewWithParam:displayParam];
    self.mapView.userTrackingMode = BMKUserTrackingModeNone;
    self.mapView.showsUserLocation = YES;
    [self.locService startUserLocationService];
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    [self.mapView updateLocationData:userLocation];
    [[RMCoordinateManager sharedManager] fetchPointWithLongitude:34.555 Latitude:108.906 Range:100 succeed:^(RMGetPointModel *pointModel) {
        [self.mapView removeAnnotations:self.annotationArray];
        self.annotationArray = pointModel.data;
        [self.annotationArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BMKPointAnnotation *annotation = [[BMKPointAnnotation alloc] init];
            annotation.coordinate = CLLocationCoordinate2DMake([[obj objectForKey:@"longitude"] doubleValue], [[obj objectForKey:@"latitude"] doubleValue]);
            [self.mapView addAnnotation:annotation];
        }];
    } error:^(NSError *error) {
        
    }];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self.mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    });
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    if ([annotation isKindOfClass:[BMKUserLocation class]]) {
        return nil;
    }
    AnnotationView *annotationView = (AnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:@"identifier"];
    if (!annotationView) {
        annotationView = [[AnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"identifier"];
        [annotationView.msgButton addTarget:self action:@selector(msgButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [annotationView.voiceButton addTarget:self action:@selector(voiceButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [annotationView.imgButton addTarget:self action:@selector(imageButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [annotationView.vedioButton addTarget:self action:@selector(vedioButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return annotationView;
}

- (NSArray *)annotationArray{
    if (_annotationArray) {
        _annotationArray = [NSMutableArray array];
    }
    return _annotationArray;
}

- (BMKLocationService *)locService{
    if (!_locService) {
        _locService = [[BMKLocationService alloc] init];
        _locService.delegate = self;
    }
    return _locService;
}

- (void)vedioButtonDidClick{
    NSURL *vedioURL = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:vedioURL];
    AVPlayerViewController *vedioVC = [[AVPlayerViewController alloc] init];
    vedioVC.player = player;
    [self presentViewController:vedioVC animated:YES completion:nil];
    [vedioVC.player play];
//    vedioVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
}

- (void)msgButtonDidClick{
    
}

- (void)voiceButtonDidClick{
    
}

- (void)imageButtonDidClick{
    RMImageController *VC = [[RMImageController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}


@end
