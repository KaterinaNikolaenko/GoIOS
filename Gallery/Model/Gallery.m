//
//  Gallery.m
//  Gallery
//
//  Created by Katerina on 22.08.16.
//  Copyright © 2016 Katerina. All rights reserved.
//

#import "Gallery.h"

@implementation Gallery

- (NSString *)description
{
    return [NSString stringWithFormat:@"_id: %@, _created_at: %@, _updated_at: %@, name: %@,  galleryDescription: %@, email: %@, facebook: %@, city: %@, address: %@, galleryLogo: %@, link: %@, phone: %@, latitude: %@, longitude: %@", self._id, self._created_at, self._updated_at, self.name, self.galleryDescription, self.email, self.facebook, self.city, self.address, self.galleryLogo, self.link, self.phone, self.latitude, self.longitude];
  //  return [NSString stringWithFormat:@"name: %@", self.name];
    
}
@end
