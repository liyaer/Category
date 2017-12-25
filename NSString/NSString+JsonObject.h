//
//  NSString+JsonObject.h
//  赋值操作
//
//  Created by 杜文亮 on 2017/12/25.
//  Copyright © 2017年 CompanyName（公司名）. All rights reserved.
//


/**
 *  将OC对象(字典或者数组)   转化为   Json格式的字符串（也叫Json序列化）
 **/
#import <Foundation/Foundation.h>

@interface NSString (JsonObject)

+(NSString *)jsonStringWithObject:(id)object;

@end
