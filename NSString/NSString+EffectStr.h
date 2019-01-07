//
//  NSString+EffectStr.h
//  BookReader
//
//  Created by 杜文亮 on 2018/3/23.
//  Copyright © 2018年 心动文学. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSString (EffectStr)

//判断字符串是否为nil或@“”
+(BOOL)isEffectStr:(NSString *)string;

//手机号有效监测
+(BOOL)isMobileNumber:(NSString *)mobileNum;

//邮箱号有效监测
+(BOOL)isValidateEmail:(NSString *)email;

//去除字符串“开头”和“结尾”的空格（@“ ”）和换行符（\n）。注意只是开头和结尾，中间的不管
//1：自己手动实现
+(NSString *)deleteSpace:(NSString *)string;
//2：系统快捷方法
+(NSString *)removeSpaceAndNewline:(NSString *)str;

//是否包含中文
+(BOOL)isChinese:(NSString *)string;

//将字典参数用&拼接方便进行get请求测试
+(NSString *)getParametersWithDict:(NSDictionary *)dict;

@end
