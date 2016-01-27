#import "MainViewController.h"
#import "DetailViewController.h"

@implementation MainViewController
{
    NavigationTableViewController *navigationTable;
    MainPageViewController *pageViewController;
    ModelList *modelList;
    int currentPage;
    int nextPage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    currentPage = 0;
    nextPage    = 0;
    
    navigationTable = [[NavigationTableViewController alloc] init];
    navigationTable.NavigationDelegate = self;
    [self addChildViewController:navigationTable];
    
    //テーブルビューを90度回転
    navigationTable.tableView.transform  = CGAffineTransformMakeRotation( -M_PI / 2);
    navigationTable.tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    navigationTable.tableView.showsVerticalScrollIndicator = YES;
    navigationTable.tableView.indicatorStyle  = UIScrollViewIndicatorStyleWhite;
    navigationTable.tableView.scrollEnabled   = YES;
    navigationTable.tableView.backgroundColor = [UIColor whiteColor];
    navigationTable.tableView.allowsSelection = YES;
    navigationTable.view.center = CGPointMake(self.view.frame.origin.x + self.view.frame.size.height / 2, self.view.frame.origin.y + self.view.frame.size.width / 2);
    navigationTable.view.frame  = CGRectMake(0, 20, self.view.frame.size.width, 80);
    
    
    modelList             = [[ModelList alloc] init];
    navigationTable.cellList = [modelList getList];
    
    [self.view addSubview:navigationTable.view];
    
    
    pageViewController = [[MainPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [pageViewController.view setFrame:CGRectMake(0, 80 , self.view.bounds.size.width, self.view.bounds.size.height - 55 )];

    pageViewController.delegate      = pageViewController;
    pageViewController.dataSource    = pageViewController;
    pageViewController.MainPageViewDelegate = self;
    
    self.view.gestureRecognizers = pageViewController.gestureRecognizers;
    [self.view addSubview:pageViewController.view];
    
    [self compleatePage];
}

- (UIViewController *)nextPage
{
    nextPage = [modelList getNextItemPos:currentPage];
    DetailViewController *detaiView = [[DetailViewController alloc] init:[modelList getItem:nextPage]];
    return detaiView;
}

- (UIViewController *)prevPage
{
    nextPage = [modelList getPrevItemPos:currentPage];
    DetailViewController *detaiView = [[DetailViewController alloc] init:[modelList getItem:nextPage]];
    return detaiView;
}



- (void)didSelectCell:(int)i
{
    nextPage = i;
    [self compleatePage];
}

- (void)compleatePage
{

    DetailViewController *detaiView              = [[DetailViewController alloc] init:[modelList getItem:nextPage] ];
    __block int next                             = nextPage;
    __block NavigationTableViewController *table = navigationTable;
    [pageViewController setViewControllers:@[ detaiView ] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished)
     {
         NSIndexPath* indexPath = [NSIndexPath indexPathForRow:next inSection:0];
         [table.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
         [table.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:0];
         currentPage = nextPage;
     }];

}

- (void)delTap:(id)inSender
{
    return;
}

- (void)addTap:(id)inSender
{
    navigationTable.cellList = [modelList addItem];
    [navigationTable.tableView reloadData];
    return;
}

- (void)deleteSelectCell:(int)i
{
    navigationTable.cellList = [modelList delItem:i];
    [navigationTable.tableView reloadData];
    return;
}


@end
