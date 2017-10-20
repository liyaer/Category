//
//  UIImage+StretchableImage.m
//  3DTouchDemo
//
//  Created by 杜文亮 on 2017/10/20.
//  Copyright © 2017年 杜文亮. All rights reserved.
//

#import "UIImage+StretchableImage.h"

@implementation UIImage (StretchableImage)

//方法一(实测：必须center点才能实现效果)
+ (instancetype)imageWithStretchableName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}

/*                              stretchableImageWithLeftCapWidth
 *   这个函数是UIImage的一个实例函数，它的功能是创建一个内容可拉伸，而边角不拉伸的图片，需要两个参数，第一个是左边不拉伸区域的宽度，第二个参数是上面不拉伸的高度。
 
     根据设置的宽度和高度，将接下来的一个像素进行左右扩展和上下拉伸。
 
     注意：可拉伸的范围都是距离leftCapWidth后的1竖排像素，和距离topCapHeight后的1横排像素。
 
     参数的意义是，如果参数指定10，5。那么，图片左边10个像素，上边5个像素。不会被拉伸，x坐标为11和一个像素会被横向复制，y坐标为6的一个像素会被纵向复制。
 
     注意：只是对一个像素（11，6）进行复制到一定宽度。而图像后面的剩余像素也不会被拉伸。
 */




//方法二
+ (instancetype)imageWithResizableName:(NSString *)imageName operateArea:(UIEdgeInsets)edge
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image resizableImageWithCapInsets:edge];
//    return [image resizableImageWithCapInsets:edge resizingMode:<#(UIImageResizingMode)#>];
}
/*
 *   resizableImageWithCapInsets只对指定的UIEdgeInset进行拉伸或者压缩
 */

@end
