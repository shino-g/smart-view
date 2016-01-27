#import <UIKit/UIKit.h>
#import "ModelDetail.h"

@protocol NavigationDelegate<NSObject>

- (void)didSelectCell:(int)i;
- (void)deleteSelectCell:(int)i;

@end


@interface NavigationTableViewController : UITableViewController
{
    NSArray *cellList;
}


@property (nonatomic) NSArray *cellList;

@property (weak, readwrite) id<NavigationDelegate> NavigationDelegate;


@end
