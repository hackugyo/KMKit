//
//  NSString+KMKit.h
//  Pods
//
//  Created by Kosuke Matsuda on 2014/03/19.
//
//

#import <Foundation/Foundation.h>

@interface NSString (KMKit)

// URI encode
- (NSString *)km_encodeURIComponent;
- (NSString *)km_decodeURIComponent;

@end
