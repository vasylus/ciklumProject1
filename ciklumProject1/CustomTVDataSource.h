//
//  CustomTVDataSource.h
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 15.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol StoreOfTableView <NSObject>

- (void)addObject:(NSString *)string inTbaleView:(UITableView *)tableView;
- (void)removeOBject:(UITableView *)tableView;
 
@end


@interface CustomTVDataSource : NSObject <StoreOfTableView>

 - (instancetype)initWithTableView:(UITableView *)tableView;
@property NSMutableArray * arrayOfObject;

@end


