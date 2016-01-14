//
//  CollectionViewManager.h
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 11.01.16.
//  Copyright © 2016 Vasyl Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionViewManager : NSObject

@property NSMutableArray *arrayOfObjectManager;

- (void)removeOBjectFromCollectionView:(UICollectionView *)collectionView;
- (void)addObjectToCollectionView:(UICollectionView *)collectionView;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;
- (void)saveToCoreData;


@end
