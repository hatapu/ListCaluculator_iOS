//
//  OperatorButton.h
//  ListCalculator
//
//  Created by yusuke on 2016/02/18.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorButton.h"

@interface OperatorButton : CalculatorButton

@property (nonatomic) OperatorType type;

- (NSString *)getOperatorStr;

@end
