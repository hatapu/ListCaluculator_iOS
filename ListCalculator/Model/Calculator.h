//
//  Calculator.h
//  ListCalculator
//
//  Created by yusuke on 2016/02/18.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, OperatorType) {
    OperatorTypeNone = 0,
    OperatorTypeAdd,
    OperatorTypeSub,
    OperatorTypeMul,
    OperatorTypeDiv
};

@interface Calculator : NSObject

@end
