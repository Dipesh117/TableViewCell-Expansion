//
//  EmptyViewController.m
//  Assignment
//
//  Created by Mac Mini on 24/01/21.
//

#import "EmptyViewController.h"

@interface EmptyViewController ()

@end

@implementation EmptyViewController

@synthesize nameString;

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)setupView {
    self.view.backgroundColor = UIColor.whiteColor;
    
    UILabel *infoLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 250.0, 250.0)];
    infoLabel.center = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0);
    infoLabel.textColor = UIColor.blackColor;
    infoLabel.font = [UIFont fontWithName:@"Avenir-Book" size:17.0];
    infoLabel.text = nameString;
    infoLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview: infoLabel];
}

@end
