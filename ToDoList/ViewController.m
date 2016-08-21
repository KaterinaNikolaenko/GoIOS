//
//  ViewController.m
//  ToDoList
//
//  Created by Kirill Kirikov on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (assign, nonatomic) CGFloat bottomConstant;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
//    self.bottomConstant = self.bottomConstraint.constant;
//     UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
//       [self.view addGestureRecognizer:tap];
}

//- (void)viewWillAppear:(BOOL)animated {
//     [[NSNotificationCenter defaultCenter] addObserver:self
//                                                  selector:@selector(keyboardWasShown:)
//                                                      name:UIKeyboardWillShowNotification
//                                                    object:nil];
//       [[NSNotificationCenter defaultCenter] addObserver:self
//                                                    selector:@selector(keyboardWillBeHidden:)
//                                                        name:UIKeyboardWillHideNotification
//                                                      object:nil];
//}
//
//- (void)viewDidDisappear:(BOOL)animated {
//       [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                           name:UIKeyboardWillShowNotification
//                                                         object:nil];
//       [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                           name:UIKeyboardWillHideNotification
//                                                         object:nil];
//}
//
////- (void)didReceiveMemoryWarning {
////       [super didReceiveMemoryWarning];
////}
//
//- (void)keyboardWasShown:(NSNotification *)notification {
//       NSDictionary *userInfo = notification.userInfo;
//       CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//       self.bottomConstraint.constant = kbSize.height - self.bottomConstant;
//}
//
//- (void)keyboardWillBeHidden:(NSNotification *)notification {
//       self.bottomConstraint.constant = self.bottomConstant;
//}
//
//-(void)dismissKeyboard {
//       [self.textField resignFirstResponder];
//}
@end
