#import <UIKit/UIKit.h>

@protocol MainPageViewDelegate<NSObject>

- (UIViewController *)prevPage;
- (UIViewController *)nextPage;
- (void)goPage:(int)i;
- (void)compleatePage;
@end

@interface MainPageViewController : UIPageViewController<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (weak, readwrite) id<MainPageViewDelegate> MainPageViewDelegate;

@end
