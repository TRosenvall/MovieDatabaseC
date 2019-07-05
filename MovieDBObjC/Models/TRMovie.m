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
static NSString * const ratingKey = @"rating";
static NSString * const overviewKey = @"overview";

@implementation TRMovie

// Initialize a movie with a title, rating, and overview.
- (instancetype)initWithTitle:(NSString *)title rating:(NSString *)rating overview:(NSString *)overview
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
    NSString *title = dictionary[titleKey];
    NSString *rating = dictionary[ratingKey];
    NSString *overview = dictionary[overviewKey];
    
    return [self initWithTitle:title rating:rating overview:overview];
}

@end
