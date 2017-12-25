//
//  NSDictionary+JsonString.m
//  赋值操作
//
//  Created by 杜文亮 on 2017/12/25.
//  Copyright © 2017年 CompanyName（公司名）. All rights reserved.
//

#import "NSDictionary+JsonString.h"

@implementation NSDictionary (JsonString)

+(NSDictionary *)dictionaryWithJsonString:(NSString *)JSONString;
{
    NSDictionary *responseJSON = nil;
    if (JSONString)
    {
        NSError *error;
        NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
        responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:&error];
        if (!responseJSON)
        {
            NSLog(@"反序列化 Get an error: %@", error);
        }
    }
    else
    {
        NSLog(@"传入的JsonString为空！");
    }
    return responseJSON;
}

@end
