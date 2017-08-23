//
//  LSNewLoginController.m
//  JFGFramworkDemo
//
//  Created by lsvt on 2017/6/12.
//  Copyright © 2017年 lsvt. All rights reserved.
//

#import "LSNewLoginController.h"



@interface LSNewLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *passWordFiles;
@property (weak, nonatomic) IBOutlet UIButton *remberBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgotBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, assign) BOOL isRemember;

@end

@implementation LSNewLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [defaults objectForKey:@"userCount"];
    NSString *password = [defaults objectForKey:@"passW"];
    BOOL isRemember = [defaults boolForKey:@"isRemember"];
    
    if (isRemember) {
        _isRemember = NO;
        [self.remberBtn setImage:[UIImage imageNamed:@"loginrmbox"] forState:UIControlStateNormal];
        
        self.userField.text = name;
        self.passWordFiles.text = password;
    } else {
        _isRemember = YES;
        [self.remberBtn setImage:[UIImage imageNamed:@"loginbox"] forState:UIControlStateNormal];
        self.userField.text = nil;
        self.passWordFiles.text = nil;
    }
    
//    self.userField.text = name;
//    self.passWordFiles.text = password;
    
//    NSString *loginAP = NSLocalizedString(@"loginAccountPlace", nil);
//    NSString *loginPP = NSLocalizedString(@"loginPassPlace", nil);
    self.userField.placeholder = @"account";
    self.passWordFiles.placeholder = @"password";
    
}


- (IBAction)rememberClick:(id)sender {
    
//    if (_isRemember) {
//        
//        _isRemember = NO;
//        
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setBool:YES forKey:@"isRemember"];
//        [defaults synchronize];
//        
//        [self.remberBtn setImage:[UIImage imageNamed:@"loginrmbox"] forState:UIControlStateNormal];
//    } else {
//        
//        _isRemember = YES;
//        
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setBool:NO forKey:@"isRemember"];
//        [defaults synchronize];
//        
//        [self.remberBtn setImage:[UIImage imageNamed:@"loginbox"] forState:UIControlStateNormal];
//    }
    
}
- (IBAction)forgetClick:(id)sender {
    
    
}


- (IBAction)loginClick:(id)sender {
    
//    NSString *name = self.userField.text;
//    NSString *password = self.passWordFiles.text;
//    
//    NSString *alertStr;
//        
//    [self.view endEditing:YES];
//    
//    if ([name isEqualToString:@""] || [password isEqualToString:@""]) {
//        NSString *title = NSLocalizedString(@"loginContent", nil);
//        alertStr = title;
//    } else {
//        
//        //推送功能时，登录的接口，开发版本用.dev  生产版不用加.dev
//        [JFGSDK userLogin:name keyword:password cerType:@"com.lsvt.FreeCamer"];
//        NSString *title = NSLocalizedString(@"logining", nil);
//        alertStr = title;
//    }
//    
//    [FLProressHUD showIndicatorViewFLHUDForStyleDarkWithView:self.view text:alertStr position:FLProgressHUDPositionCenter];
    
}
    

- (IBAction)registerClick:(id)sender {
//    
//    LSNewRegisterController *vc = [[LSNewRegisterController alloc] init];
//    LSNavigationController *nav = [[LSNavigationController alloc] initWithRootViewController:vc];
//    
//    [self presentViewController:nav animated:YES completion:nil];
}


//- (void)jfgLoginResult:(JFGErrorType)errorType {
//    
//    if (errorType == JFGErrorTypeNone) {
//        
//        [self isLoginSuccess:YES];
//        
//    }else{
//        
//        [self isLoginSuccess:NO];
//        
//    }
//}
//
//- (void)isLoginSuccess:(BOOL)success
//{
//    
//    if (success) {
//        
//        self.isLogin = YES;
//        
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setObject:self.userField.text forKey:@"userCount"];
//        [defaults setObject:self.passWordFiles.text forKey:@"passW"];
//        [defaults setBool:_isLogin forKey:@"isLogin"];
//        [defaults synchronize];
//        
//        
//        LSNewDeviceController *vc = [[LSNewDeviceController alloc] init];
//        LSNavigationController *nav = [[LSNavigationController alloc] initWithRootViewController:vc];
////        [UIApplication sharedApplication].keyWindow.rootViewController = nav;
//        [self presentViewController:nav animated:NO completion:nil];
//        
//        
////        [FLProressHUD hideAllHUDForView:self.view animation:YES delay:1];
//        
//    } else {
//        NSString *title = NSLocalizedString(@"loginFaile", nil);
//        
//        [FLProressHUD showTextFLHUDForStyleDarkWithView:self.view text:title position:FLProgressHUDPositionCenter];
//        [FLProressHUD hideAllHUDForView:self.view animation:YES delay:1];
//    }
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
