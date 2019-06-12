//
//  NSString+EffectStr.m
//  BookReader
//
//  Created by 杜文亮 on 2018/3/23.
//  Copyright © 2018年 心动文学. All rights reserved.
//

#import "NSString+EffectStr.h"

@implementation NSString (EffectStr)

//判断字符串是否为nil或@“”
+(BOOL)isEffectStr:(NSString *)string
{
    if (string && string.length != 0)
    {
        return YES;
    }
    return NO;
}

// 正则判断手机号码地址格式
+(BOOL)isMobileNumber:(NSString *)mobileNum
{
    //    电信号段:133/153/180/181/189/177
    //    联通号段:130/131/132/155/156/185/186/145/176
    //    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
    //    虚拟运营商:170
    
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    return [regextestmobile evaluateWithObject:mobileNum];
}

// 正则判断邮箱号是否有效
+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}

//判断是否有中文
+(BOOL)isChinese:(NSString *)string
{
    for(int i=0; i< [string length];i++)
    {
        int a = [string characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}

//去除字符串“开头”和“结尾”的空格（@“ ”）和换行符（\n）。注意只是开头和结尾，中间的不管
//1：自己手动实现
+(NSString *)deleteSpace:(NSString *)string
{
    //头
    for(int i = 0; i < [string length]; i++)
    {
        if ([string hasPrefix:@" "] || [string hasPrefix:@"\n"]){
            string = [string substringWithRange:NSMakeRange(1, string.length -1)];
        }else{
            break;
        }
    }
    //尾
    for(int i = 0; i < [string length]; i++)
    {
        if ([string hasSuffix:@" "] || [string hasSuffix:@"\n"]){
            string = [string substringWithRange:NSMakeRange(0, string.length -1)];
        }else{
            break;
        }
    }
    
//    //检查结果（方便调试，可注释掉）
//    NSString *temp = nil;
//    for(int i =0; i < [string length]; i++)
//    {
//        temp = [string substringWithRange:NSMakeRange(i, 1)];
//        NSLog(@"第%d个字是:%@",i,temp);
//    }

    return string;
}

//2：系统快捷方法
+(NSString *)removeSpaceAndNewline:(NSString *)str
{
    NSString *temp = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *text = [temp stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return text;
}

//生成Get请求方式的完整URL（仅对一级字典结构起作用）
+ (NSString *)generateGETAbsoluteURL:(NSString *)url params:(NSDictionary *)params
{
    NSString *queries = @"";
    
    //参数合法性检查
    if ([url isKindOfClass:[NSString class]] && ([url hasPrefix:@"http://"] || [url hasPrefix:@"https://"]))
    {
        if ([params isKindOfClass:[NSDictionary class]] && [params count] != 0)
        {
            //字典key、value拼接
            for (NSString *key in params)
            {
                id value = [params objectForKey:key];
                
                if ([value isKindOfClass:[NSDictionary class]]) {
                    continue;
                } else if ([value isKindOfClass:[NSArray class]]) {
                    continue;
                } else if ([value isKindOfClass:[NSSet class]]) {
                    continue;
                } else {
                    queries = [NSString stringWithFormat:@"%@%@=%@&",/* (queries.length == 0 ? @"&" : queries) */queries,key,value];
                }
            }
            //去掉最后的&(实际测试，开头和结尾有&也不影响，但是为了标准，还是都去掉，上面局部注释是去除开头&)
            if (queries.length > 1) {
                queries = [queries substringToIndex:queries.length - 1];
            }
            
            //和URL拼接
            if (queries.length > 1)
            {
                if ([url rangeOfString:@"?"].location != NSNotFound || [url rangeOfString:@"#"].location != NSNotFound){
                    url = [NSString stringWithFormat:@"%@%@", url, queries];
                } else {
                    url = [NSString stringWithFormat:@"%@?%@", url, queries];
                }
            }
        }
    }
    
    return queries.length == 0 ? queries : url;
}

@end
