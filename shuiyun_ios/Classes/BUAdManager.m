//
//  BUAdManager.m
//  spot_different-mobile
//
//  Created by 刘超文 on 2019/9/18.
//

#import "BUAdManager.h"
#import "BUAdBanner.h"


NSString *BUAdKey = @"";
NSString *bannerKey = @"";
NSString *videoKey = @"";

@implementation BUAdManager


+(void)setAllKeys:(NSString*)key banner_key:(NSString*)banner_key video_key:(NSString*)video_key{
    BUAdKey = key;
    bannerKey = banner_key;
    videoKey = video_key;
}

- (NSString *)appKey {
    return BUAdKey;
}

//@"916907362"
-(NSString *)bannerAdId{
    return bannerKey;
}

//@"916907297"
-(NSString*)videoAdId{
    return videoKey;
}


//加载广告
-(void)loadNativeAd:(NSString *)type success:(void (^)(NSString *))success failure:(void (^)(NSString *))failure{
    //    NSLog(@"------ 加载广告 %@",type);
    NSArray *aName = [NSArray arrayWithObjects:@"bannerAd",@"videoAd",nil];
    int index = (int)[aName indexOfObject:type];
    switch (index) {
        case 0:         //banner广告
        {
            if (!self.bannerAd) {
                self.bannerAd = [BUAdBanner new];
                [[self getRootViewController].view addSubview:self.bannerAd.view];
                //                [[self getRootViewController].navigationController pushViewController:self.bannerAd.view animated:YES];
            }
            [self.bannerAd loadBannerAd];       //加载banner广告
            break;
        }
        case 1:         //激励视频
        {
            if (!self.rewardVideoAd) {
                self.rewardVideoAd = [BUAdRewardedVideo new];
                //[[self getRootViewController].view addSubview:self.rewardVideoAd.view];
                [[self getRootViewController].navigationController pushViewController:self.rewardVideoAd animated:YES];
            }
            
            //加载激励视频广告
            [self.rewardVideoAd loadRewardedVideoAd:@"" :^(NSString *data) {
                if ([data isEqualToString:@"success"]) {
                    success(nil);
                }else{
                    failure(nil);
                }
            }];
            break;
        }
        default:
        break;
    }
}

//
-(void)removeNativeAd:(NSString *)type success:(void (^)(NSString *))success failure:(void (^)(NSString *))failure{
    NSArray *aName = [NSArray arrayWithObjects:@"bannerAd",@"videoAd",nil];
    int index = (int)[aName  indexOfObject:type];
    switch (index) {
        case 0:         //banner广告
        [self.bannerAd hideBanner];
        
        break;
        case 1:         //激励视频
        
        break;
        default:
        break;
    }
}

-(UIViewController *)getRootViewController{
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    return window.rootViewController;
}


@end

