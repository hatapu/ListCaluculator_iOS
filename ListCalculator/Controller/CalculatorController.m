//
//  CalculatorController.m
//  ListCalculator
//
//  Created by yusuke on 2016/02/17.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import "CalculatorController.h"
#import "NumberButton.h"
#import "OperatorButton.h"
#import "DotButton.h"
#import "AppColor.h"
#import "Calculator.h"

@interface CalculatorController ()

@property (nonatomic)CGFloat width;
@property (nonatomic)CGFloat height;
@property (nonatomic)Calculator *calculator;
@property (nonatomic)UIView *calcView;
@property (nonatomic)NSMutableArray *buttons;
@property (nonatomic)UIView *resultView;
@property (nonatomic)UILabel *resultLabel;

@end

@implementation CalculatorController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;

    _calculator = [[Calculator alloc] init];
    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViews {
    [self initSettingButton];
    [self initCalcView];
    [self initResultView];
}


#pragma mark - Setting Button

- (void)initSettingButton {
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [settingBtn setTitle:@"Setting" forState:UIControlStateNormal];
    [settingBtn sizeToFit];
    CGFloat btnWidth = settingBtn.frame.size.width;
    CGFloat btnHeight = settingBtn.frame.size.height;
    CGFloat x_val = _width - btnWidth - 20;
    CGFloat y_val = 60;
    settingBtn.frame = CGRectMake(x_val ,y_val, btnWidth, btnHeight);
    [settingBtn addTarget:self action:@selector(settingButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:settingBtn];
}

- (void)settingButtonPressed:(id)sender {
    NSLog(@"setting");
    [self performSegueWithIdentifier:@"toSetting" sender:self];
}


#pragma mark - Calc View

- (void)initCalcView {
    CGFloat btnHeight = 66;
    CGFloat btnWidth = _width / 4;
    CGFloat calcHeight = btnHeight * 5;
    CGFloat x_val = 0;
    CGFloat y_val = _height - calcHeight;
    _buttons = [NSMutableArray array];
    _calcView = [[UIView alloc] initWithFrame:CGRectMake(0, y_val, _width, calcHeight)];
    _calcView.backgroundColor = [AppColor calcViewBackground];
    [self.view addSubview:_calcView];
    
    y_val = calcHeight - btnHeight;
    [self setupNumberButtons:x_val y:y_val width:btnWidth height:btnHeight];
    x_val = btnWidth * 3;
    y_val = calcHeight - 2 * btnHeight;
    [self setupOperatorButtons:x_val y:y_val width:btnWidth height:btnHeight];
    y_val = calcHeight - btnHeight;
    [self setupEqualButton:x_val y:y_val width:btnWidth height:btnHeight];
    x_val = btnWidth * 2;
    [self setupDotButton:x_val y:y_val width:btnWidth height:btnHeight];
}


#pragma mark 数字ボタン

- (void)setupNumberButtons:(CGFloat)x_val y:(CGFloat)y_val width:(CGFloat)btnWidth height:(CGFloat)btnHeight {
    for (NSInteger i = 0; i <= 9; i++) {
        NumberButton *numBtn = [NumberButton button];
        numBtn.frame = CGRectMake(x_val, y_val, btnWidth, btnHeight);
        numBtn.number = i;
        [numBtn addTarget:self action:@selector(numButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_calcView addSubview:numBtn];
        [_buttons addObject:numBtn];
        
        if ((i == 0) || (i == 3) || (i == 6)) {
            x_val = 0;
            y_val -= btnHeight;
        } else {
            x_val += btnWidth;
        }
    }
}

- (void)numButtonPressed:(NumberButton *)sender {
    [_calculator inputNumber:sender.number];
    _resultLabel.text = [_calculator getCalcString];
}

#pragma mark 小数点ボタン

- (void)setupDotButton:(CGFloat)x_val y:(CGFloat)y_val width:(CGFloat)btnWidth height:(CGFloat)btnHeight {
    DotButton *dotBtn = [DotButton button];
    dotBtn.frame = CGRectMake(x_val, y_val, btnWidth, btnHeight);
    [dotBtn addTarget:self action:@selector(dotButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_calcView addSubview:dotBtn];
    [_buttons addObject:dotBtn];
}

- (void)dotButtonPressed:(DotButton *)sender {

}


#pragma mark 演算子ボタン

- (void)setupOperatorButtons:(CGFloat)x_val y:(CGFloat)y_val width:(CGFloat)btnWidth height:(CGFloat)btnHeight {
    for (NSInteger i = 0; i < 4; i++) {
        OperatorButton *opBtn = [OperatorButton button];
        opBtn.frame = CGRectMake(x_val, y_val, btnWidth, btnHeight);
        opBtn.type = OperatorTypeAdd + i;
        [opBtn addTarget:self action:@selector(opButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_calcView addSubview:opBtn];
        [_buttons addObject:opBtn];
        y_val -= btnHeight;
    }
}

- (void)opButtonPressed:(OperatorButton *)sender {
    [_calculator inputOperator:sender.type];
    _resultLabel.text = [_calculator getCalcString];
}

#pragma mark =ボタン

- (void)setupEqualButton:(CGFloat)x_val y:(CGFloat)y_val width:(CGFloat)btnWidth height:(CGFloat)btnHeight {
    CalculatorButton *equalBtn = [CalculatorButton button];
    equalBtn.frame = CGRectMake(x_val, y_val, btnWidth, btnHeight);
    [equalBtn addTarget:self action:@selector(equalButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    equalBtn.seal = @"=";
    [_calcView addSubview:equalBtn];
    [_buttons addObject:equalBtn];
}

- (void)equalButtonPressed:(CalculatorButton *)sender {
    [_calculator inputEqual];
    _resultLabel.text = [_calculator getResultString];
}


#pragma mark - 計算表示

- (void)initResultView {
    CGFloat height = 66;
    CGFloat y_val = _calcView.frame.origin.y - height;
    _resultView = [[UIView alloc] initWithFrame:CGRectMake(0, y_val, _width, height)];
    _resultView.backgroundColor = [AppColor resultViewBackground];
    [self.view addSubview:_resultView];
    
    CGFloat padding_x = 10;
    _resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding_x, 0, _width - 2 * padding_x, height)];
    _resultLabel.text = @"0";
    _resultLabel.textColor = [AppColor resultLabelColor];
    _resultLabel.textAlignment = NSTextAlignmentRight;
    [_resultView addSubview:_resultLabel];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
