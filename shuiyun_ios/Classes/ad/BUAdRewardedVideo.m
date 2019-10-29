#import "BUAdRewardedVideo.h"
#import "BUAdManager.h"
#import <BUAdSDK/BURewardedVideoAd.h>
#import <BUAdSDK/BURewardedVideoModel.h>

extern BUAdManager* BuadMgr;

@interface BUAdRewardedVideo () <BURewardedVideoAdDelegate>
@property (nonatomic, strong) BURewardedVideoAd *rewardedVideoAd;
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
    BURewardedVideoModel *model = [[BURewardedVideoModel alloc] init];
    model.userId = @"123";
    self.rewardedVideoAd = [[BURewardedVideoAd alloc] initWithSlotID:[BuadMgr videoAdId] rewardedVideoModel:model];
    self.rewardedVideoAd.delegate = self;
    [self.rewardedVideoAd loadAdData];
}

#pragma mark BURewardedVideoAdDelegate

//激励视频广告-物料-加载成功
- (void)rewardedVideoAdDidLoad:(BURewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ rewardedVideoAd data load success");
    [self.rewardedVideoAd showAdFromRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

// 激励视频广告-视频-加载成功
- (void)rewardedVideoAdVideoDidLoad:(BURewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ rewardedVideoAd video load success %@",rewardedVideoAd);
    //    [rewardedVideoAd showAdFromRootViewController:self.navigationController];
}


//广告位即将展示
- (void)rewardedVideoAdWillVisible:(BURewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ rewardedVideoAd video will visible");
}

//广告位已经展示
- (void)rewardedVideoAdDidVisible:(BURewardedVideoAd *)rewardedVideoAd{
    NSLog(@"------ rewardedVideoAd video did visible");
}


//激励视频广告关闭
- (void)rewardedVideoAdDidClose:(BURewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ rewardedVideoAd video did close");
    
    self.callback(@"success");
}

//激励视频广告点击
- (void)rewardedVideoAdDidClick:(BURewardedVideoAd *)rewardedVideoAd {
    NSLog(@"------ rewardedVideoAd video did click");
}

//激励视频广告素材加载失败
- (void)rewardedVideoAd:(BURewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
    NSLog(@"------ rewardedVideoAd data load fail %@",error);
    self.callback(@"failed");
}

//激励视频广告播放完成或发生错误
- (void)rewardedVideoAdDidPlayFinish:(BURewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
    if (error) {
        NSLog(@"rewardedVideoAd play error %@",error);
        self.callback(@"failed");
    } else {
        NSLog(@"rewardedVideoAd play finish");
    }
}

// 终端返回非 20000
- (void)rewardedVideoAdServerRewardDidFail:(BURewardedVideoAd *)rewardedVideoAd {
    NSLog(@"rewardedVideoAd verify failed");
}

//服务器校验后的结果,异步 rewardedVideoAd publisher 终端返回 20000
- (void)rewardedVideoAdServerRewardDidSucceed:(BURewardedVideoAd *)rewardedVideoAd verify:(BOOL)verify{
    NSLog(@"rewardedVideoAd verify succeed");
    NSLog(@"verify result: %@", verify ? @"success" : @"fail");
}

-(BOOL)shouldAutorotate{
    return YES;
}

// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end


