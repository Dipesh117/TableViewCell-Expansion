//
//  MenuOptionsTableViewCell.m
//  Assignment
//
//  Created by Mac Mini on 24/01/21.
//

#import "MenuOptionsTableViewCell.h"

@implementation MenuOptionsTableViewCell

@synthesize delegate;

# pragma mark - Setup Cell Layout
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.textColor = UIColor.blackColor;
    self.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:18.0];
    self.moreOptionImageView.hidden = YES;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapAction)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    self.contentView.userInteractionEnabled = YES;
    [self.contentView addGestureRecognizer: tapRecognizer];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

# pragma mark - Setup Cell Data
- (void)setupCellData:(NSString *)title {
    self.titleLabel.text = title;
}

# pragma mark - Tap Action
- (void)handleTapAction {
    [[self delegate] tapOnContentView: self.contentView.tag];
}

@end
