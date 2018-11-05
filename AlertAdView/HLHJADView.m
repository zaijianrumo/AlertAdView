//
//  HLHJADView.m
//  HLHJInformationSDK
//
//  Created by mac on 2018/10/29.
//  Copyright © 2018 mac. All rights reserved.
//

#import "HLHJADView.h"
#import <AVFoundation/AVFoundation.h>

// 图片路径
#define HLHJADViewSrcName(file) [@"HLHJADView.bundle" stringByAppendingPathComponent:file]
#define HLHJADViewFrameworkSrcName(file) [@"Frameworks/HLHJADView.framework/HLHJADView.bundle" stringByAppendingPathComponent:file]
#define HLHJADViewImage(file) [UIImage imageNamed:HLHJADViewSrcName(file)] ? :[UIImage imageNamed:HLHJADViewFrameworkSrcName(file)]


@interface HLHJADView()

///AD View
@property (nonatomic, strong) UIView  *AdView;
//播放器对象
@property (nonatomic,strong) AVPlayer *player;

@property (nonatomic,strong) AVPlayerItem *currentPlayerItem;
///AD frame
@property (nonatomic, assign) CGRect viewframe;
///AD View show url 显示广告内容的链接
@property (nonatomic, copy) NSString  *adAdvertisementUrl;
///AD View openURL 点击广告跳转的链接
@property (nonatomic, copy) NSString  *adAdvertisementContentUrl;
/// 横屏
@property (nonatomic, assign) BOOL    isInterfaceOrientation;



@end

@implementation HLHJADView
///初始化
- (instancetype)initWithFrame:(CGRect)frame
             advertisemenType:(PPTypeAdvertisement)type
           adAdvertisementUrl:(NSString *)adUrl
    adAdvertisementContentUrl:(NSString *)adContenturl
         interfaceOrientation:(BOOL )isInterfaceOrientation {
    
    if (self == [super initWithFrame:frame]) {
        self.viewframe = frame;
        self.adAdvertisementUrl = adUrl;
        self.adAdvertisementContentUrl = adContenturl;
        self.isInterfaceOrientation = isInterfaceOrientation;
    }
    return self;
    
}

#pragma mark - 展示广告
- (void)showADView {
 
     UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
     self.frame = window.frame;
     self.backgroundColor = [UIColor clearColor];
     [window addSubview:self];

     [self addSubview:self.AdView];
    
    ///创建播放器
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:self.adAdvertisementUrl]];
    self.currentPlayerItem = playerItem;
    self.player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
    
    AVPlayerLayer *avLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    avLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    avLayer.frame = _AdView.bounds;
    [_AdView.layer addSublayer:avLayer];
    [self.player play];
    
    
    ///广告标签
    UILabel *adLab = [[UILabel alloc]init];
    adLab.frame = CGRectMake(0, 0, 29, 13);
    adLab.text = @"广告";
    adLab.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:10];
    adLab.textAlignment = NSTextAlignmentCenter;
    adLab.textColor = [UIColor whiteColor];
    adLab.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:.3];
    [self.AdView addSubview:adLab];
    [adLab bringSubviewToFront:self];
    
     // 关闭按钮
    UIButton *colseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [colseBtn setImage:HLHJADViewImage(@"ic_close") forState:UIControlStateNormal]; forState:UIControlStateNormal];
    colseBtn.frame = CGRectMake(self.AdView.frame.size.width - 20, 0, 20, 20);
    [colseBtn addTarget:self action:@selector(closeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.AdView addSubview:colseBtn];
    [colseBtn bringSubviewToFront:self];
    
    if(self.isInterfaceOrientation) {
        CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2);
        self.AdView.transform = transform;
    }
}
#pragma mark -  隐藏广告
- (void)hideADView {
    
    [self removeFromSuperview];
    [self.player pause];
    
}

- (void)closeBtnAction {
    
    [self hideADView];
}

- (void)adViewTapClickAction {
    
    [self hideADView];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.adAdvertisementContentUrl]];
    
}

- (UIView *)AdView {
    if (!_AdView) {
        _AdView = [[UIView alloc]initWithFrame:self.viewframe];
        _AdView.backgroundColor = [UIColor clearColor];
        _AdView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapClick = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(adViewTapClickAction)];
        [_AdView addGestureRecognizer:tapClick];
    }
    return _AdView;
    
}

@end
