//
//  ViewController.m
//  qwet
//
//  Created by lsvt on 2017/6/23.
//  Copyright © 2017年 lsvt. All rights reserved.
//

#import "ViewController.h"
#import "firstViewController.h"
#import "LSNewHelpController.h"
#import "LSNewLoginController.h"
#import "LSNavigationController.h"
#import "modalViewController.h"
#import "LSTestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)one:(id)sender {
    
    firstViewController *vc = [[firstViewController alloc] init];
    LSNavigationController *nav = [[LSNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}
- (IBAction)two:(id)sender {
    
    LSNewHelpController *vc = [[LSNewHelpController alloc] init];
    LSNavigationController *nav = [[LSNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

- (IBAction)three:(id)sender {
    
    LSTestViewController *vc = [[LSTestViewController alloc] init];
    LSNavigationController *nav = [[LSNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
