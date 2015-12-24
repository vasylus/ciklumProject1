//
//  CollectionViewCell.h
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 21.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Store <NSObject>

- (void)fillWithObject:(id)object atIndex:(NSIndexPath *)indexPath;

@end

@interface CollectionViewCell : UICollectionViewCell<Store>

@end
