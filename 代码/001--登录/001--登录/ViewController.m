//
//  ViewController.m
//  001--登录
//
//  Created by H on 2017/5/30.
//  Copyright © 2017年 TZ. All rights reserved.
//  原则! 1.网络上不允许明文传输用的隐私信息!!
//       2.本地不允许明文保存用户的隐私信息!!
//  安全是一个无底洞!!!

#import "ViewController.h"
#import "NSString+Hash.h"


//       盐
//有一个特点!! 必须非常长,足够复杂
static NSString * salt = @")I{HDSFIUQH{OKJC{(DUKLJXPOIY_(*^&*Q%D(&^Q%W*&^)Q*(^D)Q&WD()*&QW)(*DY)QW(HDPIUWHQFPOIHJ:OASKDFJ:KJSDFPOIJ{DSOIJF";
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userid;
@property (weak, nonatomic) IBOutlet UITextField *pwd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)loginBtn:(id)sender {
    
    //账号
    NSString * uid = self.userid.text;
    //密码
    NSString * pwd = self.pwd.text;
    //1.MD5 -- 哈希算法   -- 不足:太简单,很多值都能够找到!不安全
//    pwd = pwd.md5String;
    //2.早期的解决方案 -- 加盐  -- 不足:盐是写死的!一旦盐泄露!就不安全了!
//    pwd = [pwd stringByAppendingString:salt].md5String;
    //3. ---  HMAC  其实本质上还是哈希!!
    //用一个密钥加密!并且做了两次散列!
    //在实际的开发中,密钥来自于服务器!!
    
    pwd = [pwd hmacMD5StringWithKey:@"hank"];
    
    
    
    NSLog(@"现在的密码是: %@",pwd);
    
    //发送网络请求
    [self sendUserID:uid pwd:pwd];
    
    
}




//发送网络请求
- (void)sendUserID:(NSString *)uid pwd:(NSString *)pwd {
    
    
    if ([uid isEqualToString:@"hank"] && [pwd isEqualToString:@"e9cdab82d48dcd37af7734b6617357e6"]) {
        NSLog(@"登录成功!!");//保存密钥!!
    }else{
        NSLog(@"登录失败!!");
    }
    
    
}


@end
