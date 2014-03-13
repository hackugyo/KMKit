//
//  UIColor+KMKit.m
//  KMKit
//
//  Created by Kosuke Matsuda on 2014/03/13.
//  Copyright (c) 2014年 matsuda. All rights reserved.
//

#import "UIColor+KMKit.h"

@implementation UIColor (KMKit)

+ (UIColor *)colorWithHex:(uint32_t)hex
{
    CGFloat red = ((hex & 0xff000000) >> 24) / 255.0f;
    CGFloat green = ((hex & 0x00ff0000) >> 16) / 255.0f;
    CGFloat blue = ((hex & 0x0000ff00) >> 8) / 255.0f;
    CGFloat alpha = (hex & 0x000000ff) / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString*)string
{
    uint32_t hex = 0x0;
    NSScanner* scanner = [NSScanner scannerWithString:string];
    [scanner scanHexInt:&hex];
    return [UIColor colorWithHex:hex];
}

+ (instancetype)ios7BlueColor
{
    return [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
}

@end
