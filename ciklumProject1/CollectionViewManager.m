//
//  CollectionViewManager.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 11.01.16.
//  Copyright © 2016 Vasyl Vasylchenko. All rights reserved.
//

#import "CollectionViewManager.h"
#import "CustomTVDataSource.h"
#import "NetworkProvide.h"
#import "UserModel.h"
#import "IndexHelper.h"
#import "User+CoreDataProperties.h"
#import "NSArray+ContainsString.h"

@interface CollectionViewManager ()
@property (strong, nonatomic) CustomTVDataSource *datasource;
@property (strong, nonatomic) User *userCD;
@property (strong, nonatomic) UserModel *user;

@end

@implementation CollectionViewManager


- (instancetype)initWithCollectionView:(UICollectionView *)collectionView{
    if (self = [super init]){
    self.datasource = [[CustomTVDataSource alloc] initWithCollectionView:collectionView];
        for (id obj in [User MR_findAll]){
        [self.datasource.arrayOfObject addObject:obj];
        }}
    return self;
}

- (void)addObjectToCollectionView:(UICollectionView *)collectionView{
    [NetworkProvide getRepors:^(id objects) {
        for (NSDictionary *dictionary in [objects valueForKey:@"results"]) {
            self.user = [[UserModel alloc] initWithDictionary:dictionary];
            [self.datasource.arrayOfObject addObject:self.user];
        }
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [collectionView insertItemsAtIndexPaths:@[[IndexHelper myIndexPath:collectionView]]];
        });
    }];
}

- (void)removeOBjectFromCollectionView:(UICollectionView *)collectionView{
    if (self.datasource.arrayOfObject.count){
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.datasource.arrayOfObject.count -1 inSection:0];
        if (self.datasource.selctedIndexPath){
            
            [self.datasource.arrayOfObject removeObjectAtIndex:self.datasource.selctedIndexPath.row];
            [collectionView deleteItemsAtIndexPaths:@[self.datasource.arrayOfIndexPathes.lastObject]];
            self.datasource.selctedIndexPath = nil;
        }else{
            
            [self.datasource.arrayOfObject removeLastObject];
            [collectionView deleteItemsAtIndexPaths:@[indexPath]];
        }
    }
}

- (void)saveToCoreData{
    if (self.datasource.arrayOfObject.count == 0){
        [User MR_truncateAll];
    }
    for (id object in [self.datasource.arrayOfObject valueForKey:@"imageData"]){
        if (![NSArray containsString:object inArray:[[User MR_findAll] valueForKey:@"imageData"]]){
    self.userCD = [User MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
    self.userCD.imageData = object;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError *error) {
        
    }];}}
}

@end
