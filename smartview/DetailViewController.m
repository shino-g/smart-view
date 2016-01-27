#import "DetailViewController.h"

@implementation DetailViewController
{
    ModelDetail *modelDetail;
}

- (instancetype)init:(ModelDetail *)model_detail
{
    if ( self )
    {
        modelDetail = model_detail;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 200)];
    descriptionLabel.text     = modelDetail.detailDescription;

    
    UIImageView *imageView    = [[UIImageView alloc] initWithImage:[UIImage imageNamed:modelDetail.detailImage]];
    imageView.center          = CGPointMake( self.view.bounds.size.width / 2 , self.view.bounds.size.height / 2);
    
    [self.view addSubview:descriptionLabel];
    [self.view addSubview:imageView];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
