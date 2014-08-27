MPSearchesManager
=================

Introduction
------------

The MPSearchesManager allow developers to easily implement instant search with a UITableView & UISearchBar, with an NSMutableArray as the data source.


Pertinent Files
---------------

_MPSearchesManager.h_ & _MPSearchesManager.m_ are the two files in the demo that you should import into your own Xcode Workspace. These files help you manage the searches internally.


Code Setup
----------

Add the following code in the .h or .m files that correspond to the view controller for which you would like to implement instant search.

*Interface (.h file)*

    #import "MPSearchesManager.h"

    /* Note that you can also implement UITableViewController, and not implement UITableViewDataSource & UITableViewDelegate */
    @interface YourViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

        @property (strong, nonatomic) IBOutlet UITableView *tableView;       // This is your UITableView
        @property (strong, nonatomic) IBOutlet UISearchBar *searchBar;       // This is your UISearchBar
        @property (strong, nonatomic) NSMutableArray *dataArray;             // This NSArray stores your data
        @property (strong, nonatomic) MPSearchesManager *searchesManager;    // Searches Manager 
  
    @end


*Search Bar Delegate Implementation (in your .m file)*

    # pragma mark - UISearchBarDelegate PROTOCOL IMPLEMENTATION

    - (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
     
        /* Filter the recents recent's list when search string changes */
        [self.searchesManager filterResultsUsingString:searchText];
    }

    - (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
        [searchBar resignFirstResponder];
    }
    
*viewDidLoad: method in your (.m file)*

    - (void)viewDidLoad {
        [super viewDidLoad];
    
        /* Add in your data; here we have sample data */
        self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"Idina", @"Nina", @"Grace", @"Addison", @"Ed", @"Madison", @"Tara", @"Josephine"]];
    
        /**
         * Create your searches manager. Pass in your table view and keypath to sort with. For example, if you had 
         * a Libraries object, and you wanted to sort by the "name" field, you'd have "name" be your keypath.
         */
        self.searchesManager = [[MPSearchesManager alloc] initWithTableView:self.tableView andAllValuesArray:self.dataArray andKeyPath:@""];
    
        [self.tableView reloadData];
    }
    
    
Notes
-----

  - Please DO NOT change the array your data array reference points to; if you must, please reinitialize your MPRecentSearches manager after doing so
