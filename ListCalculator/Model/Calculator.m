//
//  Calculator.m
//  ListCalculator
//
//  Created by yusuke on 2016/02/18.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import "Calculator.h"

@interface Calculator()

@property (nonatomic)NSMutableString *leftOperand;
@property (nonatomic)NSMutableString *rightOperand;
@property (nonatomic)NSString *result;
@property (nonatomic)OperatorType operator;
@property (nonatomic)CalculatorState state;

@end

@implementation Calculator

- (id)init {
    self = [super init];
    if (self) {
        [self reset];
    }
    return self;
}

- (void)reset {
    _state = CalculatorStateLeftInput;
    _operator = OperatorTypeNone;
    _leftOperand = [NSMutableString string];
    _rightOperand = [NSMutableString string];
    _result = nil;
}

- (void)inputNumber:(NSInteger)num {
    if (_state == CalculatorStateResult) {
        [self reset];
    }
    if (_state == CalculatorStateLeftInput) {
        [_leftOperand appendString:[NSString stringWithFormat:@"%ld", (long)num]];
    } else {
        [_rightOperand appendString:[NSString stringWithFormat:@"%ld", (long)num]];
    }
}

- (void)inputOperator:(OperatorType)op {
    // 演算子ではなくマイナスとして扱う
    if ((op == OperatorTypeSub) && [self isOpMinus]) {
        [self inputMinus];
        return;
    }
    
    _operator = op;
    if (_state == CalculatorStateResult) {
        _leftOperand = [_result mutableCopy];
        _rightOperand = [NSMutableString string];
    } else if(_state == CalculatorStateRightInput) {
        [self inputEqual];
        [self inputOperator:op];
    }
    _state = CalculatorStateRightInput;
}

- (void)inputEqual {
    if (_state == CalculatorStateResult) {
        _leftOperand = [_result mutableCopy];
    }
    NSDecimalNumber *dec = [self execCalcDec];
    _result = dec.stringValue;
    _state = CalculatorStateResult;
}

// -を引くではなくマイナスにする条件
- (BOOL)isOpMinus {
    if (((_state == CalculatorStateLeftInput) && (_leftOperand.length == 0)) ||
        ((_state == CalculatorStateRightInput) && (_rightOperand.length == 0))) {
        return YES;
    }
    return NO;
}

- (void)inputMinus {
    switch (_state) {
        case CalculatorStateLeftInput:
            [_leftOperand appendString:@"-"];
            break;
        case CalculatorStateRightInput:
            [_rightOperand appendString:@"-"];
            break;
        default:
            break;
    }
}


#pragma mark - 文字列操作

/**
 * 関数電卓用？
 * 文字列から数値へ変換
 * 正しい数値にならない文字列だったらnilを返す
 */
- (NSNumber *)stringToNumber:(NSString *)operand {
    if (![self isOperandStringValid:operand]) {
        return nil;
    }
    NSNumber *retNum;
    NSRange dotRange = [operand rangeOfString:@"."];
    if (dotRange.location == NSNotFound) {
        //整数
        retNum = [NSNumber numberWithInteger:[operand integerValue]];
    } else {
        //小数あり
        retNum = [NSNumber numberWithDouble:[operand doubleValue]];
    }
    return retNum;
}

/**
 * 文字列から10進浮動小数点型に変換
 * 正しいフォーマットでなければ例外throw
 */
- (NSDecimalNumber *)stringToDec:(NSString *)operand {
    if (![self isOperandStringValid:operand]) {
        [NSException raise:@"number format Exception" format:@"reason"];
    }
    NSDecimalNumber *retDec = [NSDecimalNumber decimalNumberWithString:operand];
    return retDec;
}


#pragma mark - 計算処理

/**
 * 計算実行
 */
- (NSDecimalNumber *)execCalcDec {
    NSDecimalNumber *left = [self stringToDec:_leftOperand];
    NSDecimalNumber *right = [self stringToDec:_rightOperand];
    NSDecimalNumber *ret;
    switch (_operator) {
        case OperatorTypeAdd:
            ret = [left decimalNumberByAdding:right];
            break;
        case OperatorTypeSub:
            // ToDo: 計算があやしい
            ret = [left decimalNumberBySubtracting:right];
            break;
        case OperatorTypeMul:
            ret = [left decimalNumberByMultiplyingBy:right];
            break;
        case OperatorTypeDiv:
            ret = [left decimalNumberByDividingBy:right];
            break;
        default:
            ret = nil;
            break;
    }
    return ret;
}

#pragma mark - 表示

- (NSString *)getCalcString {
    NSString *retString;
    switch (_operator) {
        case OperatorTypeAdd:
        case OperatorTypeSub:
        case OperatorTypeMul:
        case OperatorTypeDiv:
            retString = [[_leftOperand stringByAppendingString:[self getOperatorSeal:_operator]] stringByAppendingString:_rightOperand];
            break;
        default:
            retString = _leftOperand;
            break;
    }
    return retString;
}

- (NSString *)getResultString {
    return _result;
}

- (NSString *)getOperatorSeal:(OperatorType)type {
    switch (type) {
        case OperatorTypeAdd:
            return @"+";
        case OperatorTypeSub:
            return @"−";
        case OperatorTypeMul:
            return @"×";
        case OperatorTypeDiv:
            return @"÷";
        default:
            return @"error";
    }
}


#pragma mark - Validation

- (BOOL)isOperandStringValid:(NSString *)operand {
    // 0~1と.-だけであることの確認
    NSCharacterSet *numDotCharacters = [NSCharacterSet characterSetWithCharactersInString:@"0123456789.-"];
    NSScanner *aScanner = [NSScanner localizedScannerWithString:operand];
    [aScanner setCharactersToBeSkipped:nil];
    [aScanner scanCharactersFromSet:numDotCharacters intoString:NULL];
    if (![aScanner isAtEnd]) {
        return NO;
    }

    // ToDo: 数値が入っているか、長さ、.が2コないかとか
    // とりあえず正しい形であると仮定
    
    return YES;
}

@end
