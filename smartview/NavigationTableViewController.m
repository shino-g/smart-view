#import "NavigationTableViewController.h"
#import "NavigationTableViewCell.h"


static NSString* cellName = @"cell";


@implementation NavigationTableViewController

@synthesize cellList;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[NavigationTableViewCell class] forCellReuseIdentifier:cellName];
}

#pragma mark - Table view data source

//table section count
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//table cell count
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cellList.count;
}

//table cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell     = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    ModelDetail *model_detail = cellList[ indexPath.row ];
    cell.imageView.image      = [UIImage imageNamed:model_detail.detailImage];
    cell.transform            = CGAffineTransformMakeRotation( M_PI / 2);
    return cell;
}

//table cell height
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


//select cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.NavigationDelegate respondsToSelector:@selector(didSelectCell:)] )
    {
        [self.NavigationDelegate didSelectCell:(int)indexPath.row];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        if ([self.NavigationDelegate respondsToSelector:@selector(didSelectCell:)] )
        {
            [self.NavigationDelegate deleteSelectCell:(int)indexPath.row ];
        }
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}


@end
