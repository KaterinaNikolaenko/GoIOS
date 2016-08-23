//
//  Gallery.h
//  Gallery
//
//  Created by Katerina on 22.08.16.
//  Copyright © 2016 Katerina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gallery : NSObject
@property(nonatomic,strong)NSString *_id;
@property(nonatomic,strong)NSString *_created_at;
@property(nonatomic,strong)NSString *_updated_at;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *galleryDescription;
@property(nonatomic,strong)NSString *email;
@property(nonatomic,strong)NSString *facebook;
@property(nonatomic,strong)NSString *city;
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *galleryLogo;
@property(nonatomic,strong)NSString *link;
@property(nonatomic,strong)NSString *phone;
@property(nonatomic,strong)NSString *latitude;
@property(nonatomic,strong)NSString *longitude;

@property(nonatomic,strong)NSArray *schedules;

- (instancetype) initWithDictionary:(NSDictionary *)data;

@end
