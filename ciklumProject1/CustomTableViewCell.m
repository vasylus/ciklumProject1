//
//  CustomTableViewCell.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 15.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "NSString+MD5.h"

@interface CustomTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;


@end

@implementation CustomTableViewCell

- (void)fillWithObject:(id)object atIndex:(NSIndexPath *)indexPath{
    NSString * name = [NSString stringWithFormat:@"%@",[object valueForKey:@"userName"]];
    NSString * lastName = [NSString stringWithFormat:@"%@",[object valueForKey:@"userLastName"]];
    NSString * url = [NSString stringWithFormat:@"%@", [object valueForKey:@"userPicturePath"]];
    
    self.myLabel.text =[NSString stringWithFormat:@"%@ %@", name , lastName];
        
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        NSString *md5 = [NSString MD5StringWithString:url];
        
        NSMutableString *path = [NSString applicationDocumentsDirectory];
        [path appendFormat:@"/%@.png", md5];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        if (!data) {
            data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
            [data writeToFile:path atomically:YES];
        }
        UIImage *img = [UIImage imageWithData:data];

        dispatch_async(dispatch_get_main_queue(), ^(void){
            self.myImage.image = img;
        });
    });
}



@end
