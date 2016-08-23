//
//  Exhibition.m
//  Gallery
//
//  Created by Katerina on 23.08.16.
//  Copyright © 2016 Katerina. All rights reserved.
//

#import "Exhibition.h"

@implementation Exhibition
- (NSString *)description
{
    return [NSString stringWithFormat:@"authorName: %@, authorDescription: %@", self.authorName, self.authorDescription];
}

- (instancetype) initWithDictionary:(NSDictionary *)data {
   // self = [super initWithDictionary:data];
    self = [super init];
    if (self) {
        self.authorName = data[@"id"];
        self.authorName = data[@"authorName"];
        self.authorDescription = data[@"authorDescription"];
        self.authorDescription = data[@"_p_gallery"];
    }
    return self;
}

@end
