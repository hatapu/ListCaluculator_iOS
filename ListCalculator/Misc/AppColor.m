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

+ (UIColor *)calcButtonColor {
    return [UIColor whiteColor];
}

+ (UIColor *)resultViewBackground {
    return [self mediumCarmine];
}

+ (UIColor *)resultLabelColor {
    return [UIColor whiteColor];
}

#pragma mark - custom color

+ (UIColor *)pergianGreen {
    return [UIColor colorWithRed:0 green:0.63 blue:0.64 alpha:1];
}

+ (UIColor *)mediumCarmine {
    return [UIColor colorWithRed:0.71 green:0.24 blue:0.22 alpha:1];
}

@end
