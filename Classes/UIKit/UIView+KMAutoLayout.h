//
//  UIView+KMAutoLayout.h
//  KMKit
//
//  Created by Kosuke Matsuda on 2014/12/01.
//  Copyright (c) 2014年 Appirits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KMAutoLayout)

/**
 H:|-[view]-|
 V:|-[view]-|
 */
- (void)km_addConstraintAllAxisFixedEdgeOfParent;
/**
 H:|-[view]-|
 */
- (void)km_addConstraintHorizontalFixedEdgeOfParent;
/**
 V:|-[view]-|
 */
- (void)km_addConstraintVertialFixedEdgeOfParent;
/**
 H:|-[view]
 */
- (void)km_addConstraintLeadingFixedEdgeOfParent;
/**
 H:[view]-|
 */
- (void)km_addConstraintTrailingFixedEdgeOfParent;
/**
 V:|-[view]
 */
- (void)km_addConstraintTopFixedEdgeOfParent;
/**
 V:[view]-|
 */
- (void)km_addConstraintBottomFixedEdgeOfParent;

/**
 H:|-[view]
 */
- (NSLayoutConstraint *)km_constraintLeadingFixedEdgeOfParent;
/**
 H:[view]-|
 */
- (NSLayoutConstraint *)km_constraintTrailingFixedEdgeOfParent;
/**
 V:|-[view]
 */
- (NSLayoutConstraint *)km_constraintTopFixedEdgeOfParent;
/**
 V:[view]-|
 */
- (NSLayoutConstraint *)km_constraintBottomFixedEdgeOfParent;

/**
 H:|-constant-[view]
 */
- (void)km_addConstraintLeadingEdgeOfParent:(CGFloat)constant;
/**
 H:[view]-constant-|
 */
- (void)km_addConstraintTrailingEdgeOfParent:(CGFloat)constant;
/**
 V:|-constant-[view]
 */
- (void)km_addConstraintTopEdgeOfParent:(CGFloat)constant;
/**
 V:[view]-constant-|
 */
- (void)km_addConstraintBottomEdgeOfParent:(CGFloat)constant;

/**
 H:|-constant-[view]
 */
- (NSLayoutConstraint *)km_constraintLeadingEdgeOfParent:(CGFloat)constant;
/**
 H:[view]-constant-|
 */
- (NSLayoutConstraint *)km_constraintTrailingEdgeOfParent:(CGFloat)constant;
/**
 V:|-constant-[view]
 */
- (NSLayoutConstraint *)km_constraintTopEdgeOfParent:(CGFloat)constant;
/**
 V:[view]-constant-|
 */
- (NSLayoutConstraint *)km_constraintBottomEdgeOfParent:(CGFloat)constant;

/**
 H:[view(constant)]
 */
- (void)km_addConstraintWidth:(CGFloat)constant;
/**
 V:[view(constant)]
 */
- (void)km_addConstraintHeight:(CGFloat)constant;

/**
 H:[view(constant)]
 */
- (NSLayoutConstraint *)km_constraintWidth:(CGFloat)constant;
/**
 V:[view(constant)]
 */
- (NSLayoutConstraint *)km_constraintHeight:(CGFloat)constant;

/**
 horizontal centering
 */
- (void)km_addConstraintHorizontalCenter;
/**
 vertical centering
 */
- (void)km_addConstraintVerticalCenter;

@end
