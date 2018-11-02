//
//  HLHJADView.h
//  HLHJInformationSDK
//
//  Created by mac on 2018/10/29.
//  Copyright © 2018 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PPTypeAdvertisement) {
    PPTypeAdvertisementVideo,//video
    PPTypeAdvertisementImgage //Image
};


@interface HLHJADView : UIView


/**
 初始化
 目前暂时只支持视频广告

 @param frame 广告frame
 @param type 广告类型
 @param adUrl 广告显示显示的链接
 @param adContenturl 广告内容
 @param isInterfaceOrientation YES:横屏 NO:竖屏
 @return nil
 */
- (instancetype)initWithFrame:(CGRect)frame
             advertisemenType:(PPTypeAdvertisement)type
                   adAdvertisementUrl:(NSString *)adUrl
                   adAdvertisementContentUrl:(NSString *)adContenturl
                   interfaceOrientation:(BOOL )isInterfaceOrientation;
///展示广告
- (void)showADView;
///移除u广告
- (void)hideADView;

@end

NS_ASSUME_NONNULL_END
