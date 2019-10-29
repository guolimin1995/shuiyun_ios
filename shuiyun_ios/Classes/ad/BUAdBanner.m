//
//  BUAdManager.h
//

#import "BUAdBanner.h"
#import "BUAdManager.h"
//#import <BUAdSDK/BUBannerAdView.h>
#import <BUAdSDK/BUNativeExpressBannerView.h>
#import <BUAdSDK/BUAdSDK.h>

extern BUAdManager* BuadMgr;

@interface BUAdBanner () <BUNativeExpressBannerViewDelegate>
@property(nonatomic, strong) BUNativeExpressBannerView *bannerView;
@property(nonatomic, strong) BUNativeExpressBannerView *carouselBannerView;
@end

@implementation BUAdBanner

//载入完成，可以进行自定义数据以及动态创建其他控件
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"------ BUAdBanner 载入完成");
}


- (void)loadBannerAd{
    if (self.bannerView == nil) {
        BUSize *imgSize = [BUSize sizeBy:BUProposalSize_Banner600_150];
        const CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
        const CGFloat screenHeight = CGRectGetHeight([UIScreen mainScreen].bounds);
        CGFloat bannerHeight = screenWidth * imgSize.height / imgSize.width;
        self.bannerView = [[BUNativeExpressBannerView alloc]
                           initWithSlotID:[BuadMgr bannerAdId]
                           rootViewController:self
                           imgSize:imgSize
                           adSize:CGSizeMake(screenWidth, bannerHeight)
                           IsSupportDeepLink:YES];
        self.bannerView.frame = CGRectMake(0, screenHeight-bannerHeight, screenWidth, bannerHeight);
        self.bannerView.delegate = self;
        [self.view addSubview:self.bannerView];
    }
    [self.bannerView loadAdData];
}


#pragma mark -  BUNativeExpressBannerViewDelegate

- (void)nativeExpressBannerAdViewDidLoad:(BUNativeExpressBannerView *)bannerAdView {
    
}

- (void)nativeExpressBannerAdView:(BUNativeExpressBannerView *)bannerAdView didLoadFailWithError:(NSError *)error {
    
}

- (void)nativeExpressBannerAdViewRenderSuccess:(BUNativeExpressBannerView *)bannerAdView {
    
}

- (void)nativeExpressBannerAdViewRenderFail:(BUNativeExpressBannerView *)bannerAdView error:(NSError *)error {
    
}

- (void)nativeExpressBannerAdViewWillBecomVisible:(BUNativeExpressBannerView *)bannerAdView {
    
}

- (void)nativeExpressBannerAdViewDidClick:(BUNativeExpressBannerView *)bannerAdView {
    
}

- (void)nativeExpressBannerAdView:(BUNativeExpressBannerView *)bannerAdView dislikeWithReason:(NSArray<BUDislikeWords *> *)filterwords {
    
    [UIView animateWithDuration:0.25 animations:^{
        bannerAdView.alpha = 0;
    } completion:^(BOOL finished) {
        [bannerAdView removeFromSuperview];
        if (self.bannerView == bannerAdView) {
            self.bannerView = nil;
        }
        if (self.carouselBannerView == bannerAdView) {
            self.carouselBannerView = nil;
        }
        if (self.bannerView == bannerAdView) {
            self.bannerView = nil;
        }
    }];
}

-(void)hideBanner{
    [self.bannerView removeFromSuperview];
    self.bannerView = nil;
}

@end
