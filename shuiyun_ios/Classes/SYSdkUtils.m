#import <Foundation/Foundation.h>
#import "SYSdkUtils.h"

// #import <GDTActionSDK/GDTAction.h>
#import <UMCommon/UMCommon.h>
#import <AdSupport/AdSupport.h>
#import "BUAdSDK/BUAdSDKManager.h"
#import "BUAdManager.h"

@implementation SYSdkUtils


// static bool sIsUMInited = false;
// static bool sIsGDTInited = false;
// static bool sIsBUAdInited = false;

BUAdManager* BuadMgr;



+(void) initUMMobSdk:(NSString*) appKey channel:(NSString*) channel
{
    [UMConfigure initWithAppkey:appKey channel:channel];
    // [MobClick setScenarioType:E_UM_GAME];//支持游戏场景
    // sIsUMInited = true;
}

// +(void) initGDTActionSdk:(NSString*) setid secretkey:(NSString*)secretkey
// {
//     [GDTAction init:setid secretKey:secretkey];
//     // sIsGDTInited = true;
// }

+(void) initMonitor:(NSString *) gameid
{
        NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        //1.创建会话对象
        NSURLSession *session = [NSURLSession sharedSession];
        //2.根据会话对象创建task
        NSString *post_url = [NSString stringWithFormat:@"https://pay.ishuiyun.com/server/public/ocean/engine/check_monitor?os=1&game=%@", gameid];
        NSURL *url = [NSURL URLWithString:post_url];
        
        //3.创建可变的请求对象
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        //4.修改请求方法为POST
        request.HTTPMethod = @"POST";
        
        //5.设置请求体
        NSString* data = [NSString stringWithFormat:@"%@%@%@",@"idfa=",idfa,@"&type=JSON"];
        request.HTTPBody = [data dataUsingEncoding:NSUTF8StringEncoding];
        
        //6.根据会话对象创建一个Task(发送请求）
        /*
         第一个参数：请求对象
         第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
         data：响应体信息（期望的数据）
         response：响应头信息，主要是对服务器端的描述
         error：错误信息，如果请求失败，则error有值
         */
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           //8.解析数据
            @try {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                NSLog(@"解析数据 %@",dict);
           }
           @catch (NSException *exception){
               NSLog(@"请求错误");
           }

        }];
        
        //7.执行任务
        [dataTask resume];
}

// +(void) doGDTSDKActionStartApp
// {
//     [GDTAction logAction:GDTSDKActionNameStartApp actionParam:@{@"value":@(123)}];
// }

+(void) initBUAdSdk:(NSString*) appKey bannerKey:(NSString*) bannerKey videoKey:(NSString*) videoKey
{
    [BUAdManager setAllKeys:appKey banner_key:bannerKey video_key:videoKey];
    BuadMgr = [[BUAdManager alloc] init]; 
    [BUAdSDKManager setAppID:appKey];
    [BUAdSDKManager setIsPaidApp:NO];
    // sIsBUAdInited = true;
}

// // 显示激励视频
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