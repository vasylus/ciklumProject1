//
//  IndexHelper.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 23.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import "IndexHelper.h"

@implementation IndexHelper

+ (NSIndexPath *)myIndexPath:(UICollectionView *)collectionView{
    NSInteger sections = 0;
    NSInteger rows = [collectionView numberOfItemsInSection:sections];
    
    if (rows == NSNotFound) {
        rows = 0;
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rows inSection:sections];
    return indexPath;
}


@end
