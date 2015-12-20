//
//  CustomTVDataSource.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 15.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import "CustomTVDataSource.h"
#import "CustomTableViewCell.h"
#import "UserModel.h"

static NSString * serverPath = @"https://randomuser.me/api/";

@interface CustomTVDataSource()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation CustomTVDataSource

- (instancetype)initWithTableView:(UITableView *)tableView{
    
    if (self = [super init]) {
        self.arrayOfObject = @[].mutableCopy;
        [self configure:tableView];
    }
    
    return self;
}

- (void)configure:(UITableView *)tableView{
    tableView.dataSource  = self;
    tableView.delegate = self;
    
    [tableView reloadData];
    
    [tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil]
    forCellReuseIdentifier:NSStringFromClass([CustomTableViewCell class])];
 }

- (void)addObject:(UITableView *)tableView{
     [self getRepors:^(id objects) {
        for (NSDictionary *dictionary in [objects valueForKey:@"results"]) {
             UserModel *user = [[UserModel alloc] initWithDictionary:dictionary];
             [self.arrayOfObject addObject:user];
           }
          dispatch_async(dispatch_get_main_queue(), ^(void){
             
             [tableView beginUpdates];
             [tableView insertRowsAtIndexPaths:@[[self myIndexPath:tableView]] withRowAnimation:UITableViewRowAnimationRight];
             [tableView endUpdates];
         });

    }];

}

-(NSIndexPath *)myIndexPath:(UITableView *)tableView{
    NSInteger sections = 0;
    NSInteger rows = [tableView numberOfRowsInSection:sections];
    
    if (rows == NSNotFound) {
        rows = 0;
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rows inSection:sections];
    return indexPath;
}

- (void)getRepors:(void(^)(id objects))successBlock{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURL *url = [NSURL URLWithString:serverPath];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id object = [NSJSONSerialization JSONObjectWithData:data
                                                    options:0
                                                      error:nil];
        if (successBlock){
            successBlock(object);
        }
    }];
    
    [task resume];
}

- (void)removeOBject:(UITableView *)tableView{
    if (self.arrayOfObject.count) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.arrayOfObject.count - 1 inSection:0];
        
        [self.arrayOfObject removeLastObject];
        
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [tableView endUpdates];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayOfObject.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomTableViewCell class])];
     [cell fillWithObject:self.arrayOfObject[indexPath.row] atIndex:indexPath];
     return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     return 100;
}

@end


