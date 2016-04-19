//
//  TestProtocol.m
//  TestJSCase
//
//  Created by chiery on 16/4/15.
//  Copyright © 2016年 My-Zone. All rights reserved.
//

#import "TestProtocol.h"

@implementation TestProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    NSLog(@"当前线程：%@",[NSThread currentThread]);
    return YES;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
}

+ (BOOL)requestIsCacheEquivalent:(NSURLRequest *)a toRequest:(NSURLRequest *)b {
    return [super requestIsCacheEquivalent:a toRequest:b];
}

- (void)startLoading {

}

- (void)stopLoading {

}

@end
