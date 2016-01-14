//
//  CustomTVDataSource.h
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 15.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface CustomTVDataSource : NSObject

@property NSIndexPath *selctedIndexPath;
@property NSMutableArray *arrayOfIndexPathes;
@property (strong, nonatomic) NSMutableArray *arrayOfObject;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;

@end


