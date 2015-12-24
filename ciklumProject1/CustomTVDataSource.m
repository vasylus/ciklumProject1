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

@interface CustomTVDataSource()<UICollectionViewDelegate, UICollectionViewDataSource>

@property NSMutableArray *arrayOfIndexPathes;
@property NSIndexPath *selctedIndexPath;

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

- (void)removeOBjectFromCollectionView:(UICollectionView *)collectionView{
    if (self.arrayOfObject.count){
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.arrayOfObject.count -1 inSection:0];
            if (self.selctedIndexPath){
                
                [self.arrayOfObject removeObjectAtIndex:self.selctedIndexPath.row];
                [collectionView deleteItemsAtIndexPaths:@[self.arrayOfIndexPathes.lastObject]];
                self.selctedIndexPath = nil;
                  }else{
                      
                  [self.arrayOfObject removeLastObject];
                  [collectionView deleteItemsAtIndexPaths:@[indexPath]];
            }
     }
}

- (void)addObjectToCollectionView:(UICollectionView *)collectionView{
    [NetworkProvide getRepors:^(id objects) {
        for (NSDictionary *dictionary in [objects valueForKey:@"results"]) {
            UserModel *user = [[UserModel alloc] initWithDictionary:dictionary];
            [self.arrayOfObject addObject:user];
        }
        dispatch_async(dispatch_get_main_queue(), ^(void){
                [collectionView insertItemsAtIndexPaths:@[[IndexHelper myIndexPath:collectionView]]];
        });
     }];
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


