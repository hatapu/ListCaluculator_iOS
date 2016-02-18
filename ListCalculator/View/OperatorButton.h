//
//  OperatorButton.h
//  ListCalculator
//
//  Created by yusuke on 2016/02/18.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorButton.h"

typedef NS_ENUM(NSInteger, OperatorType) {
    OperatorTypeNone = 0,
    OperatorTypeAdd,
    OperatorTypeSub,
    OperatorTypeMul,
    OperatorTypeDiv
};

@interface OperatorButton : CalculatorButton

@property (nonatomic) OperatorType type;

@end
