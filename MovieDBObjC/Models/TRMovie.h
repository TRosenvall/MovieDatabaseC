//
//  TRMovie.h
//  MovieDBObjC
//
//  Created by Timothy Rosenvall on 7/5/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRMovie : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *summary;

-(instancetype)initWithTitle:(NSString *)title rating:(NSString *)rating summary:(NSString *)summary;

@end
