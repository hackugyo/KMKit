//
//  UIViewController+KMKit.h
//  KMKit
//
//  Created by Kosuke Matsuda on 2014/03/13.
//  Copyright (c) 2014年 matsuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KMKit)

/**
 ナビゲーションプッシュ時の閉じるボタン、
 もしくはモーダル時の閉じるボタンを押下されたかどうか
 */
- (BOOL)isMoveToFrontViewController;

// UIKeyboardNotification
- (void)addKeyboardNotificationObservers;
- (void)removeKeyboardNotificationObservers;

@end
