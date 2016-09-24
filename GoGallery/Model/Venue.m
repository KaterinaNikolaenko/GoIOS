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
        self.address = data[@"address"];
        self.phone = data[@"phone"];
        NSURL *urlLink = [NSURL URLWithString:data[@"link"]];
        self.link = urlLink;
       // NSURL *urlFacebook = [NSURL URLWithString:data[@"facebook"]];
        self.facebook = data[@"facebook"];
        self.galleryDescription = data[@"galleryDescription"];
    }
    return self;
}

@end
