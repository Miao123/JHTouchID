//
//  ViewController.m
//  指纹解锁
//
//  Created by 苗建浩 on 2017/12/6.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalized = @"请继续扫描你的指纹";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:myLocalized reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                NSLog(@"扫描成功");
                if (!success) {
                    NSLog(@"%@",error);
                }
            }else{
                NSLog(@"失败");
                if (!success) {
                    NSLog(@"%@",error);
                }
            }
        }];
    }
//    else{
//        NSLog(@"识别出错");
//
//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
