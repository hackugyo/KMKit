//
//  NSString+KMKit.m
//  Pods
//
//  Created by Kosuke Matsuda on 2014/03/19.
//
//

#import "NSString+KMKit.h"

@implementation NSString (KMKit)

- (NSString *)km_encodeURIComponent
{
    static NSString * const kLegalCharactersToBeEscaped = @"!*'();:@&=+$,/?%#[]";
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (__bridge CFStringRef)self,
                                                                                 NULL,
                                                                                 (__bridge CFStringRef)kLegalCharactersToBeEscaped,
                                                                                 kCFStringEncodingUTF8);
}

- (NSString *)km_decodeURIComponent
{
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                                 (__bridge CFStringRef)self,
                                                                                                 CFSTR(""),
                                                                                                 kCFStringEncodingUTF8);
}

- (BOOL)km_isPresent
{
    static NSString *pattern = @"\\S+?";
    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                            options:NSRegularExpressionAnchorsMatchLines
                                                                              error:nil];
    NSTextCheckingResult *match = [regexp firstMatchInString:self options:0
                                                       range:NSMakeRange(0, self.length)];
    return match != nil;
}

- (BOOL)km_isNumeric
{
    static NSString *pattern = @"^\\d+?$";
    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                            options:NSRegularExpressionAnchorsMatchLines
                                                                              error:nil];
    NSTextCheckingResult *match = [regexp firstMatchInString:self options:0
                                                       range:NSMakeRange(0, self.length)];
    return match != nil;
}

@end
