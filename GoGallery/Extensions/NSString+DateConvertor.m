//
//  NSString+DateConvertor.m
//  GoGallery
//
//  Created by Kirill Kirikov on 8/22/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "NSString+DateConvertor.h"

@implementation NSString (DateConvertor)

- (NSDate *) date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    formatter.dateFormat = @"yyyy-MM-dd'T'hh:mm:ss'Z'";
    return [formatter dateFromString:self];
}

@end
