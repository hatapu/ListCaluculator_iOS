//
//  CaluculatorController.m
//  ListCalculator
//
//  Created by yusuke on 2016/02/17.
//  Copyright © 2016年 hatapu. All rights reserved.
//

#import "CaluculatorController.h"

@interface CaluculatorController ()

@property (nonatomic)CGFloat width;
@property (nonatomic)CGFloat height;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
