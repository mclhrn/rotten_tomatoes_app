//
//  NetworkEngine.m
//  rt-v.03
//
//  Created by Michael Hearne on 17/04/2013.
//  Copyright (c) 2013 Me. All rights reserved.
//

#import "NetworkEngine.h"
#import "AppDelegate.h"
#import "Movie.h"
#import "SearchResultsViewController.h"
NSString *gSearchQuery;

@implementation NetworkEngine

//translate string to JSON with ios4 support
-(NSDictionary *) getResponseDictionary:(NSData *)response{
    //Check for ios5 or later...
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 5.0) {
        
        NSError *error;
        return [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&error];
    }
    else{
        return nil;
    }
}

-(MKNetworkOperation*) getBoxOfficeMovieList:(BoxOfficeMoivesResponseBlock)completionBlock onError:(MKNKErrorBlock)errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:ListMoviesBoxOffice
                                              params:nil
                                          httpMethod:@"GET"];
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         if([completedOperation isCachedResponse]) {

         }
         else {

         }
         NSDictionary *responseDict = [self getResponseDictionary:[completedOperation responseData]];
         NSArray *movies = [responseDict objectForKey:@"movies"];
         NSMutableArray *movieModelObjects = [[NSMutableArray alloc] init ];
         for (id movie in movies) {
             Movie *thisMovie = [[Movie alloc] initWithDictionary:movie];
             [movieModelObjects addObject:thisMovie];
         }
         NSArray *array = [NSArray arrayWithArray:movieModelObjects];
         completionBlock(array);
     }onError:^(NSError* error) {
         errorBlock(error);
     }];
    [self enqueueOperation:op];
    return op;
}

-(NSString*) cacheDirectoryName {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *cacheDirectoryName = [documentsDirectory stringByAppendingPathComponent:@"BoxOfficeMoviePosters"];
    return cacheDirectoryName;
}








-(MKNetworkOperation*) getNowShowingMovieList:(NowShowingMoivesResponseBlock)completionBlock onError:(MKNKErrorBlock)errorBlock
{
    MKNetworkOperation *op = [self operationWithPath:ListMoviesNowShowing
                                              params:nil
                                          httpMethod:@"GET"];
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         if([completedOperation isCachedResponse]) {

         }
         else {

         }
         /* process reponse here */
         NSDictionary *responseDict = [self getResponseDictionary:[completedOperation responseData]];

         NSArray *movies = [responseDict objectForKey:@"movies"];
         NSMutableArray *movieModelObjects = [[NSMutableArray alloc] init ];

         for (id movie in movies) {

             Movie *thisMovie = [[Movie alloc] initWithDictionary:movie];
             DLog(@"thisMovie.title: %@", thisMovie.title);
             DLog(@"thisMovie.moviePosterURL: %@", [thisMovie.moviePosterURL absoluteString]);
             [movieModelObjects addObject:thisMovie];
             
         }
         NSArray *array = [NSArray arrayWithArray:movieModelObjects];
         completionBlock(array);
     }onError:^(NSError* error) {
         errorBlock(error);
     }];
    [self enqueueOperation:op];
    return op;
}

-(NSString*) cacheDirectoryName2 {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *cacheDirectoryName2 = [documentsDirectory stringByAppendingPathComponent:@"NowShowingMoviePosters"];
    return cacheDirectoryName2;
}




-(MKNetworkOperation*) getSearchResultsMovieList:(NowShowingMoivesResponseBlock)completionBlock onError:(MKNKErrorBlock)errorBlock
{
    NSLog(@"Testing from Network Engine--- %@", gSearchQuery);
    MKNetworkOperation *op = [self operationWithPath:gSearchQuery
                                              params:nil
                                          httpMethod:@"GET"];
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         if([completedOperation isCachedResponse]) {

         }
         else {

         }
         /* process reponse here */
         NSDictionary *responseDict = [self getResponseDictionary:[completedOperation responseData]];

         NSArray *movies = [responseDict objectForKey:@"movies"];
         NSMutableArray *movieModelObjects = [[NSMutableArray alloc] init ];

         for (id movie in movies) {
             //DLog(@"movie: %@", movie);
             Movie *thisMovie = [[Movie alloc] initWithDictionary:movie];
             [movieModelObjects addObject:thisMovie];
             
         }
         NSArray *array = [NSArray arrayWithArray:movieModelObjects];
         completionBlock(array);
     }onError:^(NSError* error) {
         errorBlock(error);
     }];
    [self enqueueOperation:op];
    return op;
}

-(NSString*) cacheDirectoryName3 {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *cacheDirectoryName3 = [documentsDirectory stringByAppendingPathComponent:@"SearchResultsMoviePosters"];
    return cacheDirectoryName3;
}

@end

