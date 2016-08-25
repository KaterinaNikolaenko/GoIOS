//
//  ViewController.m
//  GoGallery
//
//  Created by Kirill Kirikov on 8/19/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "ViewController.h"
#import "EventsModel.h"
#import "Exhibition.h"
#import "MasterPiece.h"
#import "Gallery.h"
#import "DataLoader.h"

@interface ViewController() <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   // ToDoItem *item = [[self.store items] objectAtIndex:indexPath.row];
   // item.isDone = !item.isDone;
   // [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    
   // if (editingStyle == UITableViewCellEditingStyleDelete) {
    //    [self.store removeItemAtIndex:indexPath.row];
    //    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
   // }
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

 //   return [self.store itemsCount];
    //Exhibition *exh;
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    EventsModel *evObject =[[EventsModel alloc] init];
    //Works
  //  NSMutableDictionary <NSString *, EventsModel *> *events = [[NSMutableDictionary alloc] initWithCapacity:[evObject.events count]];
   
    for (Exhibition *dic in evObject.events) {
//        EventsModel *event = [[EventsModel alloc] initWithDictionary:dic];
       // NSLog(@"Test %@", dic.authorName);
        cell.textLabel.text = dic.authorName;
       // [events setObject:event forKey:event.ID];
    }
    
   
  //  evObj = [evObj.events objectAtIndex:indexPath.row];
  // ViewController *newItemCell = (ViewController *)cell;
    
  //newItemCell
    
    //ToDoItem *item = [[self.store items] objectAtIndex:indexPath.row];
   // NewItemTableViewCell *newItemCell = (NewItemTableViewCell *)cell;
   // newItemCell.textField1.text = item.title;
   // newItemCell.textField2.text = item.summary;
   // newItemCell.myButton.tag = indexPath.row;
   // UIImage *image;
    
   // newItemCell.delegate = self;
    
   // [newItemCell.myButton setImage:image forState:UIControlStateNormal];
    //cell
    return cell;
}


@end
