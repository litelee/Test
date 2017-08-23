//
//  LSNavigationController.m
//  小萤
//
//  Created by lsvt on 2016/11/21.
//  Copyright © 2016年 lsvt. All rights reserved.
//

#import "LSNavigationController.h"


@interface LSNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation LSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbackimage"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor whiteColor]}];

}

/**
 *  重写push方法的目的 : 拦截所有push进来的子控制器
 *
 *  @param viewController 刚刚push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) { // 如果viewController不是最早push进来的子控制器
        // 左上角
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"back_button1"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"back_button1"] forState:UIControlStateHighlighted];

        [backButton sizeToFit];
        // 这句代码放在sizeToFit后面
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        // 隐藏底部的工具条
//        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 所有设置搞定后, 再push控制器
    [super pushViewController:viewController animated:animated];
}

//- (UIViewController *)popViewControllerAnimated:(BOOL)animated
//{
//    return [super popViewControllerAnimated:NO];
//}
//
//- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    return [super popToViewController:viewController animated:NO];
//}
//
//- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
//{
//    return [super popToRootViewControllerAnimated:NO];
//}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 *  手势识别器对象会调用这个代理方法来决定手势是否有效
 *
 *  @return YES : 手势有效, NO : 手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //    if (self.childViewControllers.count == 1) { // 导航控制器中只有1个子控制器
    //        return NO;
    //    }
    //    return YES;
    
    // 手势何时有效 : 当导航控制器的子控制器个数 > 1就有效
    return self.childViewControllers.count > 1;
}


@end
