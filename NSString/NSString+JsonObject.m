//
//  NSString+JsonObject.m
//  赋值操作
//
//  Created by 杜文亮 on 2017/12/25.
//  Copyright © 2017年 CompanyName（公司名）. All rights reserved.
//

#import "NSString+JsonObject.h"

@implementation NSString (JsonObject)

+(NSString *)jsonStringWithObject:(id)object
{
    NSString *jsonString = nil;
    if (object)
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
        if (!jsonData)
        {
            NSLog(@"序列化 Get an error: %@", error);
        }
        else
        {
            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
    }
    else
    {
        NSLog(@"传入的OC对象为空！");
    }
    return jsonString;
}

@end
