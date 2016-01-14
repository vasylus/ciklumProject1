//
//  CustomTVDataSource.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 15.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import "CustomTVDataSource.h"
#import "UserModel.h"
#import "CollectionViewCell.h"
#import "IndexHelper.h"
#import "NetworkProvide.h"
#import "CollectionViewManager.h"
#import "User.h"

@interface CustomTVDataSource()<UICollectionViewDelegate, UICollectionViewDataSource>

@end



@implementation CustomTVDataSource

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView{
    
    if (self = [super init]) {
        self.arrayOfIndexPathes = @[].mutableCopy;
        self.arrayOfObject = @[].mutableCopy;
        [self configureMyCollectionView:collectionView];
    }
    return self;
}

- (void)configureMyCollectionView:(UICollectionView*)collectionView{
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView setBackgroundColor:[UIColor whiteColor]];
    
    [collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
}

#pragma mark - collectionView

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    [cell fillWithObject:self.arrayOfObject[indexPath.row] atIndex:indexPath];

     return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrayOfObject.count;

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80, 80);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.arrayOfIndexPathes addObject:indexPath];
    self.selctedIndexPath = indexPath;
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor lightGrayColor]];
}

@end


