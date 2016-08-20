//
//  NewItemTableViewCell.m
//  ToDoList
//
//  Created by Katerina on 17.08.16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "NewItemTableViewCell.h"

@implementation NewItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)didTouchButton:(UIButton *)sender {
    [self.delegate buttonTappedOnCell:self];
}


@synthesize textLabel;
@end
