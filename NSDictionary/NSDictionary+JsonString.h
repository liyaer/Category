//
//  NSDictionary+JsonString.h
//  赋值操作
//
//  Created by 杜文亮 on 2017/12/25.
//  Copyright © 2017年 CompanyName（公司名）. All rights reserved.
//


/**
 *  将Json格式的字符串转化为OC对象（字典或数组）(也叫Json反序列化)
 **/
#import <Foundation/Foundation.h>

@interface NSDictionary (JsonString)

+(NSDictionary *)dictionaryWithJsonString:(NSString *)JSONString;

@end
