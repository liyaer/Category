//
//  UIImage+StretchableImage.h
//  3DTouchDemo
//
//  Created by 杜文亮 on 2017/10/20.
//  Copyright © 2017年 杜文亮. All rights reserved.
//


/*
 *   拉伸图片
 */
#import <UIKit/UIKit.h>

@interface UIImage (StretchableImage)

//方法一(iOS5之前使用的方法)
+ (instancetype)imageWithStretchableName:(NSString *)imageName;

//方法二（iOS5之后新增的方法）
+ (instancetype)imageWithResizableName:(NSString *)imageName operateArea:(UIEdgeInsets)edge;

@end

