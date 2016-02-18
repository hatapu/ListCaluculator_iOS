//
//  OperatorButton.m
//  ListCalculator
//
//  Created by yusuke on 2016/02/18.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import "OperatorButton.h"
#import "AppFont.h"

@interface OperatorButton()

@end

@implementation OperatorButton

- (void)setType:(OperatorType)type {
    _type = type;
    [self setTitle:[self getOperatorStr] forState:UIControlStateNormal];
    [self.titleLabel setFont:[AppFont numberButtonFont]];
}

- (NSString *)getOperatorStr {
    switch (_type) {
        case OperatorTypeAdd:
            return @"＋";
        case OperatorTypeSub:
            return @"−";
        case OperatorTypeMul:
            return @"×";
        case OperatorTypeDiv:
            return @"÷";
        default:
            return @"ERROR";
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
