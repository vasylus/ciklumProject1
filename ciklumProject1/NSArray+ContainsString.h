//
//  NSArray+ContainsString.h
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 14.01.16.
//  Copyright © 2016 Vasyl Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ContainsString)

+ (BOOL)containsString:(NSString *)string inArray:(NSArray *)array;

@end
