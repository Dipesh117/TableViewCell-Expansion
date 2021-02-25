//
//  MenuOptionsTableViewController.m
//  Assignment
//
//  Created by Mac Mini on 24/01/21.
//

#import "MenuOptionsTableViewController.h"

@interface MenuOptionsTableViewController ()

@end

@implementation MenuOptionsTableViewController

@synthesize sectionTitlesArray, moreOptionsArray, isSectionExpanded;

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    isSectionExpanded = false;
    sectionTitlesArray = [NSArray arrayWithObjects: optionMenu, optionPromos, optionSports, optionEvents, optionRestauratnt, optionContactUs, optionFAQ, optionMore, nil];
    moreOptionsArray = [NSArray arrayWithObjects: @"Our Story", @"Nutrition & Allergen Guide", @"Terms & Conditions", @"Privacy Policy", nil];
    
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"MenuOptionsTableViewCell" bundle: nil] forCellReuseIdentifier:@"MenuOptionsTableViewCell"];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionTitlesArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == (sectionTitlesArray.count - 1)) {
        return (self.isSectionExpanded ? self.moreOptionsArray.count : 0);
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    MenuOptionsTableViewCell *cell = (MenuOptionsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MenuOptionsTableViewCell"];
    [cell setupCellData: [self.sectionTitlesArray objectAtIndex: section]];
    cell.moreOptionImageView.hidden = !(section == (sectionTitlesArray.count - 1));
    cell.moreOptionImageView.image = (self.isSectionExpanded ? [UIImage imageNamed: @"ic_less"] : [UIImage imageNamed: @"ic_more"]);
    cell.contentView.tag = section;
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 65.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [moreOptionsArray objectAtIndex: indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir-Book" size: 16.0];
    return cell;
}

#pragma mark - Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == (self.sectionTitlesArray.count - 1)) {
        [self openEmptyViewController: [self.moreOptionsArray objectAtIndex: indexPath.row]];
    }
}

# pragma mark - Menu Options Table View Cell Delegate
- (void)tapOnContentView:(NSInteger)index {
    if (index == (self.sectionTitlesArray.count - 1)) {
        self.isSectionExpanded = !self.isSectionExpanded;
        [self.tableView reloadData];
    }
    else {
        [self openEmptyViewController: [self.sectionTitlesArray objectAtIndex: index]];
    }
}

# pragma mark - Open Empty Controller
- (void)openEmptyViewController:(NSString *)title {
    EmptyViewController *emptyViewController = [[EmptyViewController alloc] init];
    emptyViewController.nameString = title;
    [[self navigationController] pushViewController: emptyViewController animated: YES];
}

@end
