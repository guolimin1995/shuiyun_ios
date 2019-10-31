//
//  BUAdRewardedVideo.h
//  spot_different-mobile
//
//  Created by 刘超文 on 2019/9/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BUAdRewardedVideo :UIViewController

typedef void (^callbackResult)(NSString*data);
@property (nonatomic, copy) callbackResult callback;

- (void)loadRewardedVideoAd:(NSString*)name :(void (^)(NSString *data))result;
@end

