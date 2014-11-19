//
//  NSHTTPCookieStorage+KMKit.m
//  KMKit
//
//  Created by Kosuke Matsuda on 2014/03/13.
//  Copyright (c) 2014年 matsuda. All rights reserved.
//

#import "NSHTTPCookieStorage+KMKit.h"

@implementation NSHTTPCookieStorage (KMKit)

- (void)clearWithDomain:(NSString *)domain
{
    NSArray *cookies = [self cookies];
    NSEnumerator *enumerator = [cookies objectEnumerator];
    for (NSHTTPCookie *cookie in enumerator) {
        NSDictionary *properties = [cookie properties];
        NSString *cookieDomain = [properties objectForKey:NSHTTPCookieDomain];
        NSRange match = [cookieDomain rangeOfString:domain];
        if (cookieDomain && match.location != NSNotFound) {
            [properties setValue:[NSDate dateWithTimeIntervalSinceNow:-3600] forKey:NSHTTPCookieExpires];
            NSHTTPCookie *newCookie = [[NSHTTPCookie alloc] initWithProperties:properties];
            [self deleteCookie:cookie];
            [self setCookie:newCookie];
        }
    }
}

- (BOOL)storeCookieToUserDefaultsForKey:(NSString *)key
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:[self archivedData] forKey:key];
    return [ud synchronize];
}

- (void)loadCookieFromUserDefaultsForKey:(NSString *)key
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *data = [ud objectForKey:key];
    [self unarchiveWithData:data];
}

- (NSData *)archivedData
{
    return [NSKeyedArchiver archivedDataWithRootObject:[self cookies]];
}

- (void)unarchiveWithData:(NSData *)data
{
    if (!data) return;
    id cookies = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSEnumerator *enumerator = [cookies objectEnumerator];
    for (NSHTTPCookie *cookie in enumerator) {
        [self setCookie:cookie];
    }
}

@end
