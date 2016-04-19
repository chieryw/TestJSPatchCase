//
//  DDNetwork.m
//  TestJSCase
//
//  Created by chiery on 16/4/15.
//  Copyright © 2016年 My-Zone. All rights reserved.
//

#import "DDNetwork.h"
#import "TestProtocol.h"

@interface DDNetwork ()
@property (nonatomic, strong) NSMutableData *data;
@end

@implementation DDNetwork

- (instancetype)init
{
    self = [super init];
    if (self) {
        [NSURLProtocol registerClass:[TestProtocol class]];
    }
    return self;
}

- (void)startTest {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://baidu.com"]];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
         NSLog(@"接收到服务器的响应");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"请求完成");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"出错了");
}

- (NSMutableData *)data {
    if (!_data) {
        _data = [NSMutableData new];
    }
    return _data;
}


@end
