//
//  NewItemTableViewCell.h
//  ToDoList
//
//  Created by Katerina on 17.08.16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewItemTableViewCell;
@protocol NewItemTableViewCellDelegate <NSObject>

- (void)buttonTappedOnCell:(NewItemTableViewCell *)cell;
- (void)updatedToDoItem:(NSString *)cellItem fromCell:(id)sender;

@end

@interface NewItemTableViewCell : UITableViewCell <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel1;
@property (weak, nonatomic) IBOutlet UITextField *textField1;

@property (weak, nonatomic) IBOutlet UITextField *textField2;


@property (weak, nonatomic) IBOutlet UIButton *myButton;
@property(weak, nonatomic) id<NewItemTableViewCellDelegate> delegate;
@end
