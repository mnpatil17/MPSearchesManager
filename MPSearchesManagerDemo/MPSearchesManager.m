/*** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
 *
 * @file MPSearchesManager.m
 * @author Mihir Patil
 *
 * Created by Mihir Patil on 2/1/14.
 * Copyright (c) 2014 Mihir Patil. All rights reserved.
 *
 * This document has been licensed by its creator and owner,
 * Mihir Patil, for use by the Associated Students of the
 * University of California, in the creation of products or
 * services that help students, staff and/or faculty at the
 * University of California, Berkeley. This license can be
 * revoked at any time by the creator, Mihir Patil, without
 * notice or reason.
 *
 *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***/

#import "MPSearchesManager.h"

@implementation MPSearchesManager

# pragma mark - CONSTUCTORS

/**
 *  This method initializes a new MPSearchesManager object that has control over a UITableView.
 *
 *  @param (UITableView *)tBV - the UITableView that should display the relevant recent searches
 *  @param (NSMutableArray *)allValues - the array that is responsible for the population of the UITableView
 *  @param (NSString *)kPath - the keyPath to sort the objects in the tableview by. Keypaths should be instance variables
 *                             of the objects that the tableview contains
 *  @return a new MPSearchesManager object
 */
- (id)initWithTableView:(UITableView *)tBV andAllValuesArray:(NSMutableArray *)allValues andKeyPath:(NSString *)kPath {
    self = [super init];
    if (self) {
        self.tableView = tBV;
        self.allValuesArray = [[NSArray alloc] initWithArray:allValues];
        self.displayedValuesArray = allValues;
        self.keyPath = kPath;
    }
    return self;
}


# pragma mark - PUBLIC METHODS

/**
 *  This method filters the recent searches to show only those that match the particular predicate 
 *  given
 *
 *  @param (NSString *)filterString - the predicate given to filter for; only words starting with this
 *                                    string will be displayed
 */
- (void)filterResultsUsingString:(NSString *)filterString {
    
    /* Don't change display if the search has length 0 */
    if ([filterString length] == 0) {
        [self.displayedValuesArray removeAllObjects];
        [self.displayedValuesArray addObjectsFromArray:self.allValuesArray];
    }
    
    /* Filter based on the search if it doesn't */
    else {
        
        NSPredicate *filterPredicate;
        if (![self.keyPath isEqualToString:@""]) {
           filterPredicate = [NSPredicate predicateWithFormat:@"SELF.%@ CONTAINS[cd] %@", self.keyPath, filterString];
        } else {
           filterPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", filterString];
        }
        
        NSArray *filteredResults = [self.allValuesArray filteredArrayUsingPredicate:filterPredicate];
        
        [self.displayedValuesArray removeAllObjects];
        [self.displayedValuesArray addObjectsFromArray:filteredResults];
    }
    
    if (self.tableView != nil) {
        [self.tableView reloadData];
    }
}

@end
