//
//  CustomTableViewCell.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 15.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation CustomTableViewCell

-(void)fillWithObject:(id)object{
    
    self.myLabel.text = object;
     self.myImage.image = [UIImage imageNamed:@"myImage"];
}



@end
