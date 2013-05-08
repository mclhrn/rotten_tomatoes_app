//
//  NowShowingViewController.m
//  rt-v.03
//
//  Created by Michael Hearne on 17/04/2013.
//  Copyright (c) 2013 Me. All rights reserved.
//

#import "BoxOfficeViewController.h"
#import "AppDelegate.h"
#import "DetailViewController.h"
#import "Movie.h"

@interface BoxOfficeViewController ()

@end

@implementation BoxOfficeViewController

@synthesize movieObjectsArray, thisMovie;
@synthesize tableView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [ApplicationDelegate.networkEngine getBoxOfficeMovieList:^(NSArray *responseArray) {
        DLog(@"response: %@", responseArray);
        movieObjectsArray = responseArray;
        [tableView reloadData];
        
    }
    onError:^(NSError* error) {
        DLog(@"%@\t%@\t%@\t%@", [error localizedDescription],
             [error localizedFailureReason],
             [error localizedRecoveryOptions],
             [error localizedRecoverySuggestion]);
        
    }];

}

- (void)viewDidUnload
{
    tableView = nil;
    [self setTableView:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [movieObjectsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"mainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    thisMovie = (Movie*)[movieObjectsArray objectAtIndex:indexPath.row];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1001];
    UILabel *labelView = (UILabel *)[cell viewWithTag:1002];
    UILabel *yearView = (UILabel *)[cell viewWithTag:1003];
    UILabel *colourCode = (UILabel *)[cell viewWithTag:999];
    UILabel *chartNumber = (UILabel *)[cell viewWithTag:998];
    
    chartNumber.text = [NSString stringWithFormat:@"%d",indexPath.row+1];
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    labelView.text = thisMovie.title;
    yearView.text = thisMovie.critics_rating;
    
    if ([thisMovie.critics_rating caseInsensitiveCompare:@"Rotten"]) {
        colourCode.backgroundColor = [UIColor colorWithRed:252/256.0 green:0/256.0 blue:2/256.0 alpha:1.0];
    }
    else
        colourCode.backgroundColor = [UIColor colorWithRed:58/256.0 green:129/256.0 blue:27/256.0 alpha:1.0];
    
    NSURL *thisMoviePosterURL = thisMovie.moviePosterURL;
    [ApplicationDelegate.networkEngine imageAtURL:thisMoviePosterURL onCompletion:^(UIImage *fetchedImage, NSURL *fetchedURL, BOOL isInCache) {
        if(thisMoviePosterURL == fetchedURL)
        {
            imageView.image = fetchedImage;
        }
        
    }];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
    thisMovie = (Movie*)[movieObjectsArray objectAtIndex:indexPath.row];
    
    if([segue.identifier isEqualToString:@"toDetail"])
    {
        DetailViewController * detailViewController = [segue destinationViewController];
        detailViewController.currentMovie = thisMovie;
    }
    
}

#pragma mark - Table view delegate

@end
