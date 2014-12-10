//
//  UIView+KMAutoLayout.m
//  KMKit
//
//  Created by Kosuke Matsuda on 2014/12/01.
//  Copyright (c) 2014年 Appirits. All rights reserved.
//

#import "UIView+KMAutoLayout.h"

@implementation UIView (KMAutoLayout)

- (void)km_addConstraintAllAxisFixedEdgeOfParent
{
    [self km_addConstraintHorizontalFixedEdgeOfParent];
    [self km_addConstraintVertialFixedEdgeOfParent];
}

- (void)km_addConstraintHorizontalFixedEdgeOfParent
{
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|"
                                             options:0
                                             metrics:nil
                                               views:@{@"view": self}]];
}

- (void)km_addConstraintVertialFixedEdgeOfParent
{
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|"
                                             options:0
                                             metrics:nil
                                               views:@{@"view": self}]];
}

- (void)km_addConstraintLeadingFixedEdgeOfParent
{
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]"
                                             options:0
                                             metrics:nil
                                               views:@{@"view": self}]];
}

- (void)km_addConstraintTrailingFixedEdgeOfParent
{
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]|"
                                             options:0
                                             metrics:nil
                                               views:@{@"view": self}]];
}

- (void)km_addConstraintTopFixedEdgeOfParent
{
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]"
                                             options:0
                                             metrics:nil
                                               views:@{@"view": self}]];
}

- (void)km_addConstraintBottomFixedEdgeOfParent
{
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]|"
                                             options:0
                                             metrics:nil
                                               views:@{@"view": self}]];
}

- (NSLayoutConstraint *)km_constraintLeadingFixedEdgeOfParent
{
    return [self km_constraintLeadingEdgeOfParent:0.f];
}

- (NSLayoutConstraint *)km_constraintTrailingFixedEdgeOfParent
{
    return [self km_constraintTrailingEdgeOfParent:0.f];
}

- (NSLayoutConstraint *)km_constraintTopFixedEdgeOfParent
{
    return [self km_constraintTopEdgeOfParent:0.f];
}

- (NSLayoutConstraint *)km_constraintBottomFixedEdgeOfParent
{
    return [self km_constraintBottomEdgeOfParent:0.f];
}

- (void)km_addConstraintLeadingEdgeOfParent:(CGFloat)constant
{
    [self.superview addConstraint:[self km_constraintLeadingEdgeOfParent:constant]];
}

- (void)km_addConstraintTrailingEdgeOfParent:(CGFloat)constant
{
    [self.superview addConstraint:[self km_constraintTrailingEdgeOfParent:constant]];
}

- (void)km_addConstraintTopEdgeOfParent:(CGFloat)constant
{
    [self.superview addConstraint:[self km_constraintTopEdgeOfParent:constant]];
}

- (void)km_addConstraintBottomEdgeOfParent:(CGFloat)constant
{
    [self.superview addConstraint:[self km_constraintBottomEdgeOfParent:constant]];
}

- (NSLayoutConstraint *)km_constraintLeadingEdgeOfParent:(CGFloat)constant
{
    return [self km_constraintPosition:NSLayoutAttributeLeading edgeOfParent:constant];
}

- (NSLayoutConstraint *)km_constraintTrailingEdgeOfParent:(CGFloat)constant
{
    return [self km_constraintPosition:NSLayoutAttributeTrailing edgeOfParent:constant];
}

- (NSLayoutConstraint *)km_constraintTopEdgeOfParent:(CGFloat)constant
{
    return [self km_constraintPosition:NSLayoutAttributeTop edgeOfParent:constant];
}

- (NSLayoutConstraint *)km_constraintBottomEdgeOfParent:(CGFloat)constant
{
    return [self km_constraintPosition:NSLayoutAttributeBottom edgeOfParent:constant];
}

/**
 * private
 */
- (NSLayoutConstraint *)km_constraintPosition:(NSLayoutAttribute)attribute edgeOfParent:(CGFloat)constant
{
    return [NSLayoutConstraint constraintWithItem:self.superview
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self
                                        attribute:attribute
                                       multiplier:1.f constant:constant];
}

- (void)km_addConstraintWidth:(CGFloat)constant
{
    [self addConstraint:[self km_constraintWidth:constant]];
    /*
    [self addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(width)]"
                                             options:0
                                             metrics:@{@"width": @(constant)}
                                               views:@{@"view": self}]];
     */
}

- (void)km_addConstraintHeight:(CGFloat)constant
{
    [self addConstraint:[self km_constraintHeight:constant]];
    /*
    [self addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(height)]"
                                             options:0
                                             metrics:@{@"height": @(constant)}
                                               views:@{@"view": self}]];
     */
}

- (NSLayoutConstraint *)km_constraintWidth:(CGFloat)constant
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.f constant:constant];
}

- (NSLayoutConstraint *)km_constraintHeight:(CGFloat)constant
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.f constant:constant];
}

- (void)km_addConstraintHorizontalCenter
{
    [self.superview addConstraint:
     [NSLayoutConstraint constraintWithItem:self
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.superview
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1.f constant:0.f]];
}

- (void)km_addConstraintVerticalCenter
{
    [self.superview addConstraint:
     [NSLayoutConstraint constraintWithItem:self
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.superview
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.f constant:0.f]];
}

@end
