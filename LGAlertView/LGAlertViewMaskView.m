//
//  LGAlertViewMaskView.m
//  LGAlertViewDemo
//
//  Created by Grigory Lutkov on 26/04/17.
//  Copyright © 2017 Grigory Lutkov. All rights reserved.
//

#import "LGAlertViewMaskView.h"

@implementation LGAlertViewMaskView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//
//    CGRect frame = self.bounds;
//
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:0.0];
//
//    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(frame, 40.0, 40.0) cornerRadius:0.0];
//
//    [path appendPath:borderPath];
//    path.usesEvenOddFillRule = YES;
//
//    CAShapeLayer *maskLayer = [CAShapeLayer new];
//    maskLayer.path = path.CGPath;
//    maskLayer.fillRule = kCAFillRuleEvenOdd;
//
//    CAShapeLayer *borderLayer = [CAShapeLayer new];
//    borderLayer.path = borderPath.CGPath;
//    borderLayer.fillColor = UIColor.clearColor.CGColor;
//    borderLayer.fillRule = kCAFillRuleEvenOdd;
//
//    self.layer.mask = maskLayer;
//}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    CGRect drawRect = CGRectInset(rect, 40.0, 40.0);

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:drawRect cornerRadius:0.0];
    [path closePath];

    [UIColor.blackColor setFill];
    [path fill];
}

@end
