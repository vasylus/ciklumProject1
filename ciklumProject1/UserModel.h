//
//  UserModel.h
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 18.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic , strong) NSString * userName;
@property (nonatomic , strong) NSString * userLastName;
@property (nonatomic , strong) NSString * userPicturePath;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
