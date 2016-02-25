//
//  DotButton.m
//  ListCalculator
//
//  Created by yusuke on 2016/02/25.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import "DotButton.h"

@implementation DotButton

+ (id)button {
    DotButton *instance = [super button];
    instance.seal = @".";

    return instance;
}

@end
