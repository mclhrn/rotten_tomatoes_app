//
//  DetailViewController.h
//  rt-v.03
//
//  Created by Michael Hearne on 17/04/2013.
//  Copyright (c) 2013 Me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@interface DetailViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, retain) Movie *currentMovie;

@property (weak, nonatomic) IBOutlet UIScrollView *movieDetailScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *moviePosterImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieCriticsRatingLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieCriticsScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieSynopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *classificationLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieRuntimeLabel;

@property (strong, nonatomic) IBOutlet UIButton *easyTweetButton;
- (IBAction)sendEasyTweet:(id)sender;
- (void)canTweetStatus;

@end
