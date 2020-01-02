#import "BUAdManager.h"
// #import <BUAdSDK/BURewardedVideoAd.h>
// #import <BUAdSDK/BURewardedVideoModel.h>
#import <BUAdSDK/BUAdSDK.h>
#import "BUAdRewardedVideo.h"

extern BUAdManager* BuadMgr;

// @interface BUAdRewardedVideo () <BURewardedVideoAdDelegate>
// @property (nonatomic, strong) BURewardedVideoAd *rewardedVideoAd;
@interface BUAdRewardedVideo () <BUNativeExpressRewardedVideoAdDelegate>
@property (nonatomic, strong) BUNativeExpressRewardedVideoAd *rewardedVideoAd;
@property (nonatomic, strong) NSString * isShowVideo;
@end

@implementation BUAdRewardedVideo

- (void)dealloc {
    
}

//载入完成，可以进行自定义数据以及动态创建其他控件
- (void)viewDidLoad  {
    [super viewDidLoad];
    NSLog(@"------ BUAdRewardedVideo 载入完成");
}

//加载广告
-(void)loadRewardedVideoAd:(NSString *)name :(void (^)(NSString *))result{
    self.callback = result;
    // BURewardedVideoModel *model = [[BURewardedVideoModel alloc] init];
    // model.userId = @"123";
    // self.rewardedVideoAd = [[BURewardedVideoAd alloc] initWithSlotID:[BuadMgr videoAdId] rewardedVideoModel:model];
    // self.rewardedVideoAd.delegate = self;
    // [self.rewardedVideoAd loadAdData];
    BURewardedVideoModel *model = [[BURewardedVideoModel alloc] init];
    model.userId = @"123";
    self.rewardedVideoAd = [[BUNativeExpressRewardedVideoAd alloc] initWithSlotID:[BuadMgr videoAdId] rewardedVideoModel:model];
    self.rewardedVideoAd.delegate = self;
    if (self.rewardedVideoAd.isAdValid) {
        [self.rewardedVideoAd showAdFromRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }else{
        [self.rewardedVideoAd loadAdData];
    }
    
    self.isShowVideo = @"yes";
}

#pragma mark BURewardedVideoAdDelegate

- (void)nativeExpressRewardedVideoAdDidLoad:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ rewardedVideoAd data load success");
}

- (void)nativeExpressRewardedVideoAd:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"------ rewardedVideoAd video load success %@",rewardedVideoAd);
}

- (void)nativeExpressRewardedVideoAdDidDownLoadVideo:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ nativeExpressRewardedVideoAdDidDownLoadVideo video load success %@",rewardedVideoAd);
}

- (void)nativeExpressRewardedVideoAdViewRenderSuccess:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ nativeExpressRewardedVideoAdViewRenderSuccess video load success %@",rewardedVideoAd);
    if([self.isShowVideo isEqualToString:@"yes"]){
        [self.rewardedVideoAd showAdFromRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }

}

- (void)nativeExpressRewardedVideoAdViewRenderFail:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd error:(NSError *_Nullable)error {
    NSLog(@"------ nativeExpressRewardedVideoAdViewRenderFail video load success %@",rewardedVideoAd);
    self.callback(@"failed");

}

- (void)nativeExpressRewardedVideoAdWillVisible:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ rewardedVideoAd video will visible");
}

- (void)nativeExpressRewardedVideoAdDidVisible:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ rewardedVideoAd video did visible");
}

- (void)nativeExpressRewardedVideoAdWillClose:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ nativeExpressRewardedVideoAdWillClose");
}

- (void)nativeExpressRewardedVideoAdDidClose:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ nativeExpressRewardedVideoAdDidClose");
    self.callback(@"success");
    // [self.rewardedAd loadAdData];
    self.isShowVideo = @"no";
    [self.rewardedVideoAd loadAdData];
}

- (void)nativeExpressRewardedVideoAdDidClick:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ rewardedVideoAd video did click");
}

- (void)nativeExpressRewardedVideoAdDidClickSkip:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ nativeExpressRewardedVideoAdDidClickSkip");
}

- (void)nativeExpressRewardedVideoAdDidPlayFinish:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"------ nativeExpressRewardedVideoAdDidPlayFinish");
}

- (void)nativeExpressRewardedVideoAdServerRewardDidSucceed:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd verify:(BOOL)verify {
    NSLog(@"------ nativeExpressRewardedVideoAdServerRewardDidSucceed");
}

- (void)nativeExpressRewardedVideoAdServerRewardDidFail:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ nativeExpressRewardedVideoAdServerRewardDidFail");
}


// //激励视频广告-物料-加载成功
// - (void)rewardedVideoAdDidLoad:(BURewardedVideoAd *)rewardedVideoAd {
//     NSLog(@"------ rewardedVideoAd data load success");
//     [self.rewardedVideoAd showAdFromRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
// }

// // 激励视频广告-视频-加载成功
// - (void)rewardedVideoAdVideoDidLoad:(BURewardedVideoAd *)rewardedVideoAd {
//     NSLog(@"------ rewardedVideoAd video load success %@",rewardedVideoAd);
//     //    [rewardedVideoAd showAdFromRootViewController:self.navigationController];
// }


// //广告位即将展示
// - (void)rewardedVideoAdWillVisible:(BURewardedVideoAd *)rewardedVideoAd {
//     NSLog(@"------ rewardedVideoAd video will visible");
// }

// //广告位已经展示
// - (void)rewardedVideoAdDidVisible:(BURewardedVideoAd *)rewardedVideoAd{
//     NSLog(@"------ rewardedVideoAd video did visible");
// }


// //激励视频广告关闭
// - (void)rewardedVideoAdDidClose:(BURewardedVideoAd *)rewardedVideoAd {
//     NSLog(@"------ rewardedVideoAd video did close");
    
//     self.callback(@"success");
// }

// //激励视频广告点击
// - (void)rewardedVideoAdDidClick:(BURewardedVideoAd *)rewardedVideoAd {
//     NSLog(@"------ rewardedVideoAd video did click");
// }

// //激励视频广告素材加载失败
// - (void)rewardedVideoAd:(BURewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
//     NSLog(@"------ rewardedVideoAd data load fail %@",error);
//     self.callback(@"failed");
// }

// //激励视频广告播放完成或发生错误
// - (void)rewardedVideoAdDidPlayFinish:(BURewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
//     if (error) {
//         NSLog(@"rewardedVideoAd play error %@",error);
//         self.callback(@"failed");
//     } else {
//         NSLog(@"rewardedVideoAd play finish");
//     }
// }

// // 终端返回非 20000
// - (void)rewardedVideoAdServerRewardDidFail:(BURewardedVideoAd *)rewardedVideoAd {
//     NSLog(@"rewardedVideoAd verify failed");
// }

// //服务器校验后的结果,异步 rewardedVideoAd publisher 终端返回 20000
// - (void)rewardedVideoAdServerRewardDidSucceed:(BURewardedVideoAd *)rewardedVideoAd verify:(BOOL)verify{
//     NSLog(@"rewardedVideoAd verify succeed");
//     NSLog(@"verify result: %@", verify ? @"success" : @"fail");
// }

// -(BOOL)shouldAutorotate{
//     return YES;
// }

// // 支持哪些屏幕方向
// - (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//     return UIInterfaceOrientationMaskAll;
// }

@end


