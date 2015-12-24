//
//  NetworkProvide.h
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 24.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkProvide : NSObject

+ (void)getRepors:(void(^)(id objects))successBlock;

@end
