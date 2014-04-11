//
//  NSArray+KMKit.m
//  Pods
//
//  Created by Kosuke Matsuda on 2014/04/11.
//
//

#import "NSArray+KMKit.h"

@implementation NSArray (KMKit)

- (NSString *)km_join:(NSString *)separator {
    return [self componentsJoinedByString:separator];
}

- (NSArray *)km_mapUsingBlock:(id (^)(id))block
{
    NSMutableArray *newArray = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id item, NSUInteger idx, BOOL *stop){
        id obj = block(item);
        [newArray addObject:obj];
    }];
    return newArray;
}

@end
