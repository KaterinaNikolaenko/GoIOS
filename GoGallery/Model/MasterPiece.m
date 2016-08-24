//
//  MasterPiece.m
//  GoGallery
//
//  Created by Katerina on 24.08.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "MasterPiece.h"

@implementation MasterPiece

- (instancetype) initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self.ID = data[@"_id"];
//        self.title = data[@"title"];
//        self.author = data[@"author"];
//        self.imgPict = data[@"imgPicture"];
    }
    return self;
}



@end
