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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadJSON];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadJSON {
    NSURL *url =[[NSBundle mainBundle] URLForResource:@"galleries" withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error = nil;
    NSDictionary *galleries = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
   // NSLog(@"Loaded galleries %@", galleries);
   //test
   // NSLog(@"Parsed galleries: %@", [self parseGalleriesDictionary:galleries]);
    [self parseGalleriesDictionary:galleries];
}


- (NSArray<Gallery *> *) parseGalleriesDictionary:(NSDictionary *)galleries {
    
    NSMutableArray *parsedGalleries = [[NSMutableArray alloc] initWithCapacity:[[galleries objectForKey:@"galleries"] count]];
    
    for (NSDictionary *galleryDictionary in [galleries objectForKey:@"galleries"]) {
        
        Gallery *gallery = [[Gallery alloc] init];
        gallery._id= galleryDictionary[@"_id"];
        gallery._created_at= galleryDictionary[@"_created_at"];
        gallery._updated_at= galleryDictionary[@"_updated_at"];
        gallery.name= galleryDictionary[@"name"];
        gallery.galleryDescription= galleryDictionary[@"galleryDescription"];
        gallery.email= galleryDictionary[@"email"];
        gallery.facebook= galleryDictionary[@"facebook"];
        gallery.city= galleryDictionary[@"city"];
        gallery.address= galleryDictionary[@"address"];
        gallery.galleryLogo= galleryDictionary[@"galleryLogo"];
        gallery.link= galleryDictionary[@"link"];
        gallery.phone= galleryDictionary[@"phone"];
        gallery.latitude= galleryDictionary[@"latitude"];
        gallery.longitude= galleryDictionary[@"longitude"];
        
        NSMutableArray *schedules = [[NSMutableArray alloc] initWithCapacity:[galleryDictionary[@"schedule"] count]];
        for (NSDictionary *scheduleDic in galleryDictionary[@"schedule"]) {
            Schedule *ex = [[Schedule alloc] init];
           // ex.title = scheduleDic[@"title"];
            NSString* sched = [NSString stringWithFormat:@"%@00",scheduleDic];
            ex.title = sched;
            [schedules addObject:ex];
        }
        gallery.schedules = [NSArray arrayWithArray:schedules];
        NSLog(@"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        NSLog(@"New gallery: %@", gallery);
        
        [parsedGalleries addObject:gallery];
    }
   
    return [NSArray arrayWithArray:parsedGalleries];
}


@end
