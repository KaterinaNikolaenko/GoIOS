//
//  DataLoader.m
//  GoGallery
//
//  Created by Kirill Kirikov on 8/19/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "DataLoader.h"
#import "Exhibition.h"
#import "Gallery.h"
#import "MasterPiece.h"

@implementation DataLoader

- (void) loadEventsWithCallback:(void (^)(NSArray <Event *> *, NSError *error))callback {
    
    NSError *error = nil;
    NSArray *rawGalleries = [self loadJSON:@"galleries" withError:&error];
    NSArray *rawExhibitions = [self loadJSON:@"exhibitions" withError:&error];
    NSArray *rawWorks = [self loadJSON:@"works" withError:&error];
    
    if (error) {
        return callback(nil, error);
    }
    
    //Works
    NSMutableDictionary <NSString *, MasterPiece *> *works = [[NSMutableDictionary alloc] initWithCapacity:rawWorks.count];
    
    for (NSDictionary *dic in rawWorks) {
        MasterPiece *work = [[MasterPiece alloc] initWithDictionary:dic];
        works[work.ID] = work;
    }
    //
    
    NSMutableDictionary <NSString *, Gallery *> *galleries = [[NSMutableDictionary alloc] initWithCapacity:rawGalleries.count];
    
    for (NSDictionary *dic in rawGalleries) {
        Gallery *gal = [[Gallery alloc] initWithDictionary:dic];
        galleries[gal.ID] = gal;
    }
    
    NSMutableArray *exhibitions = [NSMutableArray arrayWithCapacity:rawExhibitions.count];
    for (NSDictionary *dic in rawExhibitions) {
        Exhibition *ex = [[Exhibition alloc] initWithDictionary:dic];
        NSString *galleryId = [dic[@"_p_gallery"] componentsSeparatedByString:@"$"].lastObject;
        ex.venue = galleries[galleryId];
        NSMutableArray *worksIdArray = [NSMutableArray new];
        for (NSDictionary *dic1 in dic[@"works"]) {
            NSString *workId = dic1[@"objectId"];
            [worksIdArray addObject:works[workId]];
        }
        ex.masterPieces = worksIdArray;
        [exhibitions addObject:ex];
    }
    
    callback(exhibitions, nil);
}

- (NSArray *) loadJSON:(NSString *)json withError:(NSError **)error {
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:json ofType:@"json"]];
    NSArray *raw = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
    return raw;
}

@end
