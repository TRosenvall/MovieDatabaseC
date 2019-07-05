//
//  TRMovie.m
//  MovieDBObjC
//
//  Created by Timothy Rosenvall on 7/5/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import "TRMovie.h"

// Coding Keys
static NSString * const titleKey = @"title";
static NSString * const ratingKey = @"vote_average";
static NSString * const overviewKey = @"overview";

@implementation TRMovie

// Initialize a movie with a title, rating, and overview.
- (instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating overview:(NSString *)overview
{
    self = [super init];
    if (self)
    {
        _title = title;
        _rating = rating;
        _overview = overview;
    }
    return self;
}

@end

@implementation TRMovie (JSONConvertable)

// Initialize a movie with a dictionary.
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    // Pulling the properties of each movie from the passed in dictionary
    NSString *title = dictionary[titleKey];
    NSNumber *rating = dictionary[ratingKey];
    NSString *overview = dictionary[overviewKey];
    // Return a movie.
    return [self initWithTitle:title rating:rating overview:overview];
}

@end
