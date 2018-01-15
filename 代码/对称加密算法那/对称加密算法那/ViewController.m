//
//  ViewController.m
//  对称加密算法那
//
//  Created by H on 2017/5/30.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "ViewController.h"
#import "EncryptionTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //AES -- ECB 加密
    NSString * key = @"abc";
    NSLog(@"加密的结果:%@",[[EncryptionTools sharedEncryptionTools] encryptString:@"hello" keyString:key iv:nil]);
    // 解密 : d1QG4T2tivoi0Kiu3NEmZQ==
    NSLog(@"解密之后的结果:%@",[[EncryptionTools sharedEncryptionTools] decryptString:@"d1QG4T2tivoi0Kiu3NEmZQ==" keyString:key iv:nil]);
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
