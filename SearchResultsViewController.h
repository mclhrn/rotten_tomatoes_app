//
//  SearchResultsViewController.h
//  rt-v.03
//
//  Created by Michael Hearne on 23/04/2013.
//  Copyright (c) 2013 Me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "AppDelegate.h"

extern NSString *gSearchQuery;

@interface SearchResultsViewController : UITableViewController
{
    NSArray *movieObjectsArray;
}
@property (strong, nonatomic) NSString *searchValue;
@property (strong, nonatomic) NSString *searchQueryString;
@property (nonatomic, retain) Movie *thisMovie;
@property (nonatomic, retain) NSArray *movieObjectsArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
