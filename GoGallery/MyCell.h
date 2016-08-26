//
//  MyCell.h
//  GoGallery
//
//  Created by Katerina on 26.08.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageCell;
@property (weak, nonatomic) IBOutlet UILabel *nameGallery;
@property (weak, nonatomic) IBOutlet UILabel *nameExhibition;
@property (weak, nonatomic) IBOutlet UILabel *nameAuthor;

@end
