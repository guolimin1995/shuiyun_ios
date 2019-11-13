# shuiyun_ios

[![CI Status](https://img.shields.io/travis/913108060@qq.com/shuiyun_ios.svg?style=flat)](https://travis-ci.org/913108060@qq.com/shuiyun_ios)
[![Version](https://img.shields.io/cocoapods/v/shuiyun_ios.svg?style=flat)](https://cocoapods.org/pods/shuiyun_ios)
[![License](https://img.shields.io/cocoapods/l/shuiyun_ios.svg?style=flat)](https://cocoapods.org/pods/shuiyun_ios)
[![Platform](https://img.shields.io/cocoapods/p/shuiyun_ios.svg?style=flat)](https://cocoapods.org/pods/shuiyun_ios)


## Requirements
pod 

## Installation

shuiyun_ios is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
# 安装
# 最小 ios deployment_target: 8.0
pod 'shuiyun_ios'

# 使用

在目标target
HEADER_SEARCH_PATHS 加上 $(inherited)
LIBRARY_SEARCH_PATHS 加上 $(inherited)
OTHER_LDFLAGS 加上 $(inherited)


Pod install 后的 Pods/shuiyun_ios/shuiyun_ios/Assets/ 下的 GDTActionSDK.framework 是供 真机调试，正式发布打包用的，模拟器运行请使用github 上shuiyun_ios/Assets/GDTActionSDK-simulator.framework，自行更名覆盖，注意备份原来的




#import "SYSdkUtils.h"
#import "BUAdManager.h"

#初始化:

[SYSdkUtils initUMMobSdk:@"<you_um_key>" channel:@"<you_um_channel>"];
[SYSdkUtils initMonitor:@"<you_gameid>"];
[SYSdkUtils initGDTActionSdk:@"<you_gdt_setId>" secretkey:@"<you_gdt_secretKey>"];
[SYSdkUtils initBUAdSdk:@"<you_tt_appid>" bannerKey:@"<you_banner_id>" videoKey:@"<you_video_id>"];

#在 applicationDidBecomeActive 里调用:

[SYSdkUtils doGDTSDKActionStartApp];

#展示视频广告

先在文件的头部:

extern BUAdManager* BuadMgr;

然后：

[BuadMgr showRewardVideoAd:^(NSString *data) {
    # 成功看完视频
    # do something...
} failure:^(NSString *data) {
    # 播放失败 或 没有看完视频
    # do something...
}];

# 显示banner广告

[BuadMgr showBannerAd];

# 隐藏banner广告

[BuadMgr hideBannerAd];
```

## Author

913108060@qq.com

## License

shuiyun_ios is available under the MIT license. See the LICENSE file for more info.
