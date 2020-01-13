#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BUAdFullVideo : UIViewController

typedef void (^callbackResult)(NSString *data);
@property(nonatomic, copy) callbackResult callback;

- (void)loadFullVideoAd:(NSString *)name
                       :(void (^)(NSString *data))result;
@end