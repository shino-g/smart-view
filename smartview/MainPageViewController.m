#import "MainPageViewController.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.delegate      = self;
    self.dataSource    = self;    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if ([self.MainPageViewDelegate respondsToSelector:@selector(prevPage)] )
    {
        return [self.MainPageViewDelegate prevPage];
    }
    return nil;
}


- (UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if ([self.MainPageViewDelegate respondsToSelector:@selector(nextPage)] )
    {
        return [self.MainPageViewDelegate nextPage];
    }
    return nil;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if ( completed )
    {
        if ([self.MainPageViewDelegate respondsToSelector:@selector(compleatePage)] )
        {
            [self.MainPageViewDelegate compleatePage];
        }
    }
}


@end
