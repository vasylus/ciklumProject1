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

- (void)addObjectToCollectionView:(UICollectionView *)collectionView;
- (void)removeOBjectFromCollectionView:(UICollectionView *)collectionView;

@end


@interface CustomTVDataSource : NSObject <StoreOfTableView>

@property NSMutableArray * arrayOfObject;
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;


@end


