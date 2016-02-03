#import <UIKit/UIKit.h>

@protocol MainPageViewDelegate<NSObject>

- (UIViewController *)prevPage;
- (UIViewController *)nextPage;
- (void)goPage:(int)i;
- (void)compleatePage;
@end

@interface MainPageViewController : UIPageViewController<UIPageViewControllerDataSource,UIPageViewControllerDelegate,UIGestureRecognizerDelegate>

@property (weak, readwrite) id<MainPageViewDelegate> MainPageViewDelegate;

@end
