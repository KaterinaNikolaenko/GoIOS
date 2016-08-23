//
//  ViewController.m
//  Gallery
//
//  Created by Katerina on 21.08.16.
//  Copyright © 2016 Katerina. All rights reserved.
//

#import "ViewController.h"
#import "Gallery.h"
#import "Schedule.h"
#import "Exhibition.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadModel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)loadModel {
//   NSArray *rawGalleries = [self loadJSON];
//   NSArray *rawExhibitions = [self loadJSONExhibition];
    
    NSError *error = nil;
    NSArray *rawGalleries = [self loadJSON:@"galleries" withError:&error];
    NSArray *rawExhibitions = [self loadJSON:@"exhibitions" withError:&error];
    
    NSMutableDictionary <NSString *, Gallery *> *galleries = [[NSMutableDictionary alloc] initWithCapacity:[rawGalleries count]];
    
    for (NSDictionary *dic in rawGalleries) {
        Gallery *gal = [[Gallery alloc] initWithDictionary:dic];
        [galleries setObject:gal forKey:gal._id];
    }
    
    NSMutableArray *exhibitions = [NSMutableArray arrayWithCapacity:[rawExhibitions count]];
    for (NSDictionary *dic in rawExhibitions) {
        Exhibition *ex = [[Exhibition alloc] initWithDictionary:dic];
        NSString *galleryId = [[dic[@"_p_gallery"] componentsSeparatedByString:@"$"] lastObject];
        ex.gal = galleries[galleryId];
        [exhibitions addObject:ex];
    }

}


- (NSArray *) loadJSON:(NSString *)json withError:(NSError **)error {
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:json ofType:@"json"]];
    NSArray *raw = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
    return raw;
}

//-(NSArray *)loadJSON {
//    NSURL *url =[[NSBundle mainBundle] URLForResource:@"galleries" withExtension:@"json"];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    NSError *error = nil;
//    NSDictionary *galleries = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
//    NSArray *rawGalleries = [self parseGalleriesDictionary:galleries];
//    return rawGalleries;
//}
//
//-(NSArray *)loadJSONExhibition {
//    NSURL *url =[[NSBundle mainBundle] URLForResource:@"exhibitions" withExtension:@"json"];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    NSError *error = nil;
//    NSDictionary *exhibitions = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
//    NSArray *rawExhibitions = [self parsedExhibitionsDictionary:exhibitions];
//    return rawExhibitions;
//}
//
//
//- (NSArray<Gallery *> *) parseGalleriesDictionary:(NSDictionary *)galleries {
//    
//    NSMutableArray *parsedGalleries = [[NSMutableArray alloc] initWithCapacity:[[galleries objectForKey:@"galleries"] count]];
//    
//    for (NSDictionary *galleryDictionary in [galleries objectForKey:@"galleries"]) {
//        
//        Gallery *gallery = [[Gallery alloc] init];
//        gallery._id= galleryDictionary[@"_id"];
//        gallery._created_at= galleryDictionary[@"_created_at"];
//        gallery._updated_at= galleryDictionary[@"_updated_at"];
//        gallery.name= galleryDictionary[@"name"];
//        gallery.galleryDescription= galleryDictionary[@"galleryDescription"];
//        gallery.email= galleryDictionary[@"email"];
//        gallery.facebook= galleryDictionary[@"facebook"];
//        gallery.city= galleryDictionary[@"city"];
//        gallery.address= galleryDictionary[@"address"];
//        gallery.galleryLogo= galleryDictionary[@"galleryLogo"];
//        gallery.link= galleryDictionary[@"link"];
//        gallery.phone= galleryDictionary[@"phone"];
//        gallery.latitude= galleryDictionary[@"latitude"];
//        gallery.longitude= galleryDictionary[@"longitude"];
//        
//        NSMutableArray *schedules = [[NSMutableArray alloc] initWithCapacity:[galleryDictionary[@"schedule"] count]];
//        for (NSDictionary *scheduleDic in galleryDictionary[@"schedule"]) {
//            Schedule *ex = [[Schedule alloc] init];
//           // ex.title = scheduleDic[@"title"];
//            NSString* sched = [NSString stringWithFormat:@"%@00",scheduleDic];
//            ex.title = sched;
//            [schedules addObject:ex];
//        }
//        gallery.schedules = [NSArray arrayWithArray:schedules];
//       // NSLog(@"New gallery: %@", gallery);
//        
//        [parsedGalleries addObject:gallery];
//    }
//   
//    return [NSArray arrayWithArray:parsedGalleries];
//}
//
//- (NSArray<Exhibition *> *) parsedExhibitionsDictionary:(NSDictionary *)exhibitions {
//    
//    NSMutableArray *parsedExhibitions = [[NSMutableArray alloc] initWithCapacity:[[exhibitions objectForKey:@"exhibitions"] count]];
//    
//    for (NSDictionary *exhibitionsDictionary in [exhibitions objectForKey:@"exhibitions"]) {
//        
//        Exhibition *exhibition = [[Exhibition alloc] init];
//          exhibition.authorName = exhibitionsDictionary[@"authorName"];
//          exhibition.authorDescription = exhibitionsDictionary[@"authorDescription"];
//        
//        [parsedExhibitions addObject:exhibition];
//    }
//    
//    return [NSArray arrayWithArray:parsedExhibitions];
//}

@end
