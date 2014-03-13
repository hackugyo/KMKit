//
//  ViewController.m
//  KMKit
//
//  Created by Kosuke Matsuda on 2014/03/13.
//  Copyright (c) 2014年 matsuda. All rights reserved.
//

#import "ViewController.h"
#import "NSData+KMKit.h"

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

@end
