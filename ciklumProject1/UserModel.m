//
//  UserModel.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 18.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
     if (self = [super init]){
         NSDictionary *dic = dictionary[@"user"];
         self.userPicturePath = dic[@"picture"][@"thumbnail"];
      }
    return self;
}

@end
