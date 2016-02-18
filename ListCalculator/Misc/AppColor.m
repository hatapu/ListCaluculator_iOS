//
//  AppColor.m
//  ListCalculator
//
//  Created by yusuke on 2016/02/17.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import "AppColor.h"

@implementation AppColor


#pragma mark - UI parts color

+ (UIColor *)calcViewBackground {
    return [self pergianGreen];
}


#pragma mark - custom color

+ (UIColor *)pergianGreen {
    return [UIColor colorWithRed:0 green:0.63 blue:0.64 alpha:1];
}

@end
