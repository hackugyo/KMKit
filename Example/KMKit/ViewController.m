//
//  ViewController.m
//  KMKit
//
//  Created by Kosuke Matsuda on 2014/03/13.
//  Copyright (c) 2014年 matsuda. All rights reserved.
//

#import "ViewController.h"
#import <NSData+KMKit.h>
#import <NSString+KMKit.h>
#import <NSArray+KMKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    double delayInSeconds = .28;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self executeNSData];
        [self executeNSString];
        [self executeNSArray];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)executeNSData
{
    NSString *key = @"1vscka4m1m3bdlar";
    NSString *originalText = @"Hello World";
    NSLog(@"key >>> %@", key);

    NSData *originalData = [originalText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptedData = [originalData AES128EncryptedDataWithKey:key];
    NSLog(@"originalText >>> %@", originalText);
    NSLog(@"originalData >>> %@", originalData);
    NSLog(@"encryptedData >>> %@", encryptedData);

    NSData *decryptedData = [encryptedData AES128DecryptedDataWithKey:key];
    NSString *decodeText = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
    NSLog(@"decryptedData >>> %@", decryptedData);
    NSLog(@"decodeText >>> %@", decodeText);
}

- (void)executeNSString
{
    NSLog(@"======== encode & decode URIComponent ========");
    NSString *text = @"ハローワールド";
    NSString *encodedText = [text km_encodeURIComponent];
    NSLog(@"URI encode >>> %@", encodedText);
    NSLog(@"URI decode >>> %@", [encodedText km_decodeURIComponent]);

    NSLog(@"======== isPresent ========");
    text = @"";
    NSLog(@"[%@] is present? : %@", text, @([text km_isPresent]));
    text = @" This is a pen.";
    NSLog(@"[%@] is present? : %@", text, @([text km_isPresent]));
    text = @"　 ";
    NSLog(@"[%@] is present? : %@", text, @([text km_isPresent]));

    NSLog(@"======== isNumeric ========");
    text = @"";
    NSLog(@"[%@] is numeric? : %@", text, @([text km_isNumeric]));
    text = @"abe";
    NSLog(@"[%@] is numeric? : %@", text, @([text km_isNumeric]));
    text = @"123";
    NSLog(@"[%@] is numeric? : %@", text, @([text km_isNumeric]));
    text = @"1a23";
    NSLog(@"[%@] is numeric? : %@", text, @([text km_isNumeric]));
    text = @"123 ";
    NSLog(@"[%@] is numeric? : %@", text, @([text km_isNumeric]));

    text = @"foo=123&bar=テスト";
    NSLog(@"parse query string >>> %@", [text km_parsedQueryString]);
    text = @" foo　テスト   bar buz   ";
    NSLog(@"collapse stripped whitespace >>> [%@]", [text km_stringByCollapsingStrippedWhitespacing]);
}

- (void)executeNSArray
{
    NSArray *array = @[@"apple", @"banana", @"grape"];
    NSLog(@"%@", [array km_join:@" & "]);
    NSArray *maps = [array km_mapUsingBlock:^id(id obj) {
        NSString *element = obj;
        return @([element length]);
    }];
    NSLog(@"%@", maps);
}

@end
