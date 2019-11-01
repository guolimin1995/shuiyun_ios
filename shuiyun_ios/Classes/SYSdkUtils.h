#ifndef SYSdkUtils_h
#define SYSdkUtils_h

#import <Foundation/Foundation.h>

@interface SYSdkUtils : NSObject

+ (void)initUMMobSdk:(NSString *)appKey channel:(NSString *)channel;
// + (void)initGDTActionSdk:(NSString *)setid secretkey:(NSString *)secretkey;
// + (void)doGDTSDKActionStartApp;
// + (void)initBUAdSdk:(NSString *)appkey bannerKey:(NSString *)bannerKey videoKey:(NSString *)videoKey;

// + (void)showRewardVideoAd:success
//                          :(void (^)(NSString *data))success
//                   failure:(void (^)(NSString *data))failure;

// + (void)showBannerAd;
// + (void)hideBannerAd;

// + (bool)isBUAdInited;
// + (bool)isUMInited;
// + (bool)isGDTInited;
@end

#endif