//
//  MPViewController.h
//  MPSearchesManagerDemo
//
//  Created by Mihir Patil on 8/26/14.
//  Copyright (c) 2014 Mihir Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPSearchesManager.h"

@interface MPViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) MPSearchesManager *searchesManager;
@property (strong, nonatomic) NSMutableArray *dataArray;


@end
