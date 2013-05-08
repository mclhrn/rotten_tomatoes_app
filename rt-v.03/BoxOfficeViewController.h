//
//  NowShowingViewController.h
//  rt-v.03
//
//  Created by Michael Hearne on 17/04/2013.
//  Copyright (c) 2013 Me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface BoxOfficeViewController : UITableViewController
{
    NSArray *movieObjectsArray;
}
@property (nonatomic, retain) Movie *thisMovie;
@property (nonatomic, retain) NSArray *movieObjectsArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
