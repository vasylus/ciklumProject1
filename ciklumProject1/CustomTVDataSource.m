//
//  CustomTVDataSource.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 15.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import "CustomTVDataSource.h"
#import "CustomTableViewCell.h"
#import "ViewController.h"


@interface CustomTVDataSource()<UITableViewDataSource, UITableViewDelegate>
  
@property ViewController * viewController;

@end


@implementation CustomTVDataSource

-(instancetype)initWithTableView:(UITableView *)tableView{
 
    
    if (self = [super init]) {
         [self configure:tableView];
        self.arrayOfObject = @[@"1"].mutableCopy;
 
     }
    
    return self;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arrayOfObject.count;
}

- (void)configure:(UITableView *)tableView
{
    tableView.dataSource  = self;
    tableView.delegate = self;
    
    [tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil]
    forCellReuseIdentifier:NSStringFromClass([CustomTableViewCell class])];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomTableViewCell class])];
    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:NSStringFromClass([CustomTableViewCell class])];
    }
    [cell fillWithObject: self.arrayOfObject[indexPath.row]];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)addObject:(NSString *)string inTbaleView:(UITableView *)tableView{
    [self.arrayOfObject addObject:string];

    [tableView reloadData];

}

- (void)removeOBject:(UITableView *)tableView{
    [self.arrayOfObject removeLastObject];

    [tableView reloadData];
}


@end


