//
//  Exhibition.h
//  Gallery
//
//  Created by Katerina on 23.08.16.
//  Copyright © 2016 Katerina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gallery.h"

@interface Exhibition : NSObject
@property (nonatomic, strong) NSString *_id;
@property (nonatomic, strong) NSString *authorName;
@property (nonatomic, strong) NSString *authorDescription;
@property (nonatomic, strong) NSString *_p_gallery;
@property (nonatomic, strong) Gallery *gal;

- (instancetype) initWithDictionary:(NSDictionary *)data;

@end
