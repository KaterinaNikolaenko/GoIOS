//
//  Venue.m
//  GoGallery
//
//  Created by Kirill Kirikov on 8/19/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "Venue.h"

@implementation Venue

- (instancetype) initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self.ID = data[@"_id"];
        self.name = data[@"name"];
    }
    return self;
}

@end
