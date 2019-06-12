//
//  NSString+MD5.h
//  BookReader
//
//  Created by 杜文亮 on 2018/4/4.
//  Copyright © 2018年 心动文学. All rights reserved.
//

#import <Foundation/Foundation.h>


//加密结果的格式
typedef NS_ENUM(NSInteger, WLmd5ResultFormat)
{
    WLLower16Bate,      //16位小写字母
    WLUpper16Bate,      //...大.....
    WLLower32Bate,
    WLUpper32Bate
};

//加密级别(也可以几种混合调用，大幅增加解密难度)
typedef NS_ENUM(NSUInteger, WLmd5EncryptionLevel)
{
    WLmd5,               //一次加密
    WLmd5Salt,           //加盐
    WLmd5ManyTimes,      //多次加密
    WLmd5Disorder        //一次加密后乱序
};


@interface NSString (MD5)

/**  --- DWL ---
 *   方法说明 : MD5加密
 *   @parem string : 待加密的字符串
 *   @parem resultFormat : 加密结果的格式
 *   @parem level : 加密级别
 *   @return NSString : 返回MD5加密后的字符串
 */
+(NSString *)md5StrWithString:(NSString *)string resultFormat:(WLmd5ResultFormat)resultFormat encryptionLevel:(WLmd5EncryptionLevel)level;

@end
