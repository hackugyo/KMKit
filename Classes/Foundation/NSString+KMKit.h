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

- (BOOL)km_isPresent;
- (BOOL)km_isNumeric;

- (NSDictionary *)km_parsedQueryString;
/**
 http://nshipster.com/nscharacterset/
 */
- (NSString *)km_stringByCollapsingStrippedWhitespacing;

@end
