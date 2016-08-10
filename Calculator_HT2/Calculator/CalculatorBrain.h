//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Kirill Kirikov on 8/8/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
- (void) addDigit:(float)digit;
- (float) executeOperationNew:(NSString *)operation withDigit:(float)digit;
@end
