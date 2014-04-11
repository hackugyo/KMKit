//
//  NSArray+KMKit.h
//  Pods
//
//  Created by Kosuke Matsuda on 2014/04/11.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (KMKit)

- (NSString *)km_join:(NSString *)separator;
- (NSArray *)km_mapUsingBlock:(id (^)(id obj))block;

@end
