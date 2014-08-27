//
//  MPViewController.m
//  MPSearchesManagerDemo
//
//  Created by Mihir Patil on 8/26/14.
//  Copyright (c) 2014 Mihir Patil. All rights reserved.
//

#import "MPViewController.h"

@interface MPViewController ()

@end

@implementation MPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Sample data */
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"Idina", @"Nina", @"Grace", @"Addison", @"Ed", @"Madison", @"Tara", @"Josephine"]];
    
    self.searchesManager = [[MPSearchesManager alloc] initWithTableView:self.tableView andAllValuesArray:self.dataArray andKeyPath:@""];
    
    [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

# pragma mark - UISearchBarDelegate PROTOCOL IMPLEMENTATION

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    /* Filter the recents recent's list when search string changes */
    [self.searchesManager filterResultsUsingString:searchText];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

# pragma mark - IMPLEMENTING UITableViewDataSource & UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MPExampleCell"];
    
    if (!cell) {
        cell = [UITableViewCell new];
    }
    
    
    [cell.textLabel setText:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.searchBar resignFirstResponder];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



@end
