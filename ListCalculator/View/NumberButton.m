//
//  NumberButton.m
//  ListCalculator
//
//  Created by yusuke on 2016/02/18.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import "NumberButton.h"
#import "AppFont.h"

@interface NumberButton()

@end

@implementation NumberButton

- (void)setNumber:(NSInteger)number {
    _number = number;
    NSString *seal = [NSString stringWithFormat:@"%d", _number];
    [self setTitle:seal forState:UIControlStateNormal];
    [self.titleLabel setFont:[AppFont numberButtonFont]];
}


@end
