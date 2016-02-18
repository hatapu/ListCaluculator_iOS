//
//  CaluculatorController.m
//  ListCalculator
//
//  Created by yusuke on 2016/02/17.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import "CaluculatorController.h"
#import "NumberButton.h"
#import "AppColor.h"

@interface CaluculatorController ()

@property (nonatomic)CGFloat width;
@property (nonatomic)CGFloat height;
@property (nonatomic)UIView *calcView;
@property (nonatomic)NSArray *numButtons;

@end

@implementation CaluculatorController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;

    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViews {
    [self initSettingButton];
    [self initCalcView];
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
    _calcView = [[UIView alloc] initWithFrame:CGRectMake(0, y_val, _width, calcHeight)];
    _calcView.backgroundColor = [AppColor calcViewBackground];
    [self.view addSubview:_calcView];
    
    y_val = calcHeight - btnHeight;
    [self setupNumberButtons:x_val y:y_val width:btnWidth height:btnHeight];
    [self setupOperatorButtons:x_val y:y_val width:btnWidth height:btnHeight];
}

- (void)setupNumberButtons:(CGFloat)x_val y:(CGFloat)y_val width:(CGFloat)btnWidth height:(CGFloat)btnHeight {
    for (NSInteger i = 0; i <= 9; i++) {
        NumberButton *numBtn = [NumberButton buttonWithType:UIButtonTypeSystem];
        numBtn.frame = CGRectMake(x_val, y_val, btnWidth, btnHeight);
        numBtn.number = i;
        [_calcView addSubview:numBtn];
        
        if ((i == 0) || (i == 3) || (i == 6)) {
            x_val = 0;
            y_val -= btnHeight;
        } else {
            x_val += btnWidth;
        }
    }
}

- (void)setupOperatorButtons:(CGFloat)x_val y:(CGFloat)y_val width:(CGFloat)btnWidth height:(CGFloat)btnHeight {
    
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
