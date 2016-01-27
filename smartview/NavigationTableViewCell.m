#import "NavigationTableViewCell.h"

@implementation NavigationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier {
    //Hardcoded to UITableViewCellStyleSubtitle
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}

@end
