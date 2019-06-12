//
//  NSString+MD5.m
//  BookReader
//
//  Created by 杜文亮 on 2018/4/4.
//  Copyright © 2018年 心动文学. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>


static NSString *Salt = @"nha735n197nxn(N′568GGS%d~~9naei';45vhhafdjkv]32rpks;lg,];:vjo(&**&^)";


@implementation NSString (MD5)

+(NSString *)md5StrWithString:(NSString *)string resultFormat:(WLmd5ResultFormat)resultFormat encryptionLevel:(WLmd5EncryptionLevel)level
{
    if (![string isKindOfClass:[NSString class]] || string.length == 0) {
        return nil;
    }
    
    switch (level)
    {
        case WLmd5:
            return [self MD5ForString:string resultFormat:resultFormat];
            break;
        case WLmd5Salt:
            return [self MD5AddSaltWithString:string resultFormat:resultFormat];
            break;
        case WLmd5ManyTimes:
            return [self MD5ManyTimesWithString:string resultFormat:resultFormat];
            break;
        default:
            return [self MD5DisorderWithString:string resultFormat:resultFormat];
            break;
    }
}

#pragma mark - Dmd5（MD5的基本加密）

+(NSString *)MD5ForString:(NSString *)str resultFormat:(WLmd5ResultFormat)resultFormat
{
    //进行UTF8的转码，生成MD5,结果存在C类型的result数组中
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    //拼接成32位字符串
    NSMutableString *digest32 = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        switch (resultFormat)
        {
            case WLLower32Bate: case WLLower16Bate:
                [digest32 appendFormat:@"%02x", result[i]];
                break;
            case WLUpper32Bate: case WLUpper16Bate:
                [digest32 appendFormat:@"%02X", result[i]];
                break;
            default:
                break;
        }
    }
    
    switch (resultFormat)
    {
        case WLLower16Bate: case WLUpper16Bate:
            return [digest32 substringWithRange:NSMakeRange(8, 16)];
            break;
        default:
            return digest32;
            break;
    }
}

#pragma mark - Dmd5Salt（加盐）

+(NSString *)MD5AddSaltWithString:(NSString *)string resultFormat:(WLmd5ResultFormat)resultFormat
{
    return [self MD5ForString:[string stringByAppendingString:Salt] resultFormat:resultFormat];
}

#pragma mark - Dmd5ManyTime（多次加密）

+(NSString *)MD5ManyTimesWithString:(NSString *)string resultFormat:(WLmd5ResultFormat)resultFormat
{
    for (int i = 0; i < 3; i++)
    {
        string = [self MD5ForString:string resultFormat:resultFormat];
//        NSLog(@"%d : %@",i,string);
    }
    return string;
}

#pragma mark - Dmd5Disorder（一次加密后乱序）

+(NSString *)MD5DisorderWithString:(NSString *)string resultFormat:(WLmd5ResultFormat)resultFormat
{
    string = [self MD5ForString:string resultFormat:resultFormat];
    //这里写个简单的乱序，可以自己设计复杂的乱序算法，增加解密难度
    NSString *header = [string substringToIndex:3];
    NSString *footer = [string substringFromIndex:3];
    string = [footer stringByAppendingString:header];
    return string;
}


@end
