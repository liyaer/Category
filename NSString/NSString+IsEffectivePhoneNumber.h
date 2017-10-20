//
//  NSString+IsEffectivePhoneNumber.h
//  LHNewReader
//
//  Created by pro on 17/3/29.
//  Copyright © 2017年 Su Lei Han. All rights reserved.
//


/*
 *   类别：判断手机号和邮箱号格式是否合法
 */

#import <Foundation/Foundation.h>

@interface NSString (IsEffectivePhoneNumber)

//手机号有效监测
+(BOOL)isMobileNumber:(NSString *)mobileNum;

//邮箱号有效监测
+(BOOL)isValidateEmail:(NSString *)email;

@end
