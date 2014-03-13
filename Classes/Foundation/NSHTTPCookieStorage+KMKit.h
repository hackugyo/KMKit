//
//  NSHTTPCookieStorage+KMKit.h
//  KMKit
//
//  Created by Kosuke Matsuda on 2014/03/13.
//  Copyright (c) 2014年 matsuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSHTTPCookieStorage (KMKit)

/**
 http://tech-gym.com/2011/10/objective-c/506.html
 http://d.hatena.ne.jp/mmasashi/20101202/1292763345
 */
- (void)clearWithDomain:(NSString *)domain;

- (BOOL)storeCookieToUserDefaultsForKey:(NSString *)key;
- (void)loadCookieFromUserDefaultsForKey:(NSString *)key;

- (NSData *)archivedData;
- (void)unarchiveWithData:(NSData *)data;

@end
