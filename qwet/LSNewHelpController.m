//
//  LSNewHelpController.m
//  JFGFramworkDemo
//
//  Created by lsvt on 2017/6/16.
//  Copyright © 2017年 lsvt. All rights reserved.
//

#import "LSNewHelpController.h"

@interface LSNewHelpController ()

@end

@implementation LSNewHelpController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Help";
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"back_button1"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"back_button1"] forState:UIControlStateHighlighted];
    
    [backButton sizeToFit];
    
    // 这句代码放在sizeToFit后面
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void)back {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)cancelClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
