#import <BUAdSDK/BUAdSDK.h>
#import "BUAdFullVideo.h"
#import "BUAdManager.h"

// @interface BUAdRewardedVideo () <BURewardedVideoAdDelegate>
// @property (nonatomic, strong) BURewardedVideoAd *rewardedVideoAd;
@interface BUAdFullVideo () <BUNativeExpressFullscreenVideoAdDelegate>
@property (nonatomic, strong) BUNativeExpressFullscreenVideoAd *fullscreenAd;
@property (nonatomic, strong) NSString * isShowVideo;
@end

extern BUAdManager* BuadMgr;

@implementation BUAdFullVideo

- (void)dealloc {
    
}

//载入完成，可以进行自定义数据以及动态创建其他控件
- (void)viewDidLoad  {
    [super viewDidLoad];
    NSLog(@"------ FullVideoAd 载入完成");
}

//加载广告
-(void)loadFullVideoAd:(NSString *)name :(void (^)(NSString *))result{
    self.callback = result;
    self.fullscreenAd = [[BUNativeExpressFullscreenVideoAd alloc] initWithSlotID:[BuadMgr fullAdId]];
    self.fullscreenAd.delegate = self;
    if (self.fullscreenAd.isAdValid) {
        [self.fullscreenAd showAdFromRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }else{
        [self.fullscreenAd loadAdData];
    }
    
    self.isShowVideo = @"yes";
}

#pragma mark BUFullscreenVideoAdDelegate

- (void)nativeExpressFullscreenVideoAdDidLoad:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    NSLog(@"------ nativeExpressFullscreenVideoAdDidLoad");
}

- (void)nativeExpressFullscreenVideoAd:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"------ nativeExpressFullscreenVideoAd %@",fullscreenVideoAd);
}

- (void)nativeExpressFullscreenVideoAdViewRenderSuccess:(BUNativeExpressFullscreenVideoAd *)rewardedVideoAd {
    NSLog(@"------ nativeExpressFullscreenVideoAdViewRenderSuccess");
    if([self.isShowVideo isEqualToString:@"yes"]){
          [self.fullscreenAd showAdFromRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
      }
}

- (void)nativeExpressFullscreenVideoAdViewRenderFail:(BUNativeExpressFullscreenVideoAd *)rewardedVideoAd error:(NSError *_Nullable)error {
    NSLog(@"------ nativeExpressFullscreenVideoAdViewRenderFail");
    self.callback(@"failed");
}

- (void)nativeExpressFullscreenVideoAdDidDownLoadVideo:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    NSLog(@"------ nativeExpressFullscreenVideoAdDidDownLoadVideo");
}

- (void)nativeExpressFullscreenVideoAdWillVisible:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    NSLog(@"------ nativeExpressFullscreenVideoAdWillVisible");
}

- (void)nativeExpressFullscreenVideoAdDidVisible:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    NSLog(@"------ nativeExpressFullscreenVideoAdDidVisible");
}

- (void)nativeExpressFullscreenVideoAdDidClick:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    NSLog(@"------ nativeExpressFullscreenVideoAdDidClick");
}

- (void)nativeExpressFullscreenVideoAdDidClickSkip:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    NSLog(@"------ nativeExpressFullscreenVideoAdDidClickSkip");
    self.callback(@"failed");
    self.isShowVideo = @"no";
    [self.fullscreenAd loadAdData];
}

- (void)nativeExpressFullscreenVideoAdWillClose:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    NSLog(@"------ nativeExpressFullscreenVideoAdWillClose");
}

- (void)nativeExpressFullscreenVideoAdDidClose:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd {
    NSLog(@"------ nativeExpressFullscreenVideoAdDidClose");
    self.callback(@"success");
    // [self.rewardedAd loadAdData];
    self.isShowVideo = @"no";
    [self.fullscreenAd loadAdData];
}

- (void)nativeExpressFullscreenVideoAdDidPlayFinish:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"------ nativeExpressFullscreenVideoAdDidPlayFinish");
}


@end



