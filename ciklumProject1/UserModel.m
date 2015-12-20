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

        self.userName = [[[dictionary valueForKey:@"user"] valueForKey:@"name"] valueForKey:@"first"];
        self.userLastName = [[[dictionary valueForKey:@"user"] valueForKey:@"name"] valueForKey:@"last"];
        self.userPicturePath = [[[dictionary valueForKey:@"user"] valueForKey:@"picture"] valueForKey:@"thumbnail"];
      }
    
    return self;
}

@end
