//
//  WLLabel.m
//  CAShapeLayerDemo
//
//  Created by Mac on 2019/7/19.
//  Copyright © 2019 杜文亮. All rights reserved.
//

#import "WLLabel.h"


@interface WLLabel () {
    WLTextAlignmentType _alignmentType;
}
@end


@implementation WLLabel

- (instancetype)initWithFrame:(CGRect)frame textAlignmentType:(WLTextAlignmentType)alignmentType {
    if (self = [super initWithFrame:frame]) {
        _alignmentType = alignmentType;
    }
    return self;
}

//bounds就是label的bounds，rect是label中文字的rect。关系就像大矩形（bounds）内部有个小矩形(rect)
//- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
//    CGRect rect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
//
//    CGFloat dHeight = CGRectGetHeight(bounds) - CGRectGetHeight(rect);
//    CGFloat dWidth = CGRectGetWidth(bounds) - CGRectGetWidth(rect);
//    switch(_alignmentType) {
//        case WLTextAlignmentTypeTopCenter: {
//            rect.origin = CGPointMake(dWidth/2, bounds.origin.y);
//        }
//            break;
//        case WLTextAlignmentTypeLeft: {
//            rect.origin = CGPointMake(0, dHeight/2);
//        }
//            break;
//        case WLTextAlignmentTypeBottomCenter: {
//            //这句更直观的看出位置关系，但是bounds的origin是（0，0），所以可以直接用下面这句代替
////            rect.origin = CGPointMake(dWidth/2, CGRectGetMaxY(bounds) - rect.size.height);
//            rect.origin = CGPointMake(dWidth/2, dHeight);
//        }
//            break;
//        case WLTextAlignmentTypeRight: {
////            rect.origin = CGPointMake(CGRectGetMaxX(bounds) - rect.size.width, dHeight/2);
//            rect.origin = CGPointMake(dWidth, dHeight/2);
//        }
//            break;
//        case WLTextAlignmentTypeCenter: {
//            rect.origin = CGPointMake(dWidth/2, dHeight/2);
//        }
//            break;
//        case WLTextAlignmentTypeLeftTop: {
//            rect.origin = bounds.origin;
//        }
//            break;
//        case WLTextAlignmentTypeRightTop: {
////            rect.origin = CGPointMake(CGRectGetMaxX(bounds) - rect.size.width, bounds.origin.y);
//            rect.origin = CGPointMake(dWidth, bounds.origin.y);
//        }
//            break;
//        case WLTextAlignmentTypeLeftBottom: {
////            rect.origin = CGPointMake(bounds.origin.x, CGRectGetMaxY(bounds) - rect.size.height);
//            rect.origin = CGPointMake(bounds.origin.x, dHeight);
//        }
//            break;
//        case WLTextAlignmentTypeRightBottom: {
////            rect.origin = CGPointMake(CGRectGetMaxX(bounds) - rect.size.width, CGRectGetMaxY(bounds) - rect.size.height);
//            rect.origin = CGPointMake(dWidth, dHeight);
//        }
//            break;
//        default:
//            break;
//    }
//    return rect;
//}

/*
 *  NS_OPTIONS封装起来比NS_ENUM简洁太多，但是使用时需要注意:
 *      1，枚举是为了增加代码易读性，因此避免下面两种情况
 *          1.1，比如（WLTextAlignmentTypeTop | WLTextAlignmentTypeBottom）虽然有值，但是无实际意义。
 *          1.2，比如单独使用 WLTextAlignmentTypeTop 就能达到（WLTextAlignmentTypeTop | WLTextAlignmentTypeLeft）的效果，那是因为rect.origin默认是（0，0）。不建议这样使用
 *      2，比如外界传参是（WLTextAlignmentTypeRight | WLTextAlignmentTypeCenter），即_alignmentType = （WLTextAlignmentTypeRight | WLTextAlignmentTypeCenter），此时需要注意代码顺序，只能将condition1写在最前面，才能满足我们的需要。若写在最后，那么无论怎么组合，只要参数里有WLTextAlignmentTypeCenter，最终结果只能是WLTextAlignmentTypeCenter这一种
 */
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect rect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    
    CGFloat dHeight = CGRectGetHeight(bounds) - CGRectGetHeight(rect);
    CGFloat dWidth = CGRectGetWidth(bounds) - CGRectGetWidth(rect);
    
    if (_alignmentType & WLTextAlignmentTypeCenter) { //condition1
        rect.origin = CGPointMake(dWidth/2, dHeight/2);
    }
    if (_alignmentType & WLTextAlignmentTypeTop) {
        rect.origin.y = bounds.origin.y;
    }
    if (_alignmentType & WLTextAlignmentTypeLeft) {
        rect.origin.x = bounds.origin.x;
    }
    if (_alignmentType & WLTextAlignmentTypeBottom) {
        rect.origin.y = dHeight;
    }
    if (_alignmentType & WLTextAlignmentTypeRight) {
        rect.origin.x = dWidth;
    }
    
    return rect;
}

- (void)drawTextInRect:(CGRect)rect {
    CGRect textRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    
    [super drawTextInRect:textRect];
}


@end
