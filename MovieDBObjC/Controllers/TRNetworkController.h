//
//  TRNetworkController.h
//  MovieDBObjC
//
//  Created by Timothy Rosenvall on 7/5/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import <Foundation/Foundation.h>

// BaseURL = https://api.themoviedb.org/3/search/movie
static NSString * const baseURLString = @"https://api.themoviedb.org/3/search/movie";
// APIKeyKey = api_key
static NSString * const APIKeyKeyString = @"api_key";
// APIKeyValue = fa9ce6a782cd416cbafdd5025fe42d0e
static NSString * const APIKeyValueString = @"fa9ce6a782cd416cbafdd5025fe42d0e";
// SearchQueryKey = query
static NSString * const SearchQueryKeyString = @"query";
// SearchQueryValue = <SearchTerm>

@interface TRNetworkController : NSObject

+(void)fetchMovie:(void(^) (NSDictionary *movieDictionary))completion;

@end
