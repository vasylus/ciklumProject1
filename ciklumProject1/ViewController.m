//
//  ViewController.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 10.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import "ViewController.h"
#import "CustomTVDataSource.h"

@interface ViewController ()

@property (nonatomic, strong) CustomTVDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadMyCollectionView];
 }

- (void)loadMyCollectionView{
    self.dataSource = [[CustomTVDataSource alloc] initWithCollectionView:self.collectionView];
 }

- (IBAction)addButton:(id)sender{
    [self.dataSource addObjectToCollectionView:self.collectionView];
 }

- (IBAction)deleteButton:(id)sender{
    [self.dataSource removeOBjectFromCollectionView:self.collectionView];
 }


@end








