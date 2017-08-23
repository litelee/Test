//
//  modalViewController.m
//  qwet
//
//  Created by lsvt on 2017/6/23.
//  Copyright © 2017年 lsvt. All rights reserved.
//

#import "modalViewController.h"

@interface modalViewController ()

@end

@implementation modalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";
    //添加顶部scrollerView
    [self setupTitleScroller];
    
}


- (void)setupTitleScroller {

    UIScrollView *titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    titleScrollView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:titleScrollView];
    
    CGFloat lableW = 100;
    CGFloat lableY = 0;
    CGFloat lableH = titleScrollView.frame.size.height;
    
}

@end
