//
//  ViewController.h
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 10.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Store <NSObject>

- (void)addObject : (NSString*)string;
- (void)removeOBject;

@end

@interface ViewController : UIViewController



@end


@interface MyClass : NSObject <Store>

@property NSMutableArray * arrayOfObject;

@end

