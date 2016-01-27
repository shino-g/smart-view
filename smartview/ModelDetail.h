#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ModelDetail : NSObject



@property (nonatomic, nonnull) NSString *detailTtitle;
@property (nonatomic, nonnull) NSString *detailDescription;
@property (nonatomic, nonnull) NSDate   *detailCreateDatetime;
@property (nonatomic, nonnull) UIImage  *detailImage;

@end