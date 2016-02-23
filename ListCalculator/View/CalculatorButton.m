//
//  CalculatorButton.m
//  ListCalculator
//
//  Created by yusuke on 2016/02/18.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import "CalculatorButton.h"
#import "AppFont.h"

@implementation CalculatorButton

+ (id)button {
    return [self buttonWithType:UIButtonTypeSystem];
}

- (void)setSeal:(NSString *)seal {
    [self setTitle:seal forState:UIControlStateNormal];
    [self.titleLabel setFont:[AppFont numberButtonFont]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
