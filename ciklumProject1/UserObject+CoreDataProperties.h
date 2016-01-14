//
//  UserObject+CoreDataProperties.h
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 13.01.16.
//  Copyright © 2016 Vasyl Vasylchenko. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "UserObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserObject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) User *userObjetToUser;

@end

NS_ASSUME_NONNULL_END
