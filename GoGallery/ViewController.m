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
   // NSMutableArray <Exhibition *> *exhibs;
   // NSArray *person1, *person2,*person3;
   // person1 = [NSArray arrayWithObjects:@"Ivanov", @"Direct", nil];
   // person2 = [NSArray arrayWithObjects:@"Petrov", @"Marketolog", nil];
   // person3 = [NSArray arrayWithObjects:@"Sidorov", @"Finansist", nil];
    
   // _persons = [NSArray arrayWithObjects:person3,person2,person1, nil];
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

 //   return [self.store itemsCount];
    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
     MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[MyCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    //NSURL *url = [NSURL URLWithString:<#(nonnull NSString *)#>]
  
    UIImage *img = [UIImage imageNamed:@"tfss-03113753-cc88-44aa-8c56-ec9ef81a68f7-_37_X_34_cm.jpg"];

    EventsModel *evObject =[[EventsModel alloc] init];
    NSMutableArray *exArray = [NSMutableArray new];
    NSNull *myNull = [NSNull null];
    for (Exhibition *dic in evObject.events){
        if (dic.authorName == nil) {
            [exArray addObject:myNull];
        } else {
            [exArray addObject:dic.authorName];
        }
    }
    
    NSInteger index = [indexPath row];
    Event *ev = evObject.events[index];
    
    cell.nameGallery.text = ev.venue.name;
    cell.nameExhibition.text = ev.name;
    cell.nameAuthor.text = exArray[index];
    cell.imageCell.image = img;
    
    
    
    /////////////////////////////////////////////////////
    //if (!cell) {
    //    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
   // }
   //// EventsModel *evObject =[[EventsModel alloc] init];
   // NSMutableArray *exArray = [NSMutableArray new];
   // NSNull *myNull = [NSNull null];
   // for (Exhibition *dic in evObject.events){
    //    if (dic.authorName == nil) {
    //        [exArray addObject:myNull];
    //    } else {
    //        [exArray addObject:dic.authorName];
    //    }
   // }
    
   // NSInteger index = [indexPath row];
   // Event *ev = evObject.events[index];
    
   // cell.textLabel.text = exArray[index];
   // cell.detailTextLabel.text = ev.venue.name;
    
    
    return cell;
}


@end






