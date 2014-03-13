//
//  UIColor+KMKit.h
//  KMKit
//
//  Created by Kosuke Matsuda on 2014/03/13.
//  Copyright (c) 2014年 matsuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KMKit)

/**
 http://qiita.com/moriturus/items/67a94cf101a8c0be57c7
 */

/*!
 @method colorWithHex:
 @abstract 16進数リテラル整数からUIColorを生成する
 @param hex 16進数リテラル整数
 @return UIColorインスタンス
 */
+ (instancetype)colorWithHex:(uint32_t)hex;

/*!
 @method colorWithHexString:
 @abstract 16進数形式で書かれた文字列からUIColorを生成する
 @param string 16進数形式で書かれた文字列
 @return UIColorインスタンス
 */
+ (instancetype)colorWithHexString:(NSString*)string;

+ (instancetype)ios7BlueColor;

@end
