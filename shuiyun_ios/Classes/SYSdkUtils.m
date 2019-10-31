#import <Foundation/Foundation.h>
#import "SYSdkUtils.h"

#import <GDTActionSDK/GDTAction.h>
#import <UMCommon/UMCommon.h>
// #import <UMAnalytics/MobClick.h>
// #import "BUAdSDK/BUAdSDKManager.h"
// #import "BUAdManager.h"

@implementation SYSdkUtils


// static bool sIsUMInited = false;
// static bool sIsGDTInited = false;
// static bool sIsBUAdInited = false;

// BUAdManager* BuadMgr;



+(void) initUMMobSdk:(NSString*) appKey channel:(NSString*) channel
{
    [UMConfigure setLogEnabled:NO];
    [UMConfigure initWithAppkey:appKey channel:channel];
    // sIsUMInited = true;
}

+(void) initGDTActionSdk:(NSString*) setid secretkey:(NSString*)secretkey
{
    [GDTAction init:setid secretKey:secretkey];
    // sIsGDTInited = true;
}

// +(void) doGDTSDKActionStartApp
// {
//     [GDTAction logAction:GDTSDKActionNameStartApp actionParam:@{@"value":@(123)}];
// }

// +(void) initBUAdSdk:(NSString*) appKey bannerKey:(NSString*) bannerKey videoKey:(NSString*) videoKey
// {
//     [BUAdManager setAllKeys:appKey banner_key:bannerKey video_key:videoKey];
//     BuadMgr = [[BUAdManager alloc] init]; 
//     [BUAdSDKManager setAppID:[BuadMgr appKey]];
//     [BUAdSDKManager setIsPaidApp:NO];
//     // sIsBUAdInited = true;
// }

//显示激励视频
// +(void)showRewardVideoAd: success:(void (^)(NSString *))success failure:(void (^)(NSString *))failure{
//     [BuadMgr loadNativeAd:@"videoAd" success:^(NSString *data) {
//         success(nil);
//     } failure:^(NSString *data) {
//         failure(nil);
//     }];
// }

// +(void)showBannerAd 
// {
//     [BuadMgr loadNativeAd:@"bannerAd" success:^(NSString *data) {
//         //        [[conchRuntime GetIOSConchRuntime] callbackToJSWithObject:self methodName:@"showBannerAd:" ret:@"success"];
//     } failure:^(NSString *data) {
//         //        [[conchRuntime GetIOSConchRuntime] callbackToJSWithObject:self methodName:@"showBannerAd:" ret:@"failed"];
//     }];
// }
// +(void)hideBannerAd 
// {
//     [BuadMgr removeNativeAd:@"bannerAd"  success:^(NSString *data) {
//         //        [[conchRuntime GetIOSConchRuntime] callbackToJSWithObject:self methodName:@"showBannerAd:" ret:@"success"];
//     } failure:^(NSString *data) {
//         //        [[conchRuntime GetIOSConchRuntime] callbackToJSWithObject:self methodName:@"showBannerAd:" ret:@"failed"];
//     }];
// }
@end

// +(bool) isUMInited
// {
//     return sIsUMInited;
// }

// +(bool) isGDTInited
// {
//     return sIsGDTInited;
// }
// +(bool) isBUAdInited
// {
//     return sIsBUAdInited;
// }