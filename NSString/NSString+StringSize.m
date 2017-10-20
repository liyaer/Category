//
//  NSString+StringSize.m
//  LHNewReader
//
//  Created by pro on 17/4/11.
//  Copyright © 2017年 Su Lei Han. All rights reserved.
//

#import "NSString+StringSize.h"

@implementation NSString (StringSize)

+(CGSize)boundingRectWithSize:(CGSize)size Font:(UIFont *)font text:(NSString *)text
{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    
    CGSize retSize = [text boundingRectWithSize:size
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize;
}

@end
