//
//  NSArray+ContainsString.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 14.01.16.
//  Copyright © 2016 Vasyl Vasylchenko. All rights reserved.
//

#import "NSArray+ContainsString.h"

@implementation NSArray (ContainsString)

+ (BOOL)containsString:(NSString *)string inArray:(NSArray *)array{
    for (NSString* str in array) {
        if ([str isEqualToString:string])
            return YES;
    }
    return NO;
}


@end
