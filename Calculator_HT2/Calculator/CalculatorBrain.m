//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Kirill Kirikov on 8/8/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (strong) NSMutableArray<NSNumber *> *digits;
@end

@implementation CalculatorBrain

#pragma mark - Constructor

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.digits = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Public Interface

- (void) addDigit:(float)digit {
    [self.digits addObject:@(digit)];
    NSLog(@"Digits: %@", self.digits);
}


- (float) executeOperationNew:(NSString *)operation withDigit:(float)digit{
    if ([operation isEqualToString:@"+"]) {
        return [self performOperationWithBlockNew:^float(float x) {
            return x + digit;
        }];
    }
    else if ([operation isEqualToString:@"-"]) {
        return [self performOperationWithBlockNew:^float(float x) {
            return x - digit;
        }];
    }
    else if ([operation isEqualToString:@"*"]) {
        return [self performOperationWithBlockNew:^float(float x) {
            return x * digit;
        }];
    }
    else if ([operation isEqualToString:@"/"]) {
        return [self performOperationWithBlockNew:^float(float x) {
            return x / digit;
        }];
    }
    else if ([operation isEqualToString:@"Sqrt"]) {
      //  return [self performOperationWithBlockNew:^float(float x) {
            return sqrt(digit);
       // }];
    }
    
    return 0;
}


- (float) performOperationWithBlockNew:(float (^)(float))operation {
    
    if (self.digits.count >= 1) {
        float x = [[self.digits lastObject] floatValue];
        [self.digits removeLastObject];
        
        return operation(x);
    }
    
    return 0;
}


- (float) performUnaryOperationWithBlock:(float(^)(float))operation {
    
    if (self.digits.count >= 1) {
        float x = [[self.digits lastObject] floatValue];
        [self.digits removeLastObject];
        return operation(x);
    }
    
    return 0;
}

#pragma mark -

@end
