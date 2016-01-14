//
//  User+CoreDataProperties.h
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 13.01.16.
//  Copyright © 2016 Vasyl Vasylchenko. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *imageData;
@property (nullable, nonatomic, retain) UserObject *userToUserObject;

@end

NS_ASSUME_NONNULL_END
