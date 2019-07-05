//
//  TRMovie.h
//  MovieDBObjC
//
//  Created by Timothy Rosenvall on 7/5/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRMovie : NSObject

// Properties
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *overview;

// Initializer
-(instancetype)initWithTitle:(NSString *)title rating:(NSString *)rating overview:(NSString *)overview;

@end

@interface TRMovie (JSONConvertable)

// Initializer with JSON Dictionary
-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end
