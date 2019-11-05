//
//  BUAdManager.h
//  spot_different-mobile
//
//  Created by 刘超文 on 2019/9/18.
//

//#ifndef BUAdManager_h
//#define BUAdManager_h
//
//
//#endif /* BUAdManager_h */

#import <Foundation/Foundation.h>
#import "BUAdBanner.h"
#import "BUAdRewardedVideo.h"

@interface BUAdManager : NSObject
@property BUAdBanner *bannerAd;             //banner
@property BUAdRewardedVideo *rewardVideoAd; //激励视频            //视频配置

- (NSString *)appKey;
- (NSString *)bannerAdId;
- (NSString *)videoAdId;

- (void)showRewardVideoAd:(void (^)(NSString *data))success
                  failure:(void (^)(NSString *data))failure;

- (void)showBannerAd;
- (void)hideBannerAd;

// - (void)loadNativeAd:(NSString *)type
//              success:(void (^)(NSString *data))success
//              failure:(void (^)(NSString *data))failure;

// - (void)removeNativeAd:(NSString *)type
//                success:(void (^)(NSString *data))success
//                failure:(void (^)(NSString *data))failure;

+ (void)setAllKeys:(NSString *)key
        banner_key:(NSString *)banner_key
         video_key:(NSString *)video_key;

@end
