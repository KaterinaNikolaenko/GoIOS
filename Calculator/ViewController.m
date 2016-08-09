//
//  ViewController.m
//  Calculator
//
//  Created by Kirill Kirikov on 8/3/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (assign) BOOL didUserStartTyping;
@property (strong) NSMutableArray *digits;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.digits = [[NSMutableArray alloc] init];
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

- (IBAction)touchOperator:(UIButton *)sender {
    NSString *operator = [sender currentTitle];
    if ([operator isEqualToString:@"+"]) {
        if (self.digits.count >= 2) {
            float x = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            float y = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            float result = x + y;
            self.result.text = [NSString stringWithFormat:@"%f", result];
            self.didUserStartTyping = NO;
        }
    }
    else if ([operator isEqualToString:@"-"]) {
        if (self.digits.count >= 2) {
            float x = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            float y = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            float result = y - x;
            self.result.text = [NSString stringWithFormat:@"%f", result];
            self.didUserStartTyping = NO;
        }
     }
    else if ([operator isEqualToString:@"*"]) {
        if (self.digits.count >= 2) {
            float x = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            float y = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            float result = x * y;
            self.result.text = [NSString stringWithFormat:@"%f", result];
            self.didUserStartTyping = NO;
        }
    }
    else if ([operator isEqualToString:@"/"]) {
        if (self.digits.count >= 2) {
            float x = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            float y = [[self.digits lastObject] floatValue];
            [self.digits removeLastObject];
            float result = y / x;
            self.result.text = [NSString stringWithFormat:@"%f", result];
            self.didUserStartTyping = NO;
        }
    }
    
    }

- (IBAction)touchReturn:(id)sender {
    if (self.didUserStartTyping) {
        [self.digits addObject:self.result.text];
        self.didUserStartTyping = NO;
    }
    
    NSLog(@"Digits: %@", self.digits);
}


@end
