//
//  DetailViewController.m
//  rt-v.03
//
//  Created by Michael Hearne on 17/04/2013.
//  Copyright (c) 2013 Me. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize currentMovie, movieDetailScrollView, moviePosterImageView, movieTitleLabel, movieCriticsRatingLabel, movieCriticsScoreLabel, movieSynopsisLabel, movieRuntimeLabel, classificationLabel;

- (id)initWithNibNameAndMovie:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withMovie:(Movie*)aMovie
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        currentMovie = aMovie;
    }
    return self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [ApplicationDelegate.networkEngine imageAtURL:currentMovie.moviePosterDetailedURL onCompletion:^(UIImage *fetchedImage, NSURL *fetchedURL, BOOL isInCache) {
        
        if(currentMovie.moviePosterDetailedURL == fetchedURL)
            moviePosterImageView.image = fetchedImage;
    }];
    
    // movie synopsis label
    movieSynopsisLabel.text = currentMovie.synopsis;

    //Calculate the expected size based on the font and linebreak mode of label
    CGSize maximumLabelSize = CGSizeMake(280,9999);
    CGSize expectedLabelSize = [movieSynopsisLabel.text sizeWithFont:movieSynopsisLabel.font
                                                    constrainedToSize:maximumLabelSize
                                                        lineBreakMode:movieSynopsisLabel.lineBreakMode];
    //adjust the label the the new height.
    CGRect newFrame = movieSynopsisLabel.frame;
    newFrame.size.height = expectedLabelSize.height;
    movieSynopsisLabel.frame = newFrame;
    
    // title label
    movieTitleLabel.text = [NSString stringWithFormat:@"    %@", currentMovie.title];
    
    //Calculate the expected size based on the font and linebreak mode of label
    CGSize maximumTitleLabelSize = CGSizeMake(280,9999);
    CGSize expectedTitleLabelSize = [movieTitleLabel.text sizeWithFont:movieTitleLabel.font
                                                   constrainedToSize:maximumTitleLabelSize
                                                       lineBreakMode:movieTitleLabel.lineBreakMode];
    //adjust the label the the new height.
    CGRect newTitleFrame = movieTitleLabel.frame;
    newTitleFrame.size.height = expectedTitleLabelSize.height;
    movieTitleLabel.frame = newTitleFrame;
    
    movieCriticsRatingLabel.text = [NSString stringWithFormat:@"    %@", currentMovie.critics_rating];
    movieCriticsScoreLabel.text = [NSString stringWithFormat:@"%@%%",currentMovie.critics_score];
    classificationLabel.text = [NSString stringWithFormat:@"%@",currentMovie.mpaa_rating];
    movieRuntimeLabel.text = [NSString stringWithFormat:@"%@ mins",currentMovie.runtime];
    
    UILabel *colourCodeTop = (UILabel *)[self.view viewWithTag:998];
    UILabel *colourCodeBottom = (UILabel *)[self.view viewWithTag:999];
    
    if ([currentMovie.critics_rating caseInsensitiveCompare:@"Rotten"]) {
        colourCodeTop.backgroundColor = [UIColor colorWithRed:252/256.0 green:0/256.0 blue:2/256.0 alpha:1.0];
        colourCodeBottom.backgroundColor = [UIColor colorWithRed:252/256.0 green:0/256.0 blue:2/256.0 alpha:1.0];
    }
    else {
        colourCodeTop.backgroundColor = [UIColor colorWithRed:58/256.0 green:129/256.0 blue:27/256.0 alpha:1.0];
        colourCodeBottom.backgroundColor = [UIColor colorWithRed:58/256.0 green:129/256.0 blue:27/256.0 alpha:1.0];
    }
}

- (void)viewDidAppear:(BOOL)animated

{
    [super viewDidAppear:animated];
}

- (void)viewDidUnload
{
    [self setMovieDetailScrollView:nil];
    [self setCurrentMovie:nil];
    [self setMovieTitleLabel:nil];
    [self setMovieRuntimeLabel:nil];
    [self setMovieCriticsRatingLabel:nil];
    [self setMovieCriticsScoreLabel:nil];
    [self setMoviePosterImageView:nil];
    [self setMovieSynopsisLabel:nil];
    [self setClassificationLabel:nil];
    self.easyTweetButton = nil;
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark TwitterMethods

- (IBAction)socialButton:(id)sender
{
    NSString *message = [[NSString alloc] initWithFormat:@"Check out this movie, %@", currentMovie.fullMoviePageURL];
    NSArray *postMsg = @[message];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]
                                            initWithActivityItems:postMsg
                                            applicationActivities:nil];
    
    [self presentViewController:activityVC animated:YES completion:nil];
}

@end
