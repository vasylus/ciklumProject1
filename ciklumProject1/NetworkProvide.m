//
//  NetworkProvide.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 24.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import "NetworkProvide.h"

static NSString *serverPath = @"https://randomuser.me/api/";

@implementation NetworkProvide

+ (void)getRepors:(void(^)(id objects))successBlock{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURL *url = [NSURL URLWithString:serverPath];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id object = [NSJSONSerialization JSONObjectWithData:data
                                                    options:0
                                                      error:nil];
        if (successBlock){
            successBlock(object);
        }
    }];
    [task resume];
}

@end
