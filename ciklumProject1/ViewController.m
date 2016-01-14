//
//  ViewController.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 10.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import "ViewController.h"
#import "CustomTVDataSource.h"
#import "CollectionViewManager.h"

@interface ViewController ()

@property (nonatomic, strong) CustomTVDataSource *dataSource;
@property (nonatomic, strong) CollectionViewManager * collectionManager;

@end



@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self loadMyCollectionView];
 }

- (void)loadMyCollectionView{
    self.collectionManager = [[CollectionViewManager alloc] initWithCollectionView:self.collectionView];
 }

- (IBAction)addButton:(id)sender{
    [self.collectionManager addObjectToCollectionView:self.collectionView];
 }

- (IBAction)deleteButton:(id)sender{
    [self.collectionManager removeOBjectFromCollectionView:self.collectionView];
 }

- (IBAction)saveAction:(id)sender {
    [self.collectionManager saveToCoreData];
 }

@end








