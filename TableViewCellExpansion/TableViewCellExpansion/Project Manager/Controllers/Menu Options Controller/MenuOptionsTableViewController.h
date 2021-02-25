//
//  MenuOptionsTableViewController.h
//  Assignment
//
//  Created by Mac Mini on 24/01/21.
//

#import <UIKit/UIKit.h>
#import "EmptyViewController.h"
#import "MenuOptionsTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MenuOptionsTableViewController : UITableViewController <MenuOptionsTableViewCellDelegate>

#pragma mark - Declarations
@property (nonatomic, retain) NSArray *sectionTitlesArray;
@property (nonatomic, retain) NSArray *moreOptionsArray;
@property (nonatomic) BOOL isSectionExpanded;

@end

NS_ASSUME_NONNULL_END
