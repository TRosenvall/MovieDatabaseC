//
//  TRNetworkController.h
//  MovieDBObjC
//
//  Created by Timothy Rosenvall on 7/5/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRNetworkController : NSObject

// Pull a movie dictionary from a JSON api call.
+(void)fetchMovies:(NSString *)searchTermString completion:(void (^)(NSArray *))completion;

@end
