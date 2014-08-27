/*** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
 *
 * @file MPSearchesManager.h
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

#import <Foundation/Foundation.h>

@interface MPSearchesManager : NSObject

# pragma mark - PROPERTIES

@property (strong, nonatomic) NSArray* allValuesArray;
@property (strong, nonatomic) NSMutableArray *displayedValuesArray;
@property (strong, nonatomic) NSString *keyPath;

@property (strong, nonatomic) UITableView* tableView;


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
- (id)initWithTableView:(UITableView *)tBV andAllValuesArray:(NSMutableArray *)allValues andKeyPath:(NSString *)kPath;


# pragma mark - PUBLIC METHODS

/**
 *  This method filters the recent searches to show only those that match the particular predicate
 *  given
 *
 *  @param (NSString *)filterString - the predicate given to filter for; only words starting with this
 *                                    string will be displayed
 */
- (void)filterResultsUsingString:(NSString *)filterString;

@end
