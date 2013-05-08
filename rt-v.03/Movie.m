//
//  Movie.m
//  rt-v.03
//
//  Created by Michael Hearne on 17/04/2013.
//  Copyright (c) 2013 Me. All rights reserved.
//

#import "Movie.h"

@implementation Movie{
    
}

@synthesize title, synopsis;
@synthesize moviePosterURL;
@synthesize moviePoster, moviePosterDetailedURL, moviePosterOriginalURL, fullMoviePageURL;
@synthesize cast;
@synthesize critics_rating;
@synthesize critics_score;
@synthesize runtime;
@synthesize mpaa_rating;
@synthesize audience_score;

- (id)initWithDictionary:(NSDictionary *)aDictionary {
	if ([self init]) {
		self.title = [aDictionary valueForKey:@"title"];
        self.synopsis = [aDictionary valueForKey:@"synopsis"];
		self.moviePosterURL = [NSURL URLWithString:[[aDictionary valueForKey:@"posters"] valueForKey:@"thumbnail"]];
        self.moviePosterDetailedURL = [NSURL URLWithString:[[aDictionary valueForKey:@"posters"] valueForKey:@"detailed"]];
        self.moviePosterOriginalURL = [NSURL URLWithString:[[aDictionary valueForKey:@"posters"] valueForKey:@"original"]];
        self.fullMoviePageURL = [NSURL URLWithString:[[aDictionary valueForKey:@"links"] valueForKey:@"alternate"]];

		self.cast = [aDictionary valueForKey:@"abridged_cast"];
		self.critics_score = [[aDictionary valueForKey:@"ratings"] valueForKey:@"critics_score"];
		self.critics_rating = [[aDictionary valueForKey:@"ratings"] valueForKey:@"critics_rating"];
        self.audience_score = [[aDictionary valueForKey:@"ratings"] valueForKey:@"audience_score"];
		self.runtime = [aDictionary valueForKey:@"runtime"];
        self.mpaa_rating = [aDictionary valueForKey:@"mpaa_rating"];
	}
	return self;
}

- (void)dealloc {
	title = nil;
	moviePoster = nil;
	cast = nil;
	critics_rating = nil;
	critics_score = nil;
    audience_score = nil;
	runtime = nil;
    mpaa_rating = nil;
}

@end
