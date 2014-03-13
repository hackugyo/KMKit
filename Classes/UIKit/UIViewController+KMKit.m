//
//  UIViewController+KMKit.m
//  KMKit
//
//  Created by Kosuke Matsuda on 2014/03/13.
//  Copyright (c) 2014年 matsuda. All rights reserved.
//

#import "UIViewController+KMKit.h"

@implementation UIViewController (KMKit)

- (BOOL)isMoveToFrontViewController
{
    return ([self isMovingFromParentViewController] ||
            [self isBeingDismissed] ||
            [self.parentViewController isBeingDismissed]);
}

#pragma mark - KeyboardNotification

- (void)addKeyboardNotificationObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)removeKeyboardNotificationObservers
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}
- (void)keyboardWillHide:(NSNotification *)notification
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

@end
