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
        self.title = data[@"title"];
        self.author = data[@"author"];
        NSString *filename = data[@"imgPicture"];
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        self.imgPict = url;
    }
    return self;
}



@end
