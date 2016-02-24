//
//  CalculatorButton.m
//  ListCalculator
//
//  Created by yusuke on 2016/02/18.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import "CalculatorButton.h"
#import "AppFont.h"
#import "AppColor.h"

@implementation CalculatorButton

+ (id)button {
    CalculatorButton *instance = [self buttonWithType:UIButtonTypeSystem];
    [instance setDefaultColor];
    return instance;
}

- (void)setSeal:(NSString *)seal {
    [self setTitle:seal forState:UIControlStateNormal];
    [self.titleLabel setFont:[AppFont numberButtonFont]];
}

- (void)setDefaultColor {
    [self setTitleColor:[AppColor calcButtonColor] forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
