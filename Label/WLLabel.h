//
//  WLLabel.h
//  CAShapeLayerDemo
//
//  Created by Mac on 2019/7/19.
//  Copyright © 2019 杜文亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


//typedef NS_ENUM(NSInteger, WLTextAlignmentType) {
//    WLTextAlignmentTypeTopCenter,
//    WLTextAlignmentTypeLeft,
//    WLTextAlignmentTypeBottomCenter,
//    WLTextAlignmentTypeRight,
//    WLTextAlignmentTypeCenter,
//    WLTextAlignmentTypeLeftTop,
//    WLTextAlignmentTypeRightTop,
//    WLTextAlignmentTypeLeftBottom,
//    WLTextAlignmentTypeRightBottom,
//};

/*
 *  方向性枚举，有意义的值是：
 *                      center
 *                      top | center
 *                      left | center
 *                      bottom | center
 *                      right | center
 *                      top | left
 *                      top | right
 *                      bottom | left
 *                      bottom | right
 */
typedef NS_OPTIONS(NSInteger, WLTextAlignmentType) {
    WLTextAlignmentTypeTop        = 1 << 0,//上
    WLTextAlignmentTypeLeft       = 1 << 1,//左
    WLTextAlignmentTypeBottom     = 1 << 2,//下
    WLTextAlignmentTypeRight      = 1 << 3,//右
    WLTextAlignmentTypeCenter     = 1 << 4,//中间
};


@interface WLLabel : UILabel

- (instancetype)initWithFrame:(CGRect)frame textAlignmentType:(WLTextAlignmentType)alignmentType;

@end

NS_ASSUME_NONNULL_END
