//
//  MenuOptionsTableViewCell.h
//  Assignment
//
//  Created by Mac Mini on 24/01/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MenuOptionsTableViewCellDelegate <NSObject>
@optional
- (void)tapOnContentView:(NSInteger)index;
@end

@interface MenuOptionsTableViewCell : UITableViewCell

# pragma mark - Outlets
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *moreOptionImageView;

# pragma mark - Declarations
@property (nonatomic, weak) id <MenuOptionsTableViewCellDelegate> delegate;

# pragma mark - Setup Cell Data
- (void)setupCellData:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
