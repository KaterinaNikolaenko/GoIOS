//
//  ViewController.m
//  Calculator
//
//  Created by Kirill Kirikov on 8/3/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (assign) BOOL didUserStartTyping;
@property (strong) CalculatorBrain *model;
@property (strong) NSString *CurretOperation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[CalculatorBrain alloc] init];
    self.CurretOperation = @"0";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)touchDigit:(UIButton *)sender {
    
    if (!self.didUserStartTyping) {
        self.result.text = sender.currentTitle;
        self.didUserStartTyping = YES;
    } else {
        self.result.text = [self.result.text stringByAppendingString:sender.currentTitle];
    }
}

- (IBAction)CleanButton:(UIButton *)sender {
    self.result.text = @"";
    self.CurretOperation = @"0";
}


- (IBAction)touchOperator:(UIButton *)sender {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *result = [formatter numberFromString:self.result.text];
    
    if (![self.CurretOperation isEqualToString:@"0"]) {

                float result1 = [self.model executeOperationNew:self.CurretOperation withDigit:[result floatValue]];
                self.result.text = [NSString stringWithFormat:@"%f", result1];
                [self.model addDigit:result1];
       
        } else {

          [self.model addDigit:[result floatValue]];
   }
    
    self.didUserStartTyping = NO;
    NSString *operator = [sender currentTitle];
    self.CurretOperation = operator;
    
}

- (IBAction)touchReturn:(id)sender {
    //if (self.didUserStartTyping) {
       NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
       NSNumber *result = [formatter numberFromString:self.result.text];
        
        float result1 = [self.model executeOperationNew:self.CurretOperation withDigit:[result floatValue]];
        self.result.text = [NSString stringWithFormat:@"%f", result1];
        self.didUserStartTyping = NO;
 // }
    
    self.CurretOperation = @"0";
    
}


@end
