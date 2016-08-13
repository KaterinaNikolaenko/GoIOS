//
//  ToDoItemsListViewController.m
//  ToDoList
//
//  Created by Kirill Kirikov on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ToDoItemsListViewController.h"
#import "ToDoItemsStore.h"

@interface ToDoItemsListViewController() <UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *summaryTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextFIeld;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) id<ToDoItemsStoreProtocol> store;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end

//@interface ViewController ()
//
//{
//    NSArray *prior;
//    
//}
//@end

@implementation ToDoItemsListViewController

- (void) viewDidLoad {
    [super viewDidLoad];
   // NSArray *prior;
    self.store = [[ToDoItemsStore alloc] init];
    [self addItemWithTitle:@"Buy new iPhone" andSummary:@"When iPhone 8 will be available." andPriority:PriorityStatusLow];
    [self addItemWithTitle:@"Sell my Galaxy S7" andSummary:@"Because iPhone is cool!" andPriority:PriorityStatusHigh];
     prior = [[NSArray alloc]initWithObjects:@"Low",@"Default", @"High", @"Urgent", nil];
}

@synthesize picker;

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return prior.count;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
   // NSLog(@"My number is %li", row);
   // return [prior objectAtIndex:row];
   // NSString *titleRow;
    titleRow = [NSString stringWithFormat:@"%@", [prior objectAtIndex:row]];
    return titleRow;
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoItem *item = [[self.store items] objectAtIndex:indexPath.row];
    item.isDone = !item.isDone;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.store removeItemAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.store itemsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    ToDoItem *item = [[self.store items] objectAtIndex:indexPath.row];
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.summary;
    cell.accessoryType = item.isDone ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    PriorityStatus  statPr = item.priority;
    switch (statPr) {
        case PriorityStatusUrgent:
            //red
                cell.backgroundColor = [UIColor colorWithRed:224/255.0 green:55/255.0 blue:57/255.0 alpha:1.0];
            break;
        case PriorityStatusHigh:
            //yellow
                cell.backgroundColor = [UIColor colorWithRed:224/255.0 green:192/255.0 blue:118/255.0 alpha:1.0];
            break;
        case PriorityStatusLow:
            //green
            cell.backgroundColor = [UIColor colorWithRed:40/255.0 green:100/255.0 blue:22/255.0 alpha:1.0];
            break;
        default:
            //gray
             cell.backgroundColor = [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1.0];;
    }

    return cell;
}


#pragma mark - Actions

- (void) addItemWithTitle:(NSString *)title andSummary:(NSString *)summary andPriority:(PriorityStatus)priority {
    ToDoItem *item = [[ToDoItem alloc] init];
    item.title = title;
    item.summary = summary;
    item.priority = priority;
    [self.store addItem:item];
};

- (IBAction)didTouchAddButton:(id)sender {
    NSString *title = self.titleTextFIeld.text;
    NSString *summary = self.summaryTextField.text;
    NSInteger prLog;
//    NSLog(@"My number is %@", pr);
    //[self addItemWithTitle:title andSummary:summary andPriority:PriorityStatusDefault];
    if ([titleRow isEqualToString:@"Low"]) {
        prLog = PriorityStatusLow;
    } else if ([titleRow isEqualToString:@"Default"]){
        prLog = PriorityStatusDefault;
    } else if ([titleRow isEqualToString:@"High"]){
        prLog = PriorityStatusHigh;
    } else if ([titleRow isEqualToString:@"Urgent"]){
        prLog = PriorityStatusUrgent;
    }
    [self addItemWithTitle:title andSummary:summary andPriority:prLog];

    
    NSUInteger newElementIndex = [self.store itemsCount] - 1;
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:newElementIndex inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    self.titleTextFIeld.text = nil;
    self.summaryTextField.text = nil;
    
    [self.view endEditing:YES];
}

//func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
//    if (editingStyle == UITableViewCellEditingStyle.Delete){
        
//        taskMgr.tasks.removeAtIndex(indexPath.row)
//        tblTasks.reloadData()
//    }
//}
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
//    if (editingStyle == UITableViewCellEditingStyle.Delete){
//        
//               taskMgr.tasks.removeAtIndex(indexPath.row)
//                tblTasks.reloadData()
//}






@end
