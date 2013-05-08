//
//  NetworkEngine.h
//  rt-v.03
//
//  Created by Michael Hearne on 17/04/2013.
//  Copyright (c) 2013 Me. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface NetworkEngine : MKNetworkEngine

typedef void (^BoxOfficeMoivesResponseBlock)(NSArray *movieModelsArray);

-(MKNetworkOperation*) getBoxOfficeMovieList:(BoxOfficeMoivesResponseBlock) completionBlock onError:(MKNKErrorBlock) errorBlock;

typedef void (^NowShowingMoivesResponseBlock)(NSArray *movieModelsArray);

-(MKNetworkOperation*) getNowShowingMovieList:(NowShowingMoivesResponseBlock) completionBlock onError:(MKNKErrorBlock) errorBlock;

typedef void (^SearchResultsMoivesResponseBlock)(NSArray *movieModelsArray);

-(MKNetworkOperation*) getSearchResultsMovieList:(SearchResultsMoivesResponseBlock) completionBlock onError:(MKNKErrorBlock) errorBlock;

@end
