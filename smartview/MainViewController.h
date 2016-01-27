#import <UIKit/UIKit.h>
#import "NavigationTableViewController.h"
#import "MainPageViewController.h"
#import "ModelList.h"

@interface MainViewController : UIViewController<NavigationDelegate, MainPageViewDelegate>


- (UIViewController *)prevPage;
- (UIViewController *)nextPage;


@end
