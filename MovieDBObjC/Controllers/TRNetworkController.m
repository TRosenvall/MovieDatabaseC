//
//  TRNetworkController.m
//  MovieDBObjC
//
//  Created by Timothy Rosenvall on 7/5/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import "TRNetworkController.h"
#import "TRMovie.h"

// BaseURL = https://api.themoviedb.org/3/search/movie
static NSString * const baseURLString = @"https://api.themoviedb.org/3/search/movie";
// APIKeyKey = api_key
static NSString * const APIKeyKeyString = @"api_key";
// APIKeyValue = fa9ce6a782cd416cbafdd5025fe42d0e
static NSString * const APIKeyValueString = @"fa9ce6a782cd416cbafdd5025fe42d0e";
// SearchQueryKey = query
static NSString * const SearchQueryKeyString = @"query";
// SearchQueryValue = <SearchTerm>

@implementation TRNetworkController

+(void)fetchMovies:(NSString *)searchTermString completion:(void (^)(NSArray *))completion
{
    // Movies Array to be returned in the completion at the end.
    NSMutableArray *moviesArray = [NSMutableArray new];
    // BaseURL
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    // Components for URL
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    // Query items
    NSURLQueryItem *apiKey = [[NSURLQueryItem alloc] initWithName:APIKeyKeyString value:APIKeyValueString];
    NSURLQueryItem *searchTerm = [[NSURLQueryItem alloc] initWithName:SearchQueryKeyString value:searchTermString];
    // Set the Query Items
    components.queryItems = @[apiKey, searchTerm];
    // Our final URL, checked and works for the search term "Finding Nemo"
    NSURL *finalURL = components.URL;
    
    // Our datatask set to run the api fetch request.
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // Error Handling if data fetching fails.
        if (error) {
            NSLog(@"Error fetching data, %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        // Check Server Response
        if (error) {
            NSLog(@"Server Response, %@", response);
        }
        
        // Fetch Top Level Dictionary
        if (data) {
            // Decoding JSON file
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            // Error Handling if JSON decoding fails.
            if (!topLevelDictionary) {
                NSLog(@"Error fetching Top Level Dictionary, %@", error.localizedDescription);
                completion(nil);
                return;
            } else {
                // Pull the results array out of the Top Level Dictionary
                NSArray *results = topLevelDictionary[@"results"];
                // Pull out each movie from the results array.
                for (NSDictionary *movieDictionary in results) {
                    // Instantiate a new movie object.
                    TRMovie *movie = [[TRMovie alloc] initWithDictionary:movieDictionary];
                    // Append the movie to the array we will return in the completion handler.
                    [moviesArray addObject:movie];
                }
                // End the api request retrieval.
                completion(moviesArray);
                return;
            }
        }
    // Don't forget to resume the datatask!
    }]resume];
}

@end
