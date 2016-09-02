//
//  MasterPiece.h
//  GoGallery
//
//  Created by Katerina on 24.08.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MasterPiece : NSObject
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSURL *imgPict;

//- (instancetype) initWithDictionary:(NSDictionary *)data NS_DESIGNATED_INITIALIZER NS_DESIGNATED_INITIALIZER;
- (instancetype) initWithDictionary:(NSDictionary *)data;
@end
