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
    
    [self loadMyTableView];
    
 }

-(void)loadMyTableView{
        self.dataSource = [[CustomTVDataSource alloc] initWithTableView:self.theTable];
 }

- (IBAction)addButton:(id)sender {
    [self.dataSource addObject:self.textFieldOutlet.text inTbaleView:self.theTable];
}

- (IBAction)deleteButton:(id)sender {
    [self.dataSource removeOBject:self.theTable];
 }


@end








