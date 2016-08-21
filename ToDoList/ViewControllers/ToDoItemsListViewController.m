//
//  ToDoItemsListViewController.m
//  ToDoList
//
//  Created by Kirill Kirikov on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ToDoItemsListViewController.h"
#import "ToDoItemsStore.h"
#import "NewItemTableViewCell.h"

@interface ToDoItemsListViewController() <UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource,NewItemTableViewCellDelegate,UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *summaryTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextFIeld;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) id<ToDoItemsStoreProtocol> store;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UIButton *myButton;
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


- (IBAction)priorAction:(UIButton *)sender {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addcell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"addcell"];
    }
    ToDoItem *item = [[self.store items] objectAtIndex:indexPath.row];
    NewItemTableViewCell *newItemCell = (NewItemTableViewCell *)cell;
    newItemCell.textField1.text = item.title;
    newItemCell.textField2.text = item.summary;
    //newItemCell.textField1.text = item.title;
    newItemCell.myButton.tag = indexPath.row;
    UIImage *image;
    //= [[UIImage imageNamed:@"hightPriority"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //[newItemCell.myButton setImage:image forState:UIControlStateNormal];
    newItemCell.delegate = self;
    
    //newItemCell.textField1.delegate = self;
   
    
    //newItemCell.textLabel.textColor = [UIColor colorWithRed:224/255.0 green:192/255.0 blue:118/255.0 alpha:1.0];
    
    //[newItemCell.myButton addTarget:self action:@selector(priorAction) forControlEvents:UIControlEventTouchUpInside];
   // cell.textLabel.text = item.title;
   // cell.detailTextLabel.text = item.summary;
    //cell.accessoryType = item.isDone ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    PriorityStatus  statPr = item.priority;
    switch (statPr) {
        case PriorityStatusUrgent:
            //red
                newItemCell.textField1.textColor = [UIColor colorWithRed:224/255.0 green:55/255.0 blue:57/255.0 alpha:1.0];
                newItemCell.textField2.textColor = [UIColor colorWithRed:224/255.0 green:55/255.0 blue:57/255.0 alpha:1.0];
                image = [[UIImage imageNamed:@"urgentPriority"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            break;
        case PriorityStatusHigh:
            //yellow
                newItemCell.textField1.textColor = [UIColor colorWithRed:224/255.0 green:192/255.0 blue:118/255.0 alpha:1.0];
                newItemCell.textField2.textColor = [UIColor colorWithRed:224/255.0 green:192/255.0 blue:118/255.0 alpha:1.0];
                image = [[UIImage imageNamed:@"hightPriority"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            break;
        case PriorityStatusLow:
            //green
            newItemCell.textField1.textColor = [UIColor colorWithRed:40/255.0 green:100/255.0 blue:22/255.0 alpha:1.0];
            newItemCell.textField2.textColor = [UIColor colorWithRed:40/255.0 green:100/255.0 blue:22/255.0 alpha:1.0];
            image = [[UIImage imageNamed:@"lowPriority"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            break;
        default:
            //gray
             newItemCell.textField1.textColor = [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1.0];
             newItemCell.textField2.textColor = [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1.0];
             image = [[UIImage imageNamed:@"default"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    [newItemCell.myButton setImage:image forState:UIControlStateNormal];
//cell
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
//-(NSUInteger)currentSellectedRowIndex {
//    NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
//    if (selectedPath) {
//        return selectedPath.row;
//    }
//    else{
//        return NSNotFound;
//    }
//    return 0;
//}

-(void) buttonTappedOnCell:(NewItemTableViewCell *)selectedcell {
  //  NSLog(@"All good!!");
        NSIndexPath *myPath = [self.tableView indexPathForCell:selectedcell];
    
    
    //selectedcell.textLabel.textColor = [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1.0];
    ToDoItem *item = [[self.store items] objectAtIndex:myPath.row];
    PriorityStatus  statPr = item.priority;
    UIImage *image;
    switch (statPr) {
        case PriorityStatusUrgent:
            //green
            selectedcell.textField1.textColor = [UIColor colorWithRed:40/255.0 green:100/255.0 blue:22/255.0 alpha:1.0];
            selectedcell.textField2.textColor = [UIColor colorWithRed:40/255.0 green:100/255.0 blue:22/255.0 alpha:1.0];
            item.priority = PriorityStatusLow;
            image = [[UIImage imageNamed:@"lowPriority"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            break;
        case PriorityStatusHigh:
            //red
            selectedcell.textField1.textColor = [UIColor colorWithRed:224/255.0 green:55/255.0 blue:57/255.0 alpha:1.0];
            selectedcell.textField2.textColor = [UIColor colorWithRed:224/255.0 green:55/255.0 blue:57/255.0 alpha:1.0];
            item.priority = PriorityStatusUrgent;
            image = [[UIImage imageNamed:@"urgentPriority"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            break;
        case PriorityStatusLow:
            //gray
            selectedcell.textField1.textColor = [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1.0];
            selectedcell.textField2.textColor = [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1.0];
            item.priority = PriorityStatusDefault;
            image = [[UIImage imageNamed:@"default"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            break;
        default:
            //yellow
            selectedcell.textField1.textColor = [UIColor colorWithRed:224/255.0 green:192/255.0 blue:118/255.0 alpha:1.0];
            selectedcell.textField2.textColor = [UIColor colorWithRed:224/255.0 green:192/255.0 blue:118/255.0 alpha:1.0];
            item.priority = PriorityStatusHigh;
            image = [[UIImage imageNamed:@"hightPriority"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }

    [selectedcell.myButton setImage:image forState:UIControlStateNormal];
    
}

- (void)updatedToDoItem:(NSString *)cellItem fromCell:(NewItemTableViewCell *)cell
{
    NSIndexPath *p = [self.tableView indexPathForCell:cell];
    //id item = self.store[p.row];
    cell.textField1.text = cellItem;
    ToDoItem *item = [[self.store items] objectAtIndex:p.row];
    item.title = cellItem;
    item.summary = cell.textField2.text;
    item.priority =  item.priority;
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
