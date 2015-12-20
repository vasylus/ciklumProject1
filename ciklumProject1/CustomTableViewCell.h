    //
//  CustomTableViewCell.h
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 15.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DataForCell <NSObject>

- (void)fillWithObject:(id)object atIndex:(NSIndexPath *)indexPath;

@end


@interface CustomTableViewCell : UITableViewCell<DataForCell>
 
@end
