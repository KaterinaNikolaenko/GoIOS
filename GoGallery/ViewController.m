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
#import "MyCell.h"

@interface ViewController() <UITableViewDataSource, UITableViewDelegate>
//@property (nonatomic, strong) NSMutableArray *persons;

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
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
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

    return [[EventsModel sharedModel].events count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 344;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
     MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[MyCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
  
    [self tableView:tableView heightForRowAtIndexPath:indexPath];
    
    NSArray *eventsArray = [EventsModel sharedModel].events;
    Exhibition * exObject = eventsArray[indexPath.row];
    cell.nameGallery.text = exObject.venue.name;
    cell.nameExhibition.text = exObject.name;
    cell.nameAuthor.text = exObject.authorName;
    
    if (!(exObject.masterPieces.firstObject == nil)){
        MasterPiece *masterPiece = [exObject.masterPieces firstObject];
        NSURL *url = masterPiece.imgPict;
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        cell.imageCell.image = image;
    }
    
    return cell;
}


@end






